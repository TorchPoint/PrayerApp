import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prayer_hybrid_app/add_praise/screens/add_praise_screen.dart';
import 'package:prayer_hybrid_app/add_prayer/screens/add_prayer_screen.dart';
import 'package:prayer_hybrid_app/bible/screens/bible_prayer_list_screen.dart';
import 'package:prayer_hybrid_app/bible/screens/bible_tab_screen.dart';
import 'package:prayer_hybrid_app/drawer/drawer_screen.dart';
import 'package:prayer_hybrid_app/prayer_praise_info/screens/finish_praying_screen.dart';
import 'package:prayer_hybrid_app/prayer_praise_info/screens/pray_now_screen.dart';
import 'package:prayer_hybrid_app/prayer_praise_info/screens/prayer_praise_tab_screen.dart';
import 'package:prayer_hybrid_app/reminder/screens/reminder_screen.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/splash/splash_screen.dart';
import 'package:device_preview/device_preview.dart';

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
      home: SplashScreen(),
    );
  }
}
