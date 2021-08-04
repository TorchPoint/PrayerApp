import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/chat_audio_video/screens/chat_screen.dart';
import 'package:prayer_hybrid_app/prayer_group/screens/create_prayer_group_screen.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/widgets/custom_button.dart';



class PrayerGroupListScreen extends StatefulWidget {
  @override
  _PrayerGroupListScreenState createState() => _PrayerGroupListScreenState();
}

class _PrayerGroupListScreenState extends State<PrayerGroupListScreen> {
  List<String> prayerGroupList = ["Test","Friends","Family","Church","Church And Family","Home"];
  int prayerGroupSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Scaffold(
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        body: Column(
          children: [
            _customAppBar(),
            SizedBox(height: 20.0,),
            Expanded(
              child:ListView.builder
                (
                  itemCount: prayerGroupList.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return _praiyerGroupsListWidget(index);
                  }
              ),
            ),
            SizedBox(height: 19.0,),

            _createGroupWidget(),

            SizedBox(height: 25.0,),
          ],
        ),
      ),
    );
  }

  //Custom App Bar Widget
  Widget _customAppBar()
  {
    return CustomAppBar(
      title: AppStrings.PRAYER_GROUPS_TEXT,
      leadingIconPath: AssetPaths.BACK_ICON,
      paddingTop: 20.0,
      leadingTap: (){
        AppNavigation.navigatorPop(context);
      },
      trailingIconPath: AssetPaths.EDIT_ICON,
      trailingTap: (){
        print("Edit Icon 2");
        AppNavigation.navigateTo(context, CreatePrayerGroupScreen());
      },
    );
  }




  //_prayerGroupsListWidget
  Widget _praiyerGroupsListWidget(int groupIndex)
  {
    return GestureDetector(
      onTap: (){
        print("next screen");
        //AppNavigation.navigateTo(context, FinishPrayingScreen());
        AppNavigation.navigateTo(context, ChatScreen());
      },
      onLongPress: (){
        setState(() {
          prayerGroupSelectedIndex = groupIndex;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.85,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.075,right: MediaQuery.of(context).size.width*0.075,top: 7.5,bottom: 7.5),
        padding: EdgeInsets.only(top: 13.0,bottom: 13.0,left: 20.0,right: 20.0),
        decoration: BoxDecoration(
            color: prayerGroupSelectedIndex ==  groupIndex ? AppColors.BUTTON_COLOR :AppColors.WHITE_COLOR,
            borderRadius: BorderRadius.circular(23.0),
            boxShadow: prayerGroupSelectedIndex == groupIndex ?
            [
              BoxShadow(
                color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]
                :
            []
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(prayerGroupList[groupIndex],style: TextStyle(fontSize: 14.5,color:prayerGroupSelectedIndex == groupIndex ? AppColors.WHITE_COLOR : AppColors.BLACK_COLOR,fontWeight: FontWeight.w700),maxLines: 1,overflow: TextOverflow.ellipsis,),
            ),


          ],
        ),
      ),
    );
  }



  //Create Group Button Widget
  Widget _createGroupWidget()
  {
    return CustomButton(
      containerWidth: MediaQuery.of(context).size.width*0.73,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: true,
      buttonText: AppStrings.ADD_NEW_GROUP_TEXT.toUpperCase(),
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.2,
      paddingTop: 13.5,
      paddingBottom: 13.5,
      onTap: (){
        AppNavigation.navigateTo(context, CreatePrayerGroupScreen());
      },
    );
  }

}
