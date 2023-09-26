package com.example.flutter_push_notifications

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.content.ContextWrapper
import android.graphics.Color
import android.os.Build

class NotificationHelper(context:Context):ContextWrapper(context) {
    val manager:NotificationManager by lazy {
        getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
    }

    companion object {
        val GENERAL_CHANNEL = "general_channel"
    }

    init {
        if(Build.VERSION.SDK_INT >= 26){
            val chan1 = NotificationChannel(GENERAL_CHANNEL,"General Channel",NotificationManager.IMPORTANCE_HIGH)

            chan1.lightColor=Color.GREEN
            chan1.lockscreenVisibility=Notification.VISIBILITY_PRIVATE

            manager.createNotificationChannel(chan1)
        }

    }
}