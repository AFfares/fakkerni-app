import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/platform/android_system_bridge.dart';
import '../../data/local/fakkerni_database.dart';
import '../../data/reminder_repository.dart';
import '../../features/reminders/application/reminder_notification_scheduler.dart';

final sqlcipherKeyProvider = Provider<String>((ref) {
  throw UnimplementedError(
    'sqlcipherKeyProvider must be overridden at bootstrap',
  );
});

final fakkerniDatabaseProvider = Provider<FakkerniDatabase>((ref) {
  throw UnimplementedError(
    'fakkerniDatabaseProvider must be overridden at bootstrap',
  );
});

final reminderRepositoryProvider = Provider<ReminderRepository>((ref) {
  throw UnimplementedError(
    'reminderRepositoryProvider must be overridden at bootstrap',
  );
});

final reminderNotificationSchedulerProvider =
    Provider<ReminderNotificationScheduler>((ref) {
      throw UnimplementedError(
        'reminderNotificationSchedulerProvider must be overridden at bootstrap',
      );
    });

final androidSystemBridgeProvider = Provider<AndroidSystemBridge>((ref) {
  throw UnimplementedError(
    'androidSystemBridgeProvider must be overridden at bootstrap',
  );
});
