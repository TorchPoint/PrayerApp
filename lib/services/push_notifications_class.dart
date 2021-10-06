import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:prayer_hybrid_app/chat_audio_video/screens/audio_screen.dart';
import 'package:prayer_hybrid_app/drawer/drawer_screen.dart';
import 'package:prayer_hybrid_app/main.dart';
import 'package:prayer_hybrid_app/models/user_model.dart';
import 'package:prayer_hybrid_app/services/base_service.dart';
import 'package:prayer_hybrid_app/services/local_notifications_class.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => instance;

  static final PushNotificationsManager instance = PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool _initialized = false;
  BaseService baseService = BaseService();

  Future joinCall(RemoteMessage message) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(message.data["channel"]);
    return await baseService
        .postBaseMethod("http://server.appsstaging.com:3060/joining-call", {
      "isPublisher": false,
      "reciever_id": prefs.getInt("userID"),
      "channel": message.data["channel"],
      "sender_id": message.data["user"]
    });
  }

  Future<void> loadFCM(context) async {
    _firebaseMessaging.getInitialMessage().then((message) {
      if (message != null) {
        _handleMessage(message);
      } else {
        _splashTimer(context);
      }
    });
    getForeGroundFCM();
    onClickFCM();
  }

  //works in foreground

  Future<void> getForeGroundFCM() async {
    FirebaseMessaging.onMessage.listen((message) {
      if (message != null) {
        print(message.notification.title);
        print(message.notification.body);
      }
      LocalNotifications().showLocalNotifications(message);
    });
  }

//works when app is in background and user taps
  Future<void> onClickFCM() async {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message != null) {
        _handleMessage(message);
      }
    });
  }

  void _handleMessage(RemoteMessage remoteMessage) {
    if (remoteMessage.data["type"] == "call") {
      print(remoteMessage.data.toString());
      joinCall(remoteMessage).then((value) {
        print(remoteMessage.data["channel"]);
        print(remoteMessage.data["user"]);
        print(remoteMessage.data["token"]);
        AppNavigation.navigateTo(
            navigatorKey.currentContext,
            AudioScreen(
              channelToken: remoteMessage.data["token"],
              appUser: AppUser.fromJson(value["user"]),
              channelName: remoteMessage.data["channel"],
            ));
      });
    }
  }
}

Future<Timer> _splashTimer(context) async {
  return Timer(Duration(seconds: 3), () {
    BaseService().loadUserData(context);
  });
}
