import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/auth/screens/auth_main_screen.dart';
import 'package:prayer_hybrid_app/drawer/drawer_screen.dart';
import 'package:prayer_hybrid_app/home/home_screen.dart';
import 'package:prayer_hybrid_app/models/user_model.dart';
import 'package:prayer_hybrid_app/providers/user_provider.dart';
import 'package:prayer_hybrid_app/services/base_service.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'dart:async';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  BaseService baseService = BaseService();

  @override
  void initState() {
    super.initState();
    _splashTimer();
    // loadData();
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
