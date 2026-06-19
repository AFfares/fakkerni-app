package com.example.plus_only.notifications

import org.json.JSONObject

data class ReminderAlarmSnapshot(
    val id: String,
    val title: String,
    val body: String,
    val scheduledAtMillis: Long,
) {
    fun toJson(): String {
        return JSONObject()
            .put("id", id)
            .put("title", title)
            .put("body", body)
            .put("scheduledAtMillis", scheduledAtMillis)
            .toString()
    }

    companion object {
        fun fromJson(rawJson: String): ReminderAlarmSnapshot {
            val json = JSONObject(rawJson)
            return ReminderAlarmSnapshot(
                id = json.getString("id"),
                title = json.getString("title"),
                body = json.optString("body", json.getString("title")),
                scheduledAtMillis = json.getLong("scheduledAtMillis"),
            )
        }

        fun fromMap(values: Map<String, Any?>): ReminderAlarmSnapshot {
            val reminderId = values["id"]?.toString().orEmpty()
            val title = values["title"]?.toString().orEmpty()
            val body = values["body"]
                ?.toString()
                ?.takeUnless { it.isBlank() }
                ?: title
            val scheduledAtMillis = when (val value = values["scheduledAtMillis"]) {
                is Number -> value.toLong()
                is String -> value.toLongOrNull() ?: 0L
                else -> 0L
            }

            require(reminderId.isNotEmpty()) { "Reminder id is required" }
            require(title.isNotEmpty()) { "Reminder title is required" }
            require(scheduledAtMillis > 0L) { "Reminder scheduledAtMillis is required" }

            return ReminderAlarmSnapshot(
                id = reminderId,
                title = title,
                body = body,
                scheduledAtMillis = scheduledAtMillis,
            )
        }
    }
}