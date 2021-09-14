import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:prayer_hybrid_app/providers/provider.dart';
import 'package:prayer_hybrid_app/reminder_calendar/screens/calendar_screen.dart';
import 'package:prayer_hybrid_app/splash/splash_screen.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppUserProvider()),
        ChangeNotifierProvider(create: (_) => PrayerProvider()),
        ChangeNotifierProvider(create: (_) => ReminderProvider()),
      ],
      child: MaterialApp(
          title: AppStrings.APP_TITLE_TEXT,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Quicksand',

          ),
          builder: EasyLoading.init(),
          home: SplashScreen()),
    );
  }
}
