import 'dart:convert';

import 'package:drift/drift.dart';

import '../../domain/models/reminder.dart';
import '../../domain/services/recurrence_planner.dart';
import '../../features/reminders/application/reminder_notification_scheduler.dart';
import '../reminder_repository.dart';
import 'fakkerni_database.dart';
import 'reminder_entity_mappers.dart';

class DriftReminderRepository implements ReminderRepository {
  DriftReminderRepository(
    this._database, {
    RecurrencePlanner? recurrencePlanner,
    ReminderNotificationScheduler? notificationScheduler,
  }) : _recurrencePlanner = recurrencePlanner ?? RecurrencePlanner(),
       _notificationScheduler =
           notificationScheduler ??
           const MethodChannelReminderNotificationScheduler();

  final FakkerniDatabase _database;
  final RecurrencePlanner _recurrencePlanner;
  final ReminderNotificationScheduler _notificationScheduler;
  final List<Reminder> _cache = <Reminder>[];

  Future<void> initialize() async {
    await _refreshCache();
    await _notificationScheduler.syncAll(_cache);
  }

  @override
  List<Reminder> watchAll() => List.unmodifiable(_cache);

  @override
  Reminder? findById(String id) {
    for (final reminder in _cache) {
      if (reminder.id == id) {
        return reminder;
      }
    }
    return null;
  }

  @override
  Future<void> complete(String id) async {
    final now = DateTime.now();
    final reminder = findById(id);
    if (reminder == null) {
      return;
    }

    if (reminder.type == ReminderType.recurring &&
        reminder.recurrenceRule != null) {
      final nextOccurrence = _recurrencePlanner.nextOccurrence(
        reminder.scheduledAt,
        reminder.recurrenceRule!,
      );
      await _database.transaction(() async {
        await (_database.update(_database.reminderEntities)
          ..where((table) => table.id.equals(id))).write(
          ReminderEntitiesCompanion(
            scheduledAt: Value(nextOccurrence),
            statusIndex: const Value(0),
            updatedAt: Value(now),
            completedAt: Value(now),
          ),
        );
        await _insertEvent(id, 'completed', <String, dynamic>{
          'completedAt': now.toIso8601String(),
          'nextOccurrence': nextOccurrence.toIso8601String(),
        });
      });
      await _refreshCache();
      await _syncNotification(findById(id));
      return;
    }

    await _database.transaction(() async {
      await (_database.update(_database.reminderEntities)
        ..where((table) => table.id.equals(id))).write(
        ReminderEntitiesCompanion(
          statusIndex: const Value(3),
          completedAt: Value(now),
          updatedAt: Value(now),
        ),
      );
      await _insertEvent(id, 'completed', <String, dynamic>{
        'completedAt': now.toIso8601String(),
      });
    });
    await _refreshCache();
    await _notificationScheduler.cancelReminder(id);
  }

  @override
  Future<void> save(Reminder reminder) async {
    final now = DateTime.now();
    await _database.transaction(() async {
      await _database
          .into(_database.reminderEntities)
          .insertOnConflictUpdate(
            reminder.toCompanion(
              updatedAt: now,
              completedAt:
                  reminder.status == ReminderStatus.completed ? now : null,
            ),
          );
      await _insertEvent(reminder.id, 'saved', <String, dynamic>{
        'title': reminder.title,
        'scheduledAt': reminder.scheduledAt.toIso8601String(),
      });
    });
    await _refreshCache();
    await _syncNotification(reminder);
  }

  @override
  Future<void> snooze(String id, Duration duration) async {
    final now = DateTime.now();
    final reminder = findById(id);
    if (reminder == null) {
      return;
    }

    final newScheduledAt = now.add(duration);
    await _database.transaction(() async {
      await (_database.update(_database.reminderEntities)
        ..where((table) => table.id.equals(id))).write(
        ReminderEntitiesCompanion(
          scheduledAt: Value(newScheduledAt),
          statusIndex: const Value(1),
          snoozeMinutes: Value(duration.inMinutes),
          updatedAt: Value(now),
        ),
      );
      await _insertEvent(id, 'snoozed', <String, dynamic>{
        'scheduledAt': newScheduledAt.toIso8601String(),
        'durationMinutes': duration.inMinutes,
      });
    });
    await _refreshCache();
    await _syncNotification(findById(id));
  }

  Future<void> _refreshCache() async {
    final rows =
        await (_database.select(_database.reminderEntities)
          ..orderBy([(table) => OrderingTerm.asc(table.scheduledAt)])).get();

    _cache
      ..clear()
      ..addAll(rows.map(_mapRowToReminder));
  }

  Future<void> _insertEvent(
    String reminderId,
    String type,
    Map<String, dynamic> payload,
  ) async {
    await _database
        .into(_database.reminderEvents)
        .insert(
          ReminderEventsCompanion(
            id: Value('${reminderId}_${DateTime.now().microsecondsSinceEpoch}'),
            reminderId: Value(reminderId),
            type: Value(type),
            occurredAt: Value(DateTime.now()),
            payloadJson: Value(jsonEncode(payload)),
          ),
        );
  }

  Reminder _mapRowToReminder(ReminderEntity row) {
    return row.toDomain();
  }

  Future<void> _syncNotification(Reminder? reminder) async {
    if (reminder == null) {
      return;
    }

    await _notificationScheduler.syncReminder(reminder);
  }
}
