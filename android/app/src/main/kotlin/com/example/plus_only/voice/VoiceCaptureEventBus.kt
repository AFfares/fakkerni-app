package com.example.plus_only.voice

import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.EventChannel

object VoiceCaptureEventBus {
    private val mainHandler = Handler(Looper.getMainLooper())
    private var eventSink: EventChannel.EventSink? = null

    fun attach(sink: EventChannel.EventSink?) {
        eventSink = sink
    }

    fun detach() {
        eventSink = null
    }

    fun emit(event: Map<String, Any?>) {
        mainHandler.post {
            eventSink?.success(event)
        }
    }

    fun error(code: String, message: String) {
        mainHandler.post {
            eventSink?.error(code, message, null)
        }
    }
}