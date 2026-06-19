import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../platform/android/android_pipeline_bridge.dart';
import '../domain/voice_pipeline.dart';
// 1. تأكد من إلغاء التعليق هنا لربط الملفين
import 'voice_transcription_service.dart'; 

// 2. يجب إضافة الـ Provider الخاص بالخدمة هنا إذا لم تكن قد أضفته في ملف الخدمة نفسه
final voiceTranscriptionServiceProvider = Provider<VoiceTranscriptionService>((ref) {
  return VoiceTranscriptionService();
});

final voicePipelineControllerProvider =
    NotifierProvider<VoicePipelineController, VoicePipelineSnapshot>(
      VoicePipelineController.new,
    );

class VoicePipelineController extends Notifier<VoicePipelineSnapshot> {
  StreamSubscription<Map<String, dynamic>>? _voiceEventsSubscription;
  bool _isSessionActive = false;

  @override
  VoicePipelineSnapshot build() {
    // 3. تأكد من إلغاء التعليق هنا لتهيئة متغير الخدمة داخل الـ build
    final transcriptionService = ref.read(voiceTranscriptionServiceProvider);

    _voiceEventsSubscription ??= AndroidPipelineBridge.voiceCaptureEvents()
        .listen((event) async {
          if (!_isSessionActive) {
            return;
          }

          final type = event['type']?.toString();
          if (type == 'audio_ready') {
            final audioPath = event['audioPath']?.toString();
            if (audioPath == null || audioPath.isEmpty) {
              state = state.copyWith(
                state: VoicePipelineState.failed,
                errorMessage: 'Voice capture completed without an audio file.',
              );
              return;
            }

            state = state.copyWith(
              state: VoicePipelineState.processing,
              audioPath: audioPath,
              errorMessage: null,
            );

            try {
              // الآن هذا السطر سيعمل بشكل سليم تماماً
              final transcript = await transcriptionService.transcribeFile(
                audioPath,
              );
              await finishSession(transcript: transcript, audioPath: audioPath);
            } catch (error, stackTrace) {
              debugPrint('Voice transcription failed: $error\n$stackTrace');
              state = state.copyWith(
                state: VoicePipelineState.failed,
                errorMessage: 'Unable to transcribe the captured voice note.',
              );
              await AndroidPipelineBridge.stopVoiceCaptureService();
              _isSessionActive = false;
            }
          } else if (type == 'error') {
            state = state.copyWith(
              state: VoicePipelineState.failed,
              errorMessage:
                  event['message']?.toString() ?? 'Voice capture stopped.',
            );
            await AndroidPipelineBridge.stopVoiceCaptureService();
            _isSessionActive = false;
          }
        });

    ref.onDispose(() {
      _voiceEventsSubscription?.cancel();
      transcriptionService.dispose(); 
    });

    return const VoicePipelineSnapshot(state: VoicePipelineState.idle);
  }

  Future<void> beginSession() async {
    _isSessionActive = true;
    state = state.copyWith(
      state: VoicePipelineState.preparing,
      errorMessage: null,
    );

    final hasMicPermission =
        await AndroidPipelineBridge.hasMicrophonePermission();
    if (!hasMicPermission) {
      state = state.copyWith(
        state: VoicePipelineState.failed,
        errorMessage: 'Microphone permission is required to capture reminders.',
      );
      return;
    }

    state = state.copyWith(state: VoicePipelineState.listening);
    await AndroidPipelineBridge.startVoiceCaptureService();
  }

  Future<void> finishSession({
    String transcript = '',
    String? audioPath,
  }) async {
    state = state.copyWith(
      state: VoicePipelineState.processing,
      transcript: transcript,
      audioPath: audioPath,
    );
    await AndroidPipelineBridge.stopVoiceCaptureService();
    _isSessionActive = false;
    state = state.copyWith(state: VoicePipelineState.completed);
  }

  Future<void> abortSession() async {
    await AndroidPipelineBridge.stopVoiceCaptureService();
    _isSessionActive = false;
    state = const VoicePipelineSnapshot(state: VoicePipelineState.idle);
  }
}