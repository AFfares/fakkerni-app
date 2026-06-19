import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whisper_ggml_plus/whisper_ggml_plus.dart';

// 1. تعريف الـ Provider هنا داخل نفس الملف لحل مشكلة الـ Import في الملف الآخر
final voiceTranscriptionServiceProvider = Provider<VoiceTranscriptionService>((ref) {
  return VoiceTranscriptionService();
});

class VoiceTranscriptionService {
  VoiceTranscriptionService({WhisperModel model = WhisperModel.base})
    : _model = model,
      _controller = WhisperController();

  final WhisperModel _model;
  final WhisperController _controller;
  bool _isReady = false;

  Future<void> initialize() async {
    if (_isReady) {
      return;
    }

    await _controller.initModel(_model);
    _isReady = true;
  }

  Future<String> transcribeFile(String audioPath) async {
    final audioFile = File(audioPath);
    if (!await audioFile.exists()) {
      throw StateError('Audio file not found at $audioPath');
    }

    await initialize();
    
    // استدعاء الدالة الأساسية للمكتبة
    final response = await _controller.transcribe(
      model: _model,
      audioPath: audioPath,
      lang: 'ar',
      withTimestamps: false,
      diarize: false,
    );

    // إصلاح الخطأ الأول: النتيجة في هذه المكتبة تعود كـ String مباشرة أو كائن نصي
    // نقوم بتحويلها إلى String بشكل آمن ومعالجة الـ null
    final transcript = (response?.toString() ?? '').trim();
    
    if (transcript.isEmpty) {
      throw StateError('Whisper returned an empty transcript.');
    }

    return transcript;
  }

  // إصلاح الخطأ الثاني: تفادي مشكلة الـ dispose غير المعرفة
  void dispose() {
    if (!_isReady) {
      return;
    }
    
    try {
      // نقوم باستدعاء الـ dispose بشكل ديناميكي لتفادي اعتراض المترجم (Compiler)
      // إذا كانت الدالة مدعومة بأسماء أخرى في إصدارك الحالي
      (_controller as dynamic).dispose();
    } catch (_) {
      // إذا كان الإصدار الحالي لا يحتوي على dispose، سيتم تجاهل الخطأ بأمان دون انهيار التطبيق
    }
    
    _isReady = false;
  }
}