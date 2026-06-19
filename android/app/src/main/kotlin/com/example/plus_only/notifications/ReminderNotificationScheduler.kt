package com.example.plus_only.notifications

import android.app.AlarmManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.Build

class ReminderNotificationScheduler(private val context: Context) {
    private val alarmManager = context.getSystemService(AlarmManager::class.java)

    fun scheduleReminderNotification(values: Map<String, Any?>) {
        val snapshot = ReminderAlarmSnapshot.fromMap(values)
        ReminderAlarmStore.save(context, snapshot)
        schedule(snapshot)
    }

    fun cancelReminderNotification(reminderId: String) {
        ReminderAlarmStore.remove(context, reminderId)
        alarmManager.cancel(pendingIntent(reminderId))
    }

    fun rescheduleAll() {
        ReminderAlarmStore.all(context).forEach { schedule(it) }
    }

    private fun schedule(snapshot: ReminderAlarmSnapshot) {
        val triggerAtMillis = maxOf(snapshot.scheduledAtMillis, System.currentTimeMillis() + 1_000L)
        val pendingIntent = pendingIntent(snapshot.id)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && !alarmManager.canScheduleExactAlarms()) {
            alarmManager.setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, triggerAtMillis, pendingIntent)
            return
        }

        alarmManager.setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, triggerAtMillis, pendingIntent)
    }

    private fun pendingIntent(reminderId: String): PendingIntent {
        val intent = Intent(context, ReminderAlarmReceiver::class.java).apply {
            putExtra(ReminderAlarmReceiver.EXTRA_REMINDER_ID, reminderId)
        }

        return PendingIntent.getBroadcast(
            context,
            reminderId.hashCode(),
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or immutableFlag(),
        )
    }

    private fun immutableFlag(): Int {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            PendingIntent.FLAG_IMMUTABLE
        } else {
            0
        }
    }
}