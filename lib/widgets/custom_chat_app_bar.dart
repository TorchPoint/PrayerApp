import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';



class CustomChatAppBar extends StatelessWidget {
  final Function leadingTap,trailingVideoTap,trailingAudioTap;
  final String title,leadingIconPath,trailingVideoIconPath,trailingAudioIconPath;

  CustomChatAppBar({this.title,this.leadingIconPath,this.leadingTap,this.trailingVideoIconPath,this.trailingVideoTap,this.trailingAudioIconPath,this.trailingAudioTap});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.height*0.1,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05),
        padding: EdgeInsets.only(top: 4.0,bottom: 4.0),
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
                  child: Text(title ?? "",textAlign: TextAlign.center,textScaleFactor: 1.5,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),maxLines: 1,overflow: TextOverflow.ellipsis,)
              ),
            ),


            trailingVideoIconPath != null ?
            InkWell(
              onTap: trailingVideoTap,
              child: Container(
                width: 43.0,
                height: 43.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(trailingVideoIconPath),
                        fit: BoxFit.contain
                    )
                ),
              ),
            )
                :
            Container(
              width: 0.0,
              height:0.0,
              color: AppColors.TRANSPARENT_COLOR,
            ),

            SizedBox(width:10.0),

            trailingAudioIconPath != null ?
            InkWell(
              onTap: trailingAudioTap,
              child: Container(
                width: 43.0,
                height: 43.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(trailingAudioIconPath),
                        fit: BoxFit.contain
                    )
                ),
              ),
            )
                :
            Container(
              width: 0.0,
              height: 0.0,
              color: AppColors.TRANSPARENT_COLOR,
            ),
          ],
        ),
      ),
    );
  }
}
