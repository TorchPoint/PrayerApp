import 'package:flutter/material.dart';



class CustomSocialButton extends StatelessWidget {
  final double containerWidth,containerHeight,iconWidth;
  final Color buttonColor,labelTextColor,iconColor;
  final Function onPressed;
  final String labelText,iconPath;

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

