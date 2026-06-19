import 'package:flutter/services.dart';

class AndroidPipelineBridge {
  AndroidPipelineBridge._();

  static const MethodChannel _channel = MethodChannel(
    'com.example.plus_only/fakkerni_pipeline',
  );

  static const EventChannel _voiceCaptureEvents = EventChannel(
    'com.example.plus_only/voice_capture_events',
  );

  static Future<bool> hasMicrophonePermission() async {
    try {
      return (await _channel.invokeMethod<bool>('hasMicrophonePermission')) ??
          false;
    } on MissingPluginException {
      return false;
    }
  }

  static Future<bool> hasOverlayPermission() async {
    try {
      return (await _channel.invokeMethod<bool>('hasOverlayPermission')) ??
          false;
    } on MissingPluginException {
      return false;
    }
  }

  static Future<void> openOverlaySettings() async {
    try {
      await _channel.invokeMethod<void>('openOverlaySettings');
    } on MissingPluginException {
      return;
    }
  }

  static Future<void> startVoiceCaptureService() async {
    try {
      await _channel.invokeMethod<void>('startVoiceCaptureService');
    } on MissingPluginException {
      return;
    }
  }

  static Future<void> stopVoiceCaptureService() async {
    try {
      await _channel.invokeMethod<void>('stopVoiceCaptureService');
    } on MissingPluginException {
      return;
    }
  }

  static Stream<Map<String, dynamic>> voiceCaptureEvents() {
    try {
      return _voiceCaptureEvents.receiveBroadcastStream().map((event) {
        if (event is Map) {
          return event.map((key, value) => MapEntry(key.toString(), value));
        }

        return <String, dynamic>{'type': 'unknown', 'payload': event};
      });
    } on MissingPluginException {
      return const Stream<Map<String, dynamic>>.empty();
    }
  }
}
