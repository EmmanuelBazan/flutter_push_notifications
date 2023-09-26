import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_push_notifications/firebase_options.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStreamController =
      StreamController.broadcast();

  static Stream<String> get messageStream => _messageStreamController.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    print('✅ Notification data ${message.data}');
    _messageStreamController.add(message.data['product'] ?? 'No title');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('✅ Notification data ${message.data}');
    _messageStreamController.add(message.data['product'] ?? 'No title');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    print('✅ Notification data ${message.data}');
    _messageStreamController.add(message.data['product'] ?? 'No title');
  }

  static Future initializeApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    token = await FirebaseMessaging.instance.getToken();
    print('USER TOKEN $token');

    //^ Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }

  static closeStream() {
    _messageStreamController.close();
  }
}
