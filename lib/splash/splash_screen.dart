import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/services/base_service.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'dart:async';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  BaseService baseService = BaseService();

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await FirebaseMessaging.instance.getToken();
    prefs.setString("xyz", token);
  }

  @override
  void initState() {
    super.initState();
    _splashTimer();
    getToken();
    baseService.loadLocalUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundContainer(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.62,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetPaths.FOREGROUND_IMAGE),
                    fit: BoxFit.contain)),
          ),
        ],
      )),
    );
  }

  Future<Timer> _splashTimer() async {
    return Timer(Duration(seconds: 3), _onComplete);
  }

  void _onComplete() {
    baseService.loadUserData(context);
  }
}
