import 'package:flutter/material.dart';

class TaskEditorScreen extends StatefulWidget {
  const TaskEditorScreen({super.key});

  static const routeName = '/task-editor';

  @override
  State<TaskEditorScreen> createState() => _TaskEditorScreenState();
}

class _TaskEditorScreenState extends State<TaskEditorScreen> {
  final titleController = TextEditingController(
    text: 'Remind me tomorrow at 8',
  );

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit reminder')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Reminder text'),
          ),
          const SizedBox(height: 20),
          const ListTile(title: Text('Date'), subtitle: Text('Tomorrow')),
          const ListTile(title: Text('Time'), subtitle: Text('8:00 AM')),
          const ListTile(title: Text('Recurrence'), subtitle: Text('One time')),
          const SizedBox(height: 20),
          FilledButton(onPressed: () {}, child: const Text('Save changes')),
        ],
      ),
    );
  }
}
