package com.example.flutter_push_notifications

import android.os.Bundle
import android.os.PersistableBundle
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

    var notificationHelper:NotificationHelper?=null

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
        notificationHelper = NotificationHelper(this)
    }
}
