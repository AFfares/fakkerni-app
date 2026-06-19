import '../models/reminder.dart';

class RecurrencePlanner {
  DateTime nextOccurrence(DateTime current, RecurrenceRule rule) {
    final baseline = current.toLocal();

    switch (rule.frequency) {
      case RecurrenceFrequency.daily:
        return baseline.add(Duration(days: rule.interval));
      case RecurrenceFrequency.weekly:
        return _nextWeeklyOccurrence(baseline, rule);
      case RecurrenceFrequency.monthly:
        return _nextMonthlyOccurrence(baseline, rule);
    }
  }

  DateTime _nextWeeklyOccurrence(DateTime baseline, RecurrenceRule rule) {
    if (rule.weekdays.isEmpty) {
      return baseline.add(Duration(days: 7 * rule.interval));
    }

    final sortedWeekdays = [...rule.weekdays]..sort();
    for (final weekday in sortedWeekdays) {
      final candidate = _dateForWeekdayAfter(baseline, weekday);
      if (candidate.isAfter(baseline)) {
        return candidate;
      }
    }

    return _dateForWeekdayAfter(
      baseline.add(Duration(days: 7 * rule.interval)),
      sortedWeekdays.first,
    );
  }

  DateTime _nextMonthlyOccurrence(DateTime baseline, RecurrenceRule rule) {
    final targetDay = baseline.day;
    final targetMonth = baseline.month + rule.interval;
    return DateTime(
      baseline.year,
      targetMonth,
      targetDay,
      baseline.hour,
      baseline.minute,
      baseline.second,
      baseline.millisecond,
      baseline.microsecond,
    );
  }

  DateTime _dateForWeekdayAfter(DateTime baseline, int weekday) {
    final daysAhead = (weekday - baseline.weekday) % 7;
    final adjustedDays = daysAhead <= 0 ? daysAhead + 7 : daysAhead;
    return baseline.add(Duration(days: adjustedDays));
  }
}
