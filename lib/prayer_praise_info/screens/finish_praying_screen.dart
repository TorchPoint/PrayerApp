import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/add_prayer/screens/add_prayer_screen.dart';
import 'package:prayer_hybrid_app/common_classes/share_class.dart';
import 'package:prayer_hybrid_app/models/prayer_model.dart';
import 'package:prayer_hybrid_app/prayer_praise_info/screens/bible_promises_dialog_screen.dart';
import 'package:prayer_hybrid_app/prayer_praise_info/screens/stop_watch_alert_screen.dart';
import 'package:prayer_hybrid_app/services/base_service.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/widgets/custom_gesture_detector_container.dart';

class FinishPrayingScreen extends StatefulWidget {
  PrayerModel prayerModel;

  FinishPrayingScreen({this.prayerModel});

  @override
  _FinishPrayingScreenState createState() => _FinishPrayingScreenState();
}

class _FinishPrayingScreenState extends State<FinishPrayingScreen> {
  bool answerTick = false;
  StopWatchAlertScreen stopWatchAlertScreen = StopWatchAlertScreen();
  BaseService baseService = BaseService();
  BiblePromisesDialogScreen _biblePromisesDialogScreen =
      BiblePromisesDialogScreen();

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
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.0, vertical: 0.0),
                      child: Text(
                        widget.prayerModel.title ??
                            AppStrings.PRAYER_TITLE_TEXT,
                        style: TextStyle(
                            color: AppColors.WHITE_COLOR,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.0),
                        textScaleFactor: 1.8,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.0, vertical: 0.0),
                      child: Text(
                        widget.prayerModel.name ?? AppStrings.PRAYER_USER_TEXT,
                        style: TextStyle(
                            color: AppColors.WHITE_COLOR,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.0),
                        textScaleFactor: 1.1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.06,
                              right: MediaQuery.of(context).size.width * 0.06),
                          child: Text(widget.prayerModel.description ?? "",
                              style: TextStyle(
                                  color: AppColors.WHITE_COLOR,
                                  fontWeight: FontWeight.w700,
                                  height: 1.4),
                              textScaleFactor: 1.05),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    _stopWatchImageWidget(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _biblePromisesWidget(),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _answeredPromisesWidget(),
                        _sharePromisesWidget(),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    _editPrayerWidget(),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  //Custom App Bar Widget
  Widget _customAppBar() {
    return CustomAppBar(
      leadingIconPath: AssetPaths.BACK_ICON,
      paddingTop: 20.0,
      leadingTap: () {
        AppNavigation.navigatorPop(context);
      },
    );
  }

  //Stop Watch Timer Widget
  Widget _stopWatchImageWidget() {
    return GestureDetector(
      onTap: () {
        print("Stop Watch Image Widget");
        stopWatchAlertScreen.stopWatchAlert(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.11,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetPaths.STOP_WATCH_IMAGE),
              fit: BoxFit.contain),
        ),
      ),
    );
  }

  //Bible Promises Widget
  Widget _biblePromisesWidget() {
    return CustomGestureDetectorContainer(
      buttonColor: AppColors.BUTTON_COLOR,
      title: AppStrings.BIBLE_PROMISES_TEXT,
      containerVertical: 11.0,
      containerHorizontal: 21.0,
      borderRadius: 22.0,
      textSize: 0.95,
      onTap: () {
        print("Bible Promises");
        _biblePromisesDialogScreen.showDialogMethod(context: context);
      },
    );
  }

  //Answered Widget
  Widget _answeredPromisesWidget() {
    return CustomGestureDetectorContainer(
      buttonColor: AppColors.BUTTON_COLOR,
      title: AppStrings.ANSWERED_TEXT,
      containerVertical: answerTick == true ? 9.0 : 12.0,
      containerHorizontal: answerTick == true ? 21.0 : 34.0,
      borderRadius: 22.0,
      textSize: 0.95,
      suffixImagePath: answerTick == true ? AssetPaths.ANSWERED_ICON : null,
      onTap: () {
        print("Answered");
        setState(() {
          answerTick = !answerTick;
        });
        baseService.finishPrayer(context, widget.prayerModel.id.toString(),
            stopWatchAlertScreen.displayTime ?? "00:00:00");
        //AppNavigation.navigatorPop(context);
      },
    );
  }

  //Share Widget
  Widget _sharePromisesWidget() {
    return CustomGestureDetectorContainer(
      buttonColor: AppColors.BUTTON_COLOR,
      title: AppStrings.SHARE_TEXT,
      containerVertical: 9.0,
      containerHorizontal: 29.0,
      borderRadius: 22.0,
      textSize: 0.95,
      suffixImagePath: AssetPaths.SHARE_ICON,
      onTap: () {
        _shareMethod();
      },
    );
  }

  Widget _editPrayerWidget() {
    return GestureDetector(
      onTap: () {
        print(widget.prayerModel.name);
        AppNavigation.navigateTo(
            context,
            AddPrayerScreen(
                prayerModel: widget.prayerModel,
                prayerButtonText: AppStrings.UPDATE_PRAYER_TEXT.toUpperCase()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: AppColors.BUTTON_COLOR,
        padding: EdgeInsets.only(top: 11.0, bottom: 11.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.EDIT_TEXT.toUpperCase(),
              style: TextStyle(
                  color: AppColors.WHITE_COLOR, fontWeight: FontWeight.w700),
              textScaleFactor: 0.95,
            ),
            SizedBox(
              width: 6.0,
            ),
            Image.asset(
              AssetPaths.EDIT_ICON,
              width: 18.0,
            )
          ],
        ),
      ),
    );
  }

  void _shareMethod() {
    ShareClass.shareMethod(
        message:
            "${"Title: " + widget.prayerModel.title + "\nName: " + widget.prayerModel.name + "\nDescription: " + widget.prayerModel.description}");
  }
}
