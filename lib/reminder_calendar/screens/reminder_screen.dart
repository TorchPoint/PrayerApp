import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  List<String> title = ["Marriage","Mom","Victoria","Mildred","Thanking God"];
  List<String> message = ["Need to pray at 4:30 today","Need to pray at 8:00 today","Need to pray at 1:00 pm tomorrow","Need to pray at 6:00 pm tomorrow","Need to pray at 12:00 pm on 28th Feb"];
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Scaffold(
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        body: Column(
          children: [
            _customAppBar(),
            SizedBox(height: 10.0,),
            Expanded(
                child:ListView.builder(
                    itemCount: title.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return _reminderContainer(index);
                    }
                )
            ),
          ],
        ),
      ),
    );
  }

  //Custom App Bar Widget
  Widget _customAppBar()
  {
    return CustomAppBar(
      title: AppStrings.REMINDERS_TEXT,
      leadingIconPath: AssetPaths.BACK_ICON,
      leadingTap: (){
        AppNavigation.navigatorPop(context);
      },
      trailingIconPath: AssetPaths.ADD_ICON,
      trailingTap: (){
        print("Add Icon");
      },
    );
  }


  Widget _reminderContainer(int reminderIndex)
  {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.075,right: MediaQuery.of(context).size.width*0.075,top:reminderIndex == 0 ? 15.0 : 8.0,bottom: reminderIndex == title.length -1 ? 16.0 : 8.0),
      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 13.0,bottom: 13.0),
      decoration: BoxDecoration(
        color: reminderIndex == 0 ?AppColors.BUTTON_COLOR :AppColors.WHITE_COLOR,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: reminderIndex == 0 ?
        [
          BoxShadow(
            color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]
            :
           []
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title[reminderIndex],style: TextStyle(color: reminderIndex == 0 ? AppColors.WHITE_COLOR :AppColors.BLACK_COLOR,fontWeight: FontWeight.w800),textScaleFactor: 1.0,maxLines: 1,overflow: TextOverflow.ellipsis,),
          SizedBox(height: 1.0,),
          Text(message[reminderIndex],style: TextStyle(color: reminderIndex == 0 ? AppColors.WHITE_COLOR : AppColors.BLACK_COLOR,fontWeight: FontWeight.w600),textScaleFactor: 1.0),
        ],
      ),
    );
  }



}
