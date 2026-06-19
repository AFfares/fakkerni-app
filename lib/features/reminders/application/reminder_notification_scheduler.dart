import 'package:flutter/services.dart';

import '../../../domain/models/reminder.dart';

abstract class ReminderNotificationScheduler {
  Future<void> syncReminder(Reminder reminder);

  Future<void> cancelReminder(String reminderId);

  Future<void> syncAll(Iterable<Reminder> reminders);
}

class MethodChannelReminderNotificationScheduler
    implements ReminderNotificationScheduler {
  const MethodChannelReminderNotificationScheduler({MethodChannel? channel})
    : _channel =
          channel ??
          const MethodChannel('com.example.plus_only/fakkerni_notifications');

  final MethodChannel _channel;

  @override
  Future<void> syncReminder(Reminder reminder) async {
    try {
      if (reminder.status == ReminderStatus.completed) {
        await cancelReminder(reminder.id);
        return;
      }

      await _channel
          .invokeMethod<void>('scheduleReminderNotification', <String, dynamic>{
            'id': reminder.id,
            'title': reminder.title,
            'body': reminder.originalTranscript ?? reminder.title,
            'scheduledAtMillis': reminder.scheduledAt.millisecondsSinceEpoch,
          });
    } on MissingPluginException {
      return;
    }
  }

  @override
  Future<void> cancelReminder(String reminderId) async {
    try {
      await _channel.invokeMethod<void>(
        'cancelReminderNotification',
        <String, dynamic>{'id': reminderId},
      );
    } on MissingPluginException {
      return;
    }
  }

  @override
  Future<void> syncAll(Iterable<Reminder> reminders) async {
    for (final reminder in reminders) {
      await syncReminder(reminder);
    }
  }
}
