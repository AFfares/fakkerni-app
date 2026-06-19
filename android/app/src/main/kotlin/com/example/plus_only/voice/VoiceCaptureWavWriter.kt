package com.example.plus_only.voice

import java.io.File
import java.io.FileOutputStream
import java.nio.ByteBuffer
import java.nio.ByteOrder

internal object VoiceCaptureWavWriter {
    fun write(file: File, samples: List<ShortArray>, sampleRate: Int) {
        val totalSamples = samples.sumOf { it.size }
        val dataSize = totalSamples * 2

        FileOutputStream(file).use { output ->
            output.write(createHeader(sampleRate, dataSize))
            val buffer = ByteBuffer.allocate(4096).order(ByteOrder.LITTLE_ENDIAN)

            for (frame in samples) {
                buffer.clear()
                for (sample in frame) {
                    if (buffer.remaining() < 2) {
                        output.write(buffer.array(), 0, buffer.position())
                        buffer.clear()
                    }
                    buffer.putShort(sample)
                }
                output.write(buffer.array(), 0, buffer.position())
            }
        }
    }

    private fun createHeader(sampleRate: Int, dataSize: Int): ByteArray {
        val header = ByteBuffer.allocate(44).order(ByteOrder.LITTLE_ENDIAN)
        header.put("RIFF".toByteArray())
        header.putInt(36 + dataSize)
        header.put("WAVE".toByteArray())
        header.put("fmt ".toByteArray())
        header.putInt(16)
        header.putShort(1)
        header.putShort(1)
        header.putInt(sampleRate)
        header.putInt(sampleRate * 2)
        header.putShort(2)
        header.putShort(16)
        header.put("data".toByteArray())
        header.putInt(dataSize)
        return header.array()
    }
}