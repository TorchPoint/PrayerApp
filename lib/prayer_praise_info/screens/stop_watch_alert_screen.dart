import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopWatchAlertScreen {
  StopWatchTimer _stopWatchTimer = StopWatchTimer(
    isLapHours: true,
    // onChange: (value) => print('onChange $value'),
    // onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    // onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );
  int value;
  String displayTime;

  void stopWatchAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.09,
                right: MediaQuery.of(context).size.width * 0.09),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snap) {
                value = snap.data;
                displayTime =
                    StopWatchTimer.getDisplayTime(value, milliSecond: false);
                // print("Display Time"+displayTime.toString());
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _hoursContainer(
                            context, displayTime.substring(0, 2).toString()),
                        SizedBox(width: 15.0),
                        _minutesContainer(
                            context, displayTime.substring(3, 5).toString()),
                        SizedBox(width: 15.0),
                        _secondsContainer(
                            context, displayTime.substring(6, 8).toString())
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    _prayNowContainer(context),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                  ],
                );
              },
            ),
          );
        });
  }

//Hours Container
  Widget _hoursContainer(BuildContext context, String hours) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.19,
      height: MediaQuery.of(context).size.height * 0.11,
      decoration: BoxDecoration(
        color: AppColors.BUTTON_COLOR,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(1, 8), // Shadow position
          ),
        ],
      ),
      child: Center(
          child: Text(
        hours.toString(),
        style: TextStyle(
            color: AppColors.WHITE_COLOR,
            fontWeight: FontWeight.w800,
            letterSpacing: 2.0),
        textScaleFactor: 2.8,
      )),
    );
  }

//Minutes Container
  Widget _minutesContainer(BuildContext context, String minutes) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.19,
      height: MediaQuery.of(context).size.height * 0.11,
      decoration: BoxDecoration(
        color: AppColors.BUTTON_COLOR,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(1, 8), // Shadow position
          ),
        ],
      ),
      child: Center(
          child: Text(
        minutes.toString(),
        style: TextStyle(
            color: AppColors.WHITE_COLOR,
            fontWeight: FontWeight.w800,
            letterSpacing: 2.0),
        textScaleFactor: 2.8,
      )),
    );
  }

//Seconds Container
  Widget _secondsContainer(BuildContext context, String seconds) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.19,
      height: MediaQuery.of(context).size.height * 0.11,
      decoration: BoxDecoration(
        color: AppColors.BUTTON_COLOR,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(1, 8), // Shadow position
          ),
        ],
      ),
      child: Center(
          child: Text(
        seconds.toString(),
        style: TextStyle(
            color: AppColors.WHITE_COLOR,
            fontWeight: FontWeight.w800,
            letterSpacing: 2.0),
        textScaleFactor: 2.8,
      )),
    );
  }

//Pray Now Container
  Widget _prayNowContainer(BuildContext context) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              //AppNavigation.navigatorPop(context);
              // _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
              _stopWatchTimer.onExecute.add(StopWatchExecute.start);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.10,
                  vertical: 12.0),
              decoration: BoxDecoration(
                color: AppColors.BUTTON_COLOR,
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(1, 8), // Shadow position
                  ),
                ],
              ),
              child: Text(
                "Start Prayer",
                style: TextStyle(
                    color: AppColors.WHITE_COLOR, fontWeight: FontWeight.w800),
                textScaleFactor: 1.0,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {

              _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
              print(_stopWatchTimer.secondTime.value.toString());
              print(displayTime);
              AppNavigation.navigatorPop(context);
              // _stopWatchTimer.onExecute
              //     .add(StopWatchExecute.start);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.10,
                  vertical: 12.0),
              decoration: BoxDecoration(
                color: AppColors.BUTTON_COLOR,
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(1, 8), // Shadow position
                  ),
                ],
              ),
              child: Text(
                "End Prayer",
                style: TextStyle(
                    color: AppColors.WHITE_COLOR, fontWeight: FontWeight.w800),
                textScaleFactor: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
