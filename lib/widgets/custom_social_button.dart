import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';



class CustomSocialButton extends StatelessWidget {
  double containerWidth,containerHeight,iconWidth;
  Color buttonColor,labelTextColor,iconColor;
  Function onPressed;
  String labelText,iconPath;

  CustomSocialButton({this.containerWidth,this.containerHeight,this.buttonColor,this.labelText,this.labelTextColor,this.iconPath,this.iconWidth,this.iconColor,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: buttonColor)
        ),
        color: buttonColor,
        elevation: 0.0,
        highlightElevation: 0.0,
        onPressed: onPressed,
        label: Text(labelText,style: TextStyle(color: labelTextColor,fontWeight: FontWeight.w700,letterSpacing: 1.0),textScaleFactor: 1.08),
        icon: Image.asset(iconPath,width: iconWidth,color: iconColor,),
      ),
    );
  }
}

