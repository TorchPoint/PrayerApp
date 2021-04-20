import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/auth/screens/auth_main_screen.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'dart:async';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomBackgroundContainer(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.58,
              height: MediaQuery.of(context).size.height*0.15,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.13),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetPaths.FOREGROUND_IMAGE),
                  fit: BoxFit.contain
                )
              ),
            ),
          ],
        )
      ),
    );
  }

  Future<Timer> splashTimer() async {
    return Timer(Duration(seconds: 3), onComplete);
  }

  void onComplete(){
    AppNavigation.navigateTo(context,  AuthMainScreen());
  }





}
