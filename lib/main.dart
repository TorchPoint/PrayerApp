import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prayer_hybrid_app/chat/screens/chat_screen.dart';
import 'package:prayer_hybrid_app/drawer/drawer_screen.dart';
import 'package:prayer_hybrid_app/home/home_screen.dart';
import 'package:prayer_hybrid_app/password/screens/continue_email_screen.dart';
import 'package:prayer_hybrid_app/prayer_group/screens/create_prayer_group_screen.dart';
import 'package:prayer_hybrid_app/prayer_group/screens/prayer_group_list_screen.dart';
import 'package:prayer_hybrid_app/prayer_partner/screens/add_prayer_partner_screen.dart';
import 'package:prayer_hybrid_app/reminder_calendar/screens/calendar_screen.dart';
import 'package:prayer_hybrid_app/reminder_calendar/screens/reminder_screen.dart';
import 'package:prayer_hybrid_app/subscription/screens/buy_now_subscription.dart';
import 'package:prayer_hybrid_app/subscription/screens/payment_cards_screen.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/splash/splash_screen.dart';

void main() => runApp(
  DevicePreview(
   // enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: AppStrings.APP_TITLE_TEXT,
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        fontFamily: 'Quicksand',
      ),
      home: DrawerScreen(),
    );
  }
}
