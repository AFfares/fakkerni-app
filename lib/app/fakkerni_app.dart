import 'package:flutter/material.dart';

import '../features/editor/task_editor_screen.dart';
import '../features/overlays/reminder_overlay_screen.dart';
import '../features/overlays/voice_overlay_screen.dart';
import '../features/recurrence/recurrence_screen.dart';
import 'shell/fakkerni_shell.dart';
import 'theme/fakkerni_theme.dart';

class FakkerniApp extends StatelessWidget {
  const FakkerniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fakkerni',
      theme: buildFakkerniTheme(),
      home: const FakkerniShell(),
      routes: {
        VoiceOverlayScreen.routeName: (_) => const VoiceOverlayScreen(),
        ReminderOverlayScreen.routeName: (_) => const ReminderOverlayScreen(),
        TaskEditorScreen.routeName: (_) => const TaskEditorScreen(),
        RecurrenceScreen.routeName: (_) => const RecurrenceScreen(),
      },
    );
  }
}
