import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';

class CustomBackgroundContainer extends StatelessWidget {
  Widget child;
  CustomBackgroundContainer({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetPaths.BACKGROUND_IMAGE),
            fit: BoxFit.fill
        ),
      ),
      child: child,
    );

  }
}
