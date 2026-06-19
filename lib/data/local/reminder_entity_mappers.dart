import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import '../../domain/models/reminder.dart';
import 'fakkerni_database.dart';

extension ReminderEntityMapper on ReminderEntity {
  Reminder toDomain() {
    return Reminder(
      id: id,
      title: title,
      scheduledAt: scheduledAt,
      createdAt: createdAt,
      type: ReminderType.values[typeIndex],
      status: ReminderStatus.values[statusIndex],
      originalTranscript: originalTranscript,
      recurrenceRule:
          recurrenceJson == null
              ? null
              : recurrenceRuleFromJson(recurrenceJson!),
      prayerAnchor: prayerAnchor,
      snoozeMinutes: snoozeMinutes,
    );
  }
}

extension ReminderDomainMapper on Reminder {
  ReminderEntitiesCompanion toCompanion({
    DateTime? updatedAt,
    DateTime? completedAt,
  }) {
    return ReminderEntitiesCompanion(
      id: Value(id),
      title: Value(title),
      originalTranscript: Value(originalTranscript),
      typeIndex: Value(type.index),
      statusIndex: Value(status.index),
      scheduledAt: Value(scheduledAt),
      createdAt: Value(createdAt),
      recurrenceJson: Value(recurrenceRuleToJson(recurrenceRule)),
      prayerAnchor: Value(prayerAnchor),
      snoozeMinutes: Value(snoozeMinutes),
      updatedAt: Value(updatedAt ?? DateTime.now()),
      completedAt: Value(completedAt),
    );
  }
}

String? recurrenceRuleToJson(RecurrenceRule? rule) {
  if (rule == null) {
    return null;
  }

  return jsonEncode(<String, dynamic>{
    'frequency': rule.frequency.index,
    'interval': rule.interval,
    'weekdays': rule.weekdays,
    'anchorTime':
        rule.anchorTime == null
            ? null
            : <String, dynamic>{
              'hour': rule.anchorTime!.hour,
              'minute': rule.anchorTime!.minute,
            },
  });
}

RecurrenceRule recurrenceRuleFromJson(String jsonValue) {
  final data = jsonDecode(jsonValue) as Map<String, dynamic>;
  final anchorTime = data['anchorTime'] as Map<String, dynamic>?;

  return RecurrenceRule(
    frequency: RecurrenceFrequency.values[data['frequency'] as int],
    interval: data['interval'] as int,
    weekdays: (data['weekdays'] as List<dynamic>).cast<int>(),
    anchorTime:
        anchorTime == null
            ? null
            : TimeOfDay(
              hour: anchorTime['hour'] as int,
              minute: anchorTime['minute'] as int,
            ),
  );
}
