import 'dart:io';

import 'package:flutter/services.dart';

import 'android_system_bridge.dart';

class MethodChannelAndroidSystemBridge extends AndroidSystemBridge {
  const MethodChannelAndroidSystemBridge({MethodChannel? channel})
    : _channel = channel ?? const MethodChannel('fakkerni/android_system');

  final MethodChannel _channel;

  @override
  Future<bool> canDrawOverlays() async {
    if (!Platform.isAndroid) {
      return false;
    }
    return (await _channel.invokeMethod<bool>('canDrawOverlays')) ?? false;
  }

  @override
  Future<void> openAppDetailsSettings() async {
    if (!Platform.isAndroid) {
      return;
    }
    await _channel.invokeMethod<void>('openAppDetailsSettings');
  }

  @override
  Future<void> openBatteryOptimizationSettings() async {
    if (!Platform.isAndroid) {
      return;
    }
    await _channel.invokeMethod<void>('openBatteryOptimizationSettings');
  }

  @override
  Future<void> openNotificationSettings() async {
    if (!Platform.isAndroid) {
      return;
    }
    await _channel.invokeMethod<void>('openNotificationSettings');
  }

  @override
  Future<void> openOverlayPermissionSettings() async {
    if (!Platform.isAndroid) {
      return;
    }
    await _channel.invokeMethod<void>('openOverlayPermissionSettings');
  }
}
