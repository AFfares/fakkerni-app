abstract class AndroidSystemBridge {
  const AndroidSystemBridge();

  Future<bool> canDrawOverlays();

  Future<void> openOverlayPermissionSettings();

  Future<void> openNotificationSettings();

  Future<void> openBatteryOptimizationSettings();

  Future<void> openAppDetailsSettings();
}
