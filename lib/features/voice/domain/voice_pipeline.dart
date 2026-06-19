enum VoicePipelineState {
  idle,
  preparing,
  listening,
  processing,
  saving,
  completed,
  failed,
}

class VoicePipelineSnapshot {
  const VoicePipelineSnapshot({
    required this.state,
    this.transcript = '',
    this.audioPath,
    this.errorMessage,
  });

  final VoicePipelineState state;
  final String transcript;
  final String? audioPath;
  final String? errorMessage;

  VoicePipelineSnapshot copyWith({
    VoicePipelineState? state,
    String? transcript,
    String? audioPath,
    String? errorMessage,
  }) {
    return VoicePipelineSnapshot(
      state: state ?? this.state,
      transcript: transcript ?? this.transcript,
      audioPath: audioPath ?? this.audioPath,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
