import '../../domain/models/reminder.dart';
import '../reminder_repository.dart';

class MockReminderRepository implements ReminderRepository {
  MockReminderRepository() {
    _seed();
  }

  final List<Reminder> _reminders = <Reminder>[];

  void _seed() {
    final now = DateTime.now();
    _reminders.addAll([
      Reminder(
        id: '1',
        title: 'Doctor appointment',
        scheduledAt: now.add(const Duration(hours: 3)),
        createdAt: now.subtract(const Duration(days: 1)),
        type: ReminderType.oneTime,
        status: ReminderStatus.upcoming,
        originalTranscript: 'Remind me about the doctor appointment at 3 PM',
      ),
      Reminder(
        id: '2',
        title: 'Medication after Maghrib',
        scheduledAt: now.add(const Duration(hours: 6)),
        createdAt: now.subtract(const Duration(days: 2)),
        type: ReminderType.recurring,
        status: ReminderStatus.upcoming,
        prayerAnchor: 'Maghrib',
        recurrenceRule: const RecurrenceRule(
          frequency: RecurrenceFrequency.daily,
          interval: 1,
        ),
      ),
      Reminder(
        id: '3',
        title: 'Football match',
        scheduledAt: now.add(const Duration(days: 1, hours: 2)),
        createdAt: now.subtract(const Duration(hours: 6)),
        type: ReminderType.oneTime,
        status: ReminderStatus.snoozed,
        snoozeMinutes: 10,
      ),
    ]);
  }

  @override
  List<Reminder> watchAll() => List.unmodifiable(_reminders);

  @override
  Reminder? findById(String id) {
    for (final reminder in _reminders) {
      if (reminder.id == id) {
        return reminder;
      }
    }
    return null;
  }

  @override
  Future<void> complete(String id) async {
    final index = _reminders.indexWhere((reminder) => reminder.id == id);
    if (index == -1) {
      return;
    }
    _reminders[index] = _reminders[index].copyWith(
      status: ReminderStatus.completed,
    );
  }

  @override
  Future<void> save(Reminder reminder) async {
    final index = _reminders.indexWhere((item) => item.id == reminder.id);
    if (index == -1) {
      _reminders.insert(0, reminder);
      return;
    }
    _reminders[index] = reminder;
  }

  @override
  Future<void> snooze(String id, Duration duration) async {
    final index = _reminders.indexWhere((reminder) => reminder.id == id);
    if (index == -1) {
      return;
    }
    _reminders[index] = _reminders[index].copyWith(
      status: ReminderStatus.snoozed,
      scheduledAt: DateTime.now().add(duration),
      snoozeMinutes: duration.inMinutes,
    );
  }
}
