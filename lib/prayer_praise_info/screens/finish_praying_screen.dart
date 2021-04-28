import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/widgets/custom_gesture_detector_container.dart';

class FinishPrayingScreen extends StatefulWidget {
  @override
  _FinishPrayingScreenState createState() => _FinishPrayingScreenState();
}

class _FinishPrayingScreenState extends State<FinishPrayingScreen> {

  bool answerTick = false;

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Scaffold(
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        body: Column(
          children: [
            _customAppBar(),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0,vertical: 0.0),
                    child: Text(AppStrings.PRAYER_TITLE_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w700,letterSpacing: 1.0),textScaleFactor: 1.4,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  ),

                  SizedBox(
                    height: 7.0,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0,vertical: 0.0),
                    child: Text(AppStrings.PRAYER_USER_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600,letterSpacing: 1.0),textScaleFactor: 1.0,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  ),

                  SizedBox(
                    height: 8.0,
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0,right: 10.0),
                        child: Text(AppStrings.LOREM_EPSUM_STRING,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600,height: 1.4),textScaleFactor: 1.0),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.025,
                  ),

                  _stopWatchImageWidget(),

                  SizedBox(height: MediaQuery.of(context).size.height*0.025,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _biblePromisesWidget(),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.025,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _answeredPromisesWidget(),
                      _sharePromisesWidget(),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.05,),

                  _editPrayerWidget(),

                ],
              ),
            ),
          ],
        )
      ),
    );
  }


  //Custom App Bar Widget
  Widget _customAppBar()
  {
    return CustomAppBar(
      title: AppStrings.FINISH_PRAYING_TEXT,
      leadingIconPath: AssetPaths.BACK_ICON,
      leadingTap: (){
        AppNavigation.navigatorPop(context);
      },
      trailingIconPath: AssetPaths.CANCEL_ICON,
      trailingTap: (){
        print("Cancel Icon");
      },
    );
  }

  //Stop Watch Timer Widget
  Widget _stopWatchImageWidget()
  {
    return GestureDetector(
      onTap: (){
        print("Stop Watch Image Widget");
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.3,
        height: MediaQuery.of(context).size.height*0.11,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetPaths.STOP_WATCH_IMAGE),
            fit: BoxFit.contain
          ),
        ),
      ),
    );
  }

  //Bible Promises Widget
  Widget _biblePromisesWidget()
  {
    return CustomGestureDetectorContainer(
      buttonColor: AppColors.BUTTON_COLOR,
      title: AppStrings.BIBLE_PROMISES_TEXT,
      containerVertical: 11.0,
      containerHorizontal: 21.0,
      borderRadius: 22.0,
      textSize: 0.95,
      onTap: (){
        print("Bible Promises");
      },
    );
  }

  //Answered Widget
  Widget _answeredPromisesWidget()
  {
    return CustomGestureDetectorContainer(
      buttonColor: AppColors.BUTTON_COLOR,
      title: AppStrings.ANSWERED_TEXT,
      containerVertical: answerTick == true ? 9.0 : 12.0,
      containerHorizontal: answerTick == true ? 21.0 : 34.0,
      borderRadius: 22.0,
      textSize: 0.95,
      suffixImagePath: answerTick == true ? AssetPaths.ANSWERED_ICON : null,
      onTap: (){
        print("Answered");
        setState(() {
          answerTick = !answerTick;
        });
      },
    );
  }

  //Share Widget
  Widget _sharePromisesWidget()
  {
    return CustomGestureDetectorContainer(
      buttonColor: AppColors.BUTTON_COLOR,
      title: AppStrings.SHARE_TEXT,
      containerVertical: 9.0,
      containerHorizontal: 29.0,
      borderRadius: 22.0,
      textSize: 0.95,
      suffixImagePath: AssetPaths.SHARE_ICON,
      onTap: (){
        print("Share");
      },
    );
  }

  Widget _editPrayerWidget()
  {
    return GestureDetector(
      onTap: (){
        print("Edit Prayer");
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: AppColors.BUTTON_COLOR,
        padding: EdgeInsets.only(top: 11.0,bottom: 11.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppStrings.EDIT_PRAYER_TEXT.toUpperCase(),style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w700),textScaleFactor: 0.95,),
            SizedBox(width: 6.0,),
            Image.asset(AssetPaths.EDIT_ICON,width: 18.0,)
          ],
        ),
      ),
    );
  }


}