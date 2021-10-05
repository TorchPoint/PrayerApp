import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:prayer_hybrid_app/chat_audio_video/screens/audio_screen.dart';
import 'package:prayer_hybrid_app/drawer/drawer_screen.dart';
import 'package:prayer_hybrid_app/services/base_service.dart';
import 'package:prayer_hybrid_app/services/local_notifications_class.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => instance;

  static final PushNotificationsManager instance = PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool _initialized = false;

  Future<void> loadFCM(context) async {
    _firebaseMessaging.getInitialMessage().then((message) {
      if (message != null) {
        _handleMessage(message, context);
      } else {
        _splashTimer(context);
      }
    });
    getForeGroundFCM();
    onClickFCM(context);
  }

  Future<void> getForeGroundFCM() async {
    FirebaseMessaging.onMessage.listen((message) {
      if (message != null) {
        print(message.notification.title);
        print(message.notification.body);
      }
      LocalNotifications().showLocalNotifications(message);
    });
  }

  Future<void> onClickFCM(context) async {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message != null) {
        _handleMessage(message, context);
      }
    });
  }

  void _handleMessage(RemoteMessage remoteMessage, context) {
    if (remoteMessage.data["type"] == "call") {

      AppNavigation.navigateTo(context, AudioScreen());
    }
  }
}

Future<Timer> _splashTimer(context) async {
  return Timer(Duration(seconds: 3), () {
    BaseService().loadUserData(context);
  });
}
