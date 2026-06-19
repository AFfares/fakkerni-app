package com.example.plus_only.voice

import android.media.AudioFormat
import android.media.AudioRecord
import android.media.MediaRecorder
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Intent
import android.os.Build
import android.os.SystemClock
import android.os.IBinder
import android.util.Log
import androidx.core.app.NotificationCompat
import com.example.plus_only.R
import java.io.File
import java.util.concurrent.atomic.AtomicBoolean
import kotlin.math.sqrt

class VoiceCaptureService : Service() {

    private val isRunning = AtomicBoolean(false)
    private var captureThread: Thread? = null

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if (isRunning.compareAndSet(false, true)) {
            captureThread = Thread {
                runCaptureLoop()
            }.also { it.start() }
        }

        ensureChannel()

        val notification = NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle("Fakkerni")
            .setContentText("Listening for a reminder")
            .setSmallIcon(R.mipmap.ic_launcher)
            .setOngoing(true)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .build()

        startForeground(FOREGROUND_ID, notification)
        return START_STICKY
    }

    override fun onDestroy() {
        isRunning.set(false)
        captureThread?.interrupt()
        captureThread = null
        super.onDestroy()
    }

    private fun ensureChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                "Fakkerni voice capture",
                NotificationManager.IMPORTANCE_LOW,
            )
            val manager = getSystemService(NotificationManager::class.java)
            manager.createNotificationChannel(channel)
        }
    }

    private fun runCaptureLoop() {
        val sampleRate = 16_000
        val minBuffer = AudioRecord.getMinBufferSize(
            sampleRate,
            AudioFormat.CHANNEL_IN_MONO,
            AudioFormat.ENCODING_PCM_16BIT,
        )

        if (minBuffer == AudioRecord.ERROR || minBuffer == AudioRecord.ERROR_BAD_VALUE) {
            VoiceCaptureEventBus.error("audio_record_error", "AudioRecord buffer could not be created.")
            stopSelf()
            return
        }

        val audioRecord = AudioRecord(
            MediaRecorder.AudioSource.VOICE_RECOGNITION,
            sampleRate,
            AudioFormat.CHANNEL_IN_MONO,
            AudioFormat.ENCODING_PCM_16BIT,
            minBuffer * 2,
        )

        if (audioRecord.state != AudioRecord.STATE_INITIALIZED) {
            VoiceCaptureEventBus.error("audio_record_error", "Unable to initialize the microphone recorder.")
            audioRecord.release()
            stopSelf()
            return
        }

        val shortBuffer = ShortArray(minBuffer)
        val preRollFrames = ArrayDeque<ShortArray>(6)
        val capturedFrames = mutableListOf<ShortArray>()
        var isSpeech = false
        var speechFrames = 0
        var silenceFrames = 0
        val startThreshold = 0.014
        val stopThreshold = 0.009
        val startFrameCount = 3
        val stopFrameCount = 16
        val idleTimeoutMs = 12_000L
        val maxCaptureMs = 20_000L
        val sessionStart = SystemClock.elapsedRealtime()

        try {
            audioRecord.startRecording()

            while (isRunning.get()) {
                val read = audioRecord.read(shortBuffer, 0, shortBuffer.size)
                if (read <= 0) {
                    continue
                }

                val frame = shortBuffer.copyOf(read)
                val rms = calculateRms(frame)

                if (!isSpeech) {
                    preRollFrames.addLast(frame)
                    while (preRollFrames.size > 6) {
                        preRollFrames.removeFirst()
                    }

                    if (rms >= startThreshold) {
                        speechFrames += 1
                    } else {
                        speechFrames = 0
                    }

                    if (speechFrames >= startFrameCount) {
                        isSpeech = true
                        capturedFrames.addAll(preRollFrames)
                        preRollFrames.clear()
                        capturedFrames.add(frame)
                    } else if (SystemClock.elapsedRealtime() - sessionStart > idleTimeoutMs) {
                        VoiceCaptureEventBus.error(
                            "voice_timeout",
                            "No speech was detected before the capture session timed out.",
                        )
                        break
                    }
                } else {
                    capturedFrames.add(frame)
                    if (rms < stopThreshold) {
                        silenceFrames += 1
                    } else {
                        silenceFrames = 0
                    }

                    if (silenceFrames >= stopFrameCount ||
                        SystemClock.elapsedRealtime() - sessionStart > maxCaptureMs
                    ) {
                        break
                    }
                }
            }

            if (capturedFrames.isNotEmpty()) {
                val outputFile = File(cacheDir, "voice_capture_${System.currentTimeMillis()}.wav")
                VoiceCaptureWavWriter.write(outputFile, capturedFrames, sampleRate)
                VoiceCaptureEventBus.emit(
                    mapOf(
                        "type" to "audio_ready",
                        "audioPath" to outputFile.absolutePath,
                        "durationMs" to (SystemClock.elapsedRealtime() - sessionStart),
                    ),
                )
            }
        } catch (error: Throwable) {
            Log.e("VoiceCaptureService", "Voice capture failed", error)
            VoiceCaptureEventBus.error(
                "voice_capture_failed",
                error.message ?: "Voice capture failed.",
            )
        } finally {
            isRunning.set(false)
            audioRecord.stop()
            audioRecord.release()
            stopSelf()
        }
    }

    private fun calculateRms(frame: ShortArray): Double {
        var sum = 0.0
        for (sample in frame) {
            val normalized = sample / 32768.0
            sum += normalized * normalized
        }

        return sqrt(sum / frame.size)
    }

    companion object {
        private const val CHANNEL_ID = "fakkerni_voice_capture"
        private const val FOREGROUND_ID = 4101
    }
}
