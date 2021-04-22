import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';


class CustomAppBar extends StatelessWidget {

  Function leadingTap,trailingTap;
  String title,leadingIconPath,trailingIconPath;

  CustomAppBar({this.title,this.leadingIconPath,this.leadingTap,this.trailingIconPath,this.trailingTap});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.height*0.1,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05),
        color: AppColors.TRANSPARENT_COLOR,
        child: Row(
          children: [
            leadingIconPath != null ?
            InkWell(
              onTap: leadingTap,
              child: Container(
                width: 43.0,
                height: 43.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(leadingIconPath),
                        fit: BoxFit.contain
                    )
                ),
              ),
            )
            :
             Container(
               width: 43.0,
               height: 43.0,
               color: AppColors.TRANSPARENT_COLOR,
             ),

            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(top: 2.0),
                  child: Text(title.toString(),textAlign: TextAlign.center,textScaleFactor: 1.5,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),maxLines: 1,overflow: TextOverflow.ellipsis,)
              ),
            ),


            trailingIconPath != null ?
            InkWell(
              onTap: trailingTap,
              child: Container(
                width: 43.0,
                height: 43.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(trailingIconPath),
                        fit: BoxFit.contain
                    )
                ),
              ),
            )
            :
            Container(
              width: 43.0,
              height: 43.0,
              color: AppColors.TRANSPARENT_COLOR,
            ),
          ],
        ),
      ),
    );
  }
}