import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../voice/application/voice_pipeline_controller.dart';
import '../voice/domain/voice_pipeline.dart';

class VoiceOverlayScreen extends ConsumerStatefulWidget {
  const VoiceOverlayScreen({super.key});

  static const routeName = '/voice-overlay';

  @override
  ConsumerState<VoiceOverlayScreen> createState() => _VoiceOverlayScreenState();
}

class _VoiceOverlayScreenState extends ConsumerState<VoiceOverlayScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(voicePipelineControllerProvider.notifier).beginSession(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final snapshot = ref.watch(voicePipelineControllerProvider);

    return Scaffold(
      backgroundColor: const Color(0xE6F7FBFF),
      body: SafeArea(
        child: Stack(
          children: [
            const _BlurBackdrop(),
            Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.88),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _titleForState(snapshot.state),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _subtitleForState(snapshot),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    if (snapshot.transcript.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Text(
                        snapshot.transcript,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                                width: 12,
                                height: 48 + (index % 2) * 16.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(999),
                                ),
                              )
                              .animate(
                                onPlay: (controller) => controller.repeat(),
                              )
                              .scaleY(
                                begin: 0.7,
                                end: 1.1,
                                duration: (220 + index * 80).ms,
                              ),
                        );
                      }),
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: () async {
                        await ref
                            .read(voicePipelineControllerProvider.notifier)
                            .abortSession();
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Dismiss'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _titleForState(VoicePipelineState state) {
  switch (state) {
    case VoicePipelineState.idle:
      return 'Ready';
    case VoicePipelineState.preparing:
      return 'Preparing...';
    case VoicePipelineState.listening:
      return 'Listening...';
    case VoicePipelineState.processing:
      return 'Processing...';
    case VoicePipelineState.saving:
      return 'Saving...';
    case VoicePipelineState.completed:
      return 'Saved';
    case VoicePipelineState.failed:
      return 'Could not start';
  }
}

String _subtitleForState(VoicePipelineSnapshot snapshot) {
  if (snapshot.errorMessage != null) {
    return snapshot.errorMessage!;
  }

  switch (snapshot.state) {
    case VoicePipelineState.idle:
      return 'Drag the tab to start speaking.';
    case VoicePipelineState.preparing:
      return 'Checking permissions and starting capture.';
    case VoicePipelineState.listening:
      return 'Speak naturally. Silence will end recording automatically.';
    case VoicePipelineState.processing:
      return 'Turning speech into a reminder.';
    case VoicePipelineState.saving:
      return 'Saving locally on the device.';
    case VoicePipelineState.completed:
      return 'The reminder is saved and ready.';
    case VoicePipelineState.failed:
      return 'Grant microphone permission and try again.';
  }
}

class _BlurBackdrop extends StatelessWidget {
  const _BlurBackdrop();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white.withValues(alpha: 0.72),
              const Color(0xFFDDEBFF).withValues(alpha: 0.72),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
