import '../domain/models/reminder.dart';

abstract class ReminderRepository {
  List<Reminder> watchAll();

  Reminder? findById(String id);

  Future<void> save(Reminder reminder);

  Future<void> complete(String id);

  Future<void> snooze(String id, Duration duration);
}
