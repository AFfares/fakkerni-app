package com.example.plus_only

import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.Settings
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import com.example.plus_only.notifications.ReminderNotificationScheduler
import com.example.plus_only.voice.VoiceCaptureEventBus
import com.example.plus_only.voice.VoiceCaptureService

class MainActivity : FlutterActivity() {
	private val channelName = "com.example.plus_only/fakkerni_pipeline"
	private val voiceEventChannelName = "com.example.plus_only/voice_capture_events"
	private val notificationChannelName = "com.example.plus_only/fakkerni_notifications"

	override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
		super.configureFlutterEngine(flutterEngine)

		MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName).setMethodCallHandler { call, result ->
			when (call.method) {
				"hasOverlayPermission" -> result.success(Settings.canDrawOverlays(this))
				"hasMicrophonePermission" -> {
					val granted = ContextCompat.checkSelfPermission(
						this,
						android.Manifest.permission.RECORD_AUDIO,
					) == android.content.pm.PackageManager.PERMISSION_GRANTED
					result.success(granted)
				}
				"openOverlaySettings" -> {
					openOverlayPermissionSettings()
					result.success(null)
				}
				"openNotificationSettings" -> {
					openAppNotificationSettings()
					result.success(null)
				}
				"openBatteryOptimizationSettings" -> {
					openBatteryOptimizationSettings()
					result.success(null)
				}
				"openAppDetailsSettings" -> {
					openAppDetailsSettings()
					result.success(null)
				}
				"startVoiceCaptureService" -> {
					val intent = Intent(this, VoiceCaptureService::class.java)
					if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
						ContextCompat.startForegroundService(this, intent)
					} else {
						startService(intent)
					}
					result.success(null)
				}
				"stopVoiceCaptureService" -> {
					stopService(Intent(this, VoiceCaptureService::class.java))
					result.success(null)
				}
				else -> result.notImplemented()
			}
		}

		EventChannel(flutterEngine.dartExecutor.binaryMessenger, voiceEventChannelName)
			.setStreamHandler(object : EventChannel.StreamHandler {
				override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
					VoiceCaptureEventBus.attach(events)
				}

				override fun onCancel(arguments: Any?) {
					VoiceCaptureEventBus.detach()
				}
			})

		MethodChannel(flutterEngine.dartExecutor.binaryMessenger, notificationChannelName)
			.setMethodCallHandler { call, result ->
				val scheduler = ReminderNotificationScheduler(this)
				when (call.method) {
					"scheduleReminderNotification" -> {
						@Suppress("UNCHECKED_CAST")
						val payload = call.arguments as? Map<String, Any?>
						if (payload == null) {
							result.error("invalid_arguments", "Reminder payload missing", null)
							return@setMethodCallHandler
						}
						scheduler.scheduleReminderNotification(payload)
						result.success(null)
					}
					"cancelReminderNotification" -> {
						@Suppress("UNCHECKED_CAST")
						val payload = call.arguments as? Map<String, Any?>
						val reminderId = payload?.get("id")?.toString()
						if (reminderId.isNullOrEmpty()) {
							result.error("invalid_arguments", "Reminder id missing", null)
							return@setMethodCallHandler
						}
						scheduler.cancelReminderNotification(reminderId)
						result.success(null)
					}
					"rescheduleAllReminderNotifications" -> {
						scheduler.rescheduleAll()
						result.success(null)
					}
					else -> result.notImplemented()
				}
			}
	}

	private fun openOverlayPermissionSettings() {
		val intent = Intent(
			Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
			Uri.parse("package:$packageName"),
		)
		intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
		startActivity(intent)
	}

	private fun openAppNotificationSettings() {
		val intent = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
			Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS).apply {
				putExtra(Settings.EXTRA_APP_PACKAGE, packageName)
				addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
			}
		} else {
			Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS).apply {
				data = Uri.parse("package:$packageName")
				addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
			}
		}
		startActivity(intent)
	}

	private fun openBatteryOptimizationSettings() {
		val intent = Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS)
		intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
		startActivity(intent)
	}

	private fun openAppDetailsSettings() {
		val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS).apply {
			data = Uri.parse("package:$packageName")
			addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
		}
		startActivity(intent)
	}
}
