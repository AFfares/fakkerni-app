import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/platform/android_system_bridge.dart';
import '../../core/platform/method_channel_android_system_bridge.dart';
import '../../core/security/sqlcipher_key_store.dart';
import '../../data/local/drift_reminder_repository.dart';
import '../../data/local/fakkerni_database.dart';
import '../../data/reminder_repository.dart';
import '../../features/reminders/application/reminder_notification_scheduler.dart';
import 'app_providers.dart';

class AppBootstrap {
  AppBootstrap({
    required this.sqlcipherKey,
    required this.database,
    required this.reminderRepository,
    required this.reminderNotificationScheduler,
    required this.androidSystemBridge,
  });

  final String sqlcipherKey;
  final FakkerniDatabase database;
  final ReminderRepository reminderRepository;
  final ReminderNotificationScheduler reminderNotificationScheduler;
  final AndroidSystemBridge androidSystemBridge;

  List<Override> get providerOverrides => [
    sqlcipherKeyProvider.overrideWithValue(sqlcipherKey),
    fakkerniDatabaseProvider.overrideWithValue(database),
    reminderRepositoryProvider.overrideWithValue(reminderRepository),
    reminderNotificationSchedulerProvider.overrideWithValue(
      reminderNotificationScheduler,
    ),
    androidSystemBridgeProvider.overrideWithValue(androidSystemBridge),
  ];

  static Future<AppBootstrap> create() async {
    final keyStore = SqlcipherKeyStore();
    final sqlcipherKey = await keyStore.loadOrCreateKey();
    final database = FakkerniDatabase(sqlcipherKey: sqlcipherKey);
    final reminderNotificationScheduler =
        const MethodChannelReminderNotificationScheduler();
    final reminderRepository = DriftReminderRepository(
      database,
      notificationScheduler: reminderNotificationScheduler,
    );
    await reminderRepository.initialize();

    return AppBootstrap(
      sqlcipherKey: sqlcipherKey,
      database: database,
      reminderRepository: reminderRepository,
      reminderNotificationScheduler: reminderNotificationScheduler,
      androidSystemBridge: const MethodChannelAndroidSystemBridge(),
    );
  }
}
