import 'package:flutter/material.dart';

import '../../core/widgets/section_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        children: [
          Text('Settings', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 20),
          _SettingsSection(
            title: 'Interaction',
            children: const [
              _SettingsRow(
                title: 'Floating trigger side',
                subtitle: 'Right side by default',
              ),
              _SettingsRow(title: 'Text size', subtitle: 'Large'),
              _SettingsRow(
                title: 'Voice language',
                subtitle: 'English + Arabic',
              ),
            ],
          ),
          const SizedBox(height: 16),
          _SettingsSection(
            title: 'Reminder behavior',
            children: const [
              _SettingsRow(title: 'Default snooze', subtitle: '10 minutes'),
              _SettingsRow(title: 'Prayer time support', subtitle: 'Enabled'),
              _SettingsRow(
                title: 'Offline speech',
                subtitle: 'Whisper.cpp ready',
              ),
            ],
          ),
          const SizedBox(height: 16),
          _SettingsSection(
            title: 'Privacy',
            children: const [
              _SettingsRow(
                title: 'Encrypted storage',
                subtitle: 'On-device only',
              ),
              _SettingsRow(
                title: 'Mic permissions',
                subtitle: 'Ask only when needed',
              ),
              _SettingsRow(title: 'Cloud sync', subtitle: 'Disabled'),
            ],
          ),
        ],
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(title, style: Theme.of(context).textTheme.titleLarge),
        ),
        SectionCard(child: Column(children: children)),
      ],
    );
  }
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
