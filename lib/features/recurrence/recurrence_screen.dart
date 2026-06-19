import 'package:flutter/material.dart';

class RecurrenceScreen extends StatelessWidget {
  const RecurrenceScreen({super.key});

  static const routeName = '/recurrence';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recurring task')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          ListTile(title: Text('Rule'), subtitle: Text('Every day at 8:00 AM')),
          ListTile(
            title: Text('Next occurrence'),
            subtitle: Text('Tomorrow, 8:00 AM'),
          ),
          ListTile(
            title: Text('Behavior'),
            subtitle: Text('Advance in place after completion'),
          ),
        ],
      ),
    );
  }
}
