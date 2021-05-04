import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prayer_hybrid_app/add_praise/screens/add_praise_screen.dart';
import 'package:prayer_hybrid_app/add_prayer/screens/add_prayer_screen.dart';
import 'package:prayer_hybrid_app/bible/screens/bible_prayer_list_screen.dart';
import 'package:prayer_hybrid_app/bible/screens/bible_tab_screen.dart';
import 'package:prayer_hybrid_app/chat/screens/chat_screen.dart';
import 'package:prayer_hybrid_app/drawer/drawer_screen.dart';
import 'package:prayer_hybrid_app/prayer_group/screens/create_prayer_group_screen.dart';
import 'package:prayer_hybrid_app/prayer_praise_info/screens/finish_praying_screen.dart';
import 'package:prayer_hybrid_app/prayer_praise_info/screens/pray_now_screen.dart';
import 'package:prayer_hybrid_app/prayer_praise_info/screens/prayer_praise_tab_screen.dart';
import 'package:prayer_hybrid_app/reminder_calendar/screens/reminder_screen.dart';
import 'package:prayer_hybrid_app/subscription/screens/pay_subscription_screen.dart';
import 'package:prayer_hybrid_app/subscription/screens/payment_cards_screen.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/splash/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:prayer_hybrid_app/prayer_partner/screens/add_prayer_partner_screen.dart';
import 'package:prayer_hybrid_app/reminder_calendar/screens/time_alert_screen.dart';
import 'package:prayer_hybrid_app/reminder_calendar/screens/calendar_screen.dart';

void main() {
  runApp(MyApp());
}

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
      theme: ThemeData(
        fontFamily: 'Quicksand',
      ),
      home: ReminderScreen(),
    );
  }
}
