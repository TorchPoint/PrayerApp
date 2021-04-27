import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';

class CustomGestureDetectorContainer extends StatelessWidget {
  Color buttonColor;
  String title;
  double containerVertical,containerHorizontal,borderRadius,textSize;
  String suffixImagePath;
  Function() onTap;


  CustomGestureDetectorContainer({this.buttonColor,this.title,this.containerVertical,this.containerHorizontal,this.borderRadius,this.suffixImagePath,this.textSize,this.onTap});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: containerVertical,horizontal: containerHorizontal),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]

        ),
        child: Row(
          children: [
           Text(title.toString(),style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w700),textScaleFactor: textSize,),
           suffixImagePath != null ?
           Padding(
             padding: EdgeInsets.only(left: 5.0),
               child: Container(
                 width: 22.0,
                 height: 22.0,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage(suffixImagePath),
                     fit: BoxFit.contain
                   )
                 ),
               )
           )
               :
              Container(),

          ],
        ),
      ),
    );
  }
}
