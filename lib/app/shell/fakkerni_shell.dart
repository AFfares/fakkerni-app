import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/home/home_screen.dart';
import '../../features/overlays/voice_overlay_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../features/timeline/timeline_screen.dart';
import '../state/shell_state.dart';

class FakkerniShell extends ConsumerWidget {
  const FakkerniShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shellState = ref.watch(shellStateProvider);

    final pages = <Widget>[
      const HomeScreen(),
      const TimelineScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(index: shellState.index, children: pages),
          const _FloatingVoiceTrigger(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: shellState.index,
        onDestinationSelected:
            (index) => ref.read(shellStateProvider.notifier).setIndex(index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.timeline_outlined),
            label: 'Timeline',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class _FloatingVoiceTrigger extends ConsumerWidget {
  const _FloatingVoiceTrigger();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final triggerOnLeft = ref.watch(
      shellStateProvider.select((value) => value.triggerOnLeft),
    );

    return Positioned(
      top: MediaQuery.of(context).padding.top + 140,
      left: triggerOnLeft ? 8 : null,
      right: triggerOnLeft ? null : 8,
      child: GestureDetector(
        onTap:
            () => Navigator.of(context).pushNamed(VoiceOverlayScreen.routeName),
        child: Container(
              width: 16,
              height: 96,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.horizontal(
                  left:
                      triggerOnLeft
                          ? const Radius.circular(0)
                          : const Radius.circular(20),
                  right:
                      triggerOnLeft
                          ? const Radius.circular(20)
                          : const Radius.circular(0),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x2479B9F9),
                    blurRadius: 20,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
            )
            .animate()
            .fadeIn(duration: 300.ms)
            .slideX(begin: triggerOnLeft ? -0.12 : 0.12),
      ),
    );
  }
}
