import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prayer_hybrid_app/chat_audio_video/screens/audio_screen.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';

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
      home: AudioScreen(),
    );
  }
}
