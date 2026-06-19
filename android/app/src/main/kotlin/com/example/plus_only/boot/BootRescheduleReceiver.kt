package com.example.plus_only.boot

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import com.example.plus_only.notifications.ReminderNotificationScheduler

class BootRescheduleReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent?) {
        when (intent?.action) {
            Intent.ACTION_BOOT_COMPLETED,
            Intent.ACTION_LOCKED_BOOT_COMPLETED,
            null -> ReminderNotificationScheduler(context).rescheduleAll()
        }
    }
}
