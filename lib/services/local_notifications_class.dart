import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:prayer_hybrid_app/chat_audio_video/screens/audio_screen.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';

class LocalNotifications {
  final FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initialize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/launcher_icon"),
    );

    localNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showLocalNotifications(RemoteMessage remoteMessage) async {
    try {
      var id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      await localNotificationsPlugin.getNotificationAppLaunchDetails();
      NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "prayer",
          "prayer",
          "this is prayer app",
          priority: Priority.high,
          importance: Importance.max,
          color: AppColors.BACKGROUND1_COLOR,
        ),
        iOS: IOSNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      );
      localNotificationsPlugin.show(
        id,
        remoteMessage.notification.title,
        remoteMessage.notification.body,
        notificationDetails,
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
