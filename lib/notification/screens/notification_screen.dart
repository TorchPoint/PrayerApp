import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/reminder_calendar/screens/reminder_screen.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Scaffold(
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        body: Column(
          children: [
            _customAppBar(),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: _notificationListWidget(),
            )
          ],
        ),
      ),
    );
  }

  //Custom App Bar Widget
  Widget _customAppBar() {
    return CustomAppBar(
      title: AppStrings.NOTIFICATIONS_TEXT,
      leadingIconPath: AssetPaths.BACK_ICON,
      paddingTop: 20.0,
      isBarImage: true,
      leadingIconSize: 25.0,
      leadingTap: () {
        AppNavigation.navigatorPop(context);
      },
      trailingIconPath: AssetPaths.NOTIFICATION_ICON,
      trailingTap: () {
        AppNavigation.navigateTo(context, ReminderScreen());
      },
    );
  }

  Widget _notificationListWidget() {
    return ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return _notificationContainerWidget();
        });
  }

  Widget _notificationContainerWidget() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          top: 8.5,
          bottom: 8.5),
      padding:
          EdgeInsets.only(top: 13.0, bottom: 13.0, left: 12.0, right: 12.0),
      decoration: BoxDecoration(
          color: AppColors.WHITE_COLOR,
          borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        children: [
          _imageWidget(),
          SizedBox(
            width: 10.0,
          ),
          Expanded(child: _notificationDetailWidget())
        ],
      ),
    );
  }

  Widget _imageWidget() {
    return Container(
      width: 55.0,
      height: 55.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(AssetPaths.VIDEO_USER1_IMAGE),
              fit: BoxFit.cover)),
    );
  }

  Widget _notificationDetailWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                AppStrings.USER_NAME_TEXT,
                style: TextStyle(
                    color: AppColors.BLACK_COLOR, fontWeight: FontWeight.w600),
                textScaleFactor: 1.2,
              ),
            ),
            Text(
              AppStrings.NOTIFICATION_DATE_TEXT,
              style: TextStyle(
                  color: AppColors.BLACK_COLOR, fontWeight: FontWeight.w600),
              textScaleFactor: 1.05,
            ),
          ],
        ),
        SizedBox(
          height: 4.0,
        ),
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text(
              AppStrings.NOTIFICATION_DESCRIPTION_TEXT,
              style: TextStyle(
                  color: AppColors.BLACK_COLOR, fontWeight: FontWeight.w400),
              textScaleFactor: 1.1,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )),
      ],
    );
  }
}
