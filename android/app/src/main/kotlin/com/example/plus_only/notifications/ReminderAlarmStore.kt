package com.example.plus_only.notifications

import android.content.Context
import android.content.SharedPreferences

internal object ReminderAlarmStore {
    private const val PREFS_NAME = "fakkerni_reminder_alarm_store"
    private const val KEY_SNAPSHOTS = "snapshots"

    fun save(context: Context, snapshot: ReminderAlarmSnapshot) {
        val preferences = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val allSnapshots = loadMap(preferences)
        allSnapshots[snapshot.id] = snapshot.toJson()
        preferences.edit().putString(KEY_SNAPSHOTS, encodeMap(allSnapshots)).apply()
    }

    fun remove(context: Context, reminderId: String) {
        val preferences = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val allSnapshots = loadMap(preferences)
        if (allSnapshots.remove(reminderId) != null) {
            preferences.edit().putString(KEY_SNAPSHOTS, encodeMap(allSnapshots)).apply()
        }
    }

    fun all(context: Context): List<ReminderAlarmSnapshot> {
        val preferences = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        return loadMap(preferences).values.map { ReminderAlarmSnapshot.fromJson(it) }
    }

    private fun loadMap(preferences: SharedPreferences): MutableMap<String, String> {
        val encoded = preferences.getString(KEY_SNAPSHOTS, null).orEmpty()
        if (encoded.isBlank()) {
            return mutableMapOf()
        }

        val json = org.json.JSONObject(encoded)
        val result = mutableMapOf<String, String>()
        val keys = json.keys()
        while (keys.hasNext()) {
            val key = keys.next()
            result[key] = json.getString(key)
        }
        return result
    }

    private fun encodeMap(values: Map<String, String>): String {
        val json = org.json.JSONObject()
        for ((key, value) in values) {
            json.put(key, value)
        }
        return json.toString()
    }
}