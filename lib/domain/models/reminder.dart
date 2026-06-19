import 'package:flutter/material.dart';

enum ReminderType { oneTime, recurring }

enum ReminderStatus { upcoming, snoozed, overdue, completed }

enum RecurrenceFrequency { daily, weekly, monthly }

class RecurrenceRule {
  const RecurrenceRule({
    required this.frequency,
    required this.interval,
    this.weekdays = const <int>[],
    this.anchorTime,
  });

  final RecurrenceFrequency frequency;
  final int interval;
  final List<int> weekdays;
  final TimeOfDay? anchorTime;
}

class Reminder {
  const Reminder({
    required this.id,
    required this.title,
    required this.scheduledAt,
    required this.createdAt,
    required this.type,
    required this.status,
    this.originalTranscript,
    this.recurrenceRule,
    this.prayerAnchor,
    this.snoozeMinutes = 10,
  });

  final String id;
  final String title;
  final DateTime scheduledAt;
  final DateTime createdAt;
  final ReminderType type;
  final ReminderStatus status;
  final String? originalTranscript;
  final RecurrenceRule? recurrenceRule;
  final String? prayerAnchor;
  final int snoozeMinutes;

  Reminder copyWith({
    String? title,
    DateTime? scheduledAt,
    ReminderType? type,
    ReminderStatus? status,
    String? originalTranscript,
    RecurrenceRule? recurrenceRule,
    String? prayerAnchor,
    int? snoozeMinutes,
  }) {
    return Reminder(
      id: id,
      title: title ?? this.title,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      createdAt: createdAt,
      type: type ?? this.type,
      status: status ?? this.status,
      originalTranscript: originalTranscript ?? this.originalTranscript,
      recurrenceRule: recurrenceRule ?? this.recurrenceRule,
      prayerAnchor: prayerAnchor ?? this.prayerAnchor,
      snoozeMinutes: snoozeMinutes ?? this.snoozeMinutes,
    );
  }
}
