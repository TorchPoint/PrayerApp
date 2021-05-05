import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';

class CustomRaisedButton extends StatelessWidget {
  final double containerWidth,containerHeight,elevation,fontSize;
  final Color buttonColor,textColor,borderColor;
  final Function onPressed;
  final String buttonText;
  final FontWeight fontWeight;

  CustomRaisedButton({this.containerWidth,this.containerHeight,this.buttonColor,this.borderColor,this.elevation,this.buttonText,this.textColor,this.fontWeight,this.fontSize,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: containerWidth,
      height: containerHeight,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: borderColor ?? AppColors.TRANSPARENT_COLOR)
        ),
        color: buttonColor,
        elevation: elevation ?? 0.0,
        highlightElevation: 0.0,
        onPressed: onPressed,
        child: Text(buttonText,style: TextStyle(color: textColor,fontWeight: fontWeight ?? FontWeight.w500,letterSpacing: 1.0),textScaleFactor: fontSize,textAlign: TextAlign.center,),
      ),
    );
  }
}
