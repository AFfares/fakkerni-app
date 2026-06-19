import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/reminder_repository.dart';
import '../../app/bootstrap/app_providers.dart';
import '../../domain/models/reminder.dart';

final remindersProvider =
    StateNotifierProvider<RemindersController, List<Reminder>>((ref) {
      return RemindersController(ref.read(reminderRepositoryProvider));
    });

class RemindersController extends StateNotifier<List<Reminder>> {
  RemindersController(this._repository) : super(_repository.watchAll());

  final ReminderRepository _repository;

  Future<void> completeReminder(String id) async {
    await _repository.complete(id);
    state = _repository.watchAll();
  }

  Future<void> snoozeReminder(String id, Duration duration) async {
    await _repository.snooze(id, duration);
    state = _repository.watchAll();
  }

  Future<void> saveReminder(Reminder reminder) async {
    await _repository.save(reminder);
    state = _repository.watchAll();
  }
}
