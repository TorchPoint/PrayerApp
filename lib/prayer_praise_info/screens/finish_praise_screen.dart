import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/add_praise/screens/add_praise_screen.dart';
import 'package:prayer_hybrid_app/prayer_praise_info/screens/stop_watch_alert_screen.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/widgets/custom_gesture_detector_container.dart';
import 'package:prayer_hybrid_app/bible/screens/bible_tab_screen.dart';
import 'package:share_extend/share_extend.dart';

class FinishPraiseScreen extends StatefulWidget {
  @override
  _FinishPraiseScreenState createState() => _FinishPraiseScreenState();
}

class _FinishPraiseScreenState extends State<FinishPraiseScreen> {

  bool answerTick = true;
  StopWatchAlertScreen stopWatchAlertScreen = StopWatchAlertScreen();

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
                      child: Text(AppStrings.PRAISE_TITLE_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w700,letterSpacing: 1.0),textScaleFactor: 1.4,maxLines: 1,overflow: TextOverflow.ellipsis,),
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

                    _editPraiseWidget(),

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
      title: AppStrings.FINISH_PRAISE_TEXT,
      leadingIconPath: AssetPaths.BACK_ICON,
      leadingTap: (){
        AppNavigation.navigatorPop(context);
      },
      trailingIconPath: AssetPaths.CANCEL_ICON,
      trailingTap: (){
        AppNavigation.navigatorPop(context);
      },
    );
  }

  //Stop Watch Timer Widget
  Widget _stopWatchImageWidget()
  {
    return GestureDetector(
      onTap: (){
        print("Stop Watch Image Widget");
        stopWatchAlertScreen.stopWatchAlert(context);
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
        AppNavigation.navigateTo(context, BibleTabScreen());
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
        // setState(() {
        //   answerTick = !answerTick;
        // });
        //AppNavigation.navigatorPop(context);
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
        _shareMethod();
      },
    );
  }

  Widget _editPraiseWidget()
  {
    return GestureDetector(
      onTap: (){
        AppNavigation.navigateTo(context, AddPraiseScreen(praiseButtonText: AppStrings.UPDATE_PRAISE_TEXT.toUpperCase(),));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: AppColors.BUTTON_COLOR,
        padding: EdgeInsets.only(top: 11.0,bottom: 11.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppStrings.UPDATE_PRAISE_TEXT.toUpperCase(),style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w700),textScaleFactor: 0.95,),
            SizedBox(width: 6.0,),
            Image.asset(AssetPaths.EDIT_ICON,width: 18.0,)
          ],
        ),
      ),
    );
  }


  void _shareMethod()
  {
    ShareExtend.share(AppStrings.SHARE_MESSAGE_TEXT, "text",
        sharePanelTitle: AppStrings.SHARE_TITLE_TEXT,
        subject: AppStrings.SHARE_SUBJECT_TEXT);
  }


}