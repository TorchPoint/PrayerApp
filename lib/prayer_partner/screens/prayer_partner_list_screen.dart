import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/chat_audio_video/screens/chat_screen.dart';
import 'package:prayer_hybrid_app/common_classes/share_class.dart';
import 'package:prayer_hybrid_app/prayer_partner/screens/add_prayer_partner_screen.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/widgets/custom_button.dart';



class PrayerPartnerListScreen extends StatefulWidget {
  @override
  _PrayerPartnerListScreenState createState() => _PrayerPartnerListScreenState();
}

class _PrayerPartnerListScreenState extends State<PrayerPartnerListScreen> {
  List<String> prayerPartnerList = ["Ben","Mildred","Andy","Christina","George","Bryan"];
  int prayerPartnerSelectedIndex = 0;
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
                  itemCount: prayerPartnerList.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return _praiyerGroupsListWidget(index);
                  }
              ),
            ),
            SizedBox(height: 19.0,),

            _addPrayerButtonWidget(),
            SizedBox(height: 12.0,),
            _inviteToPrayerAppWidget(),

            SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }

  //Custom App Bar Widget
  Widget _customAppBar()
  {
    return CustomAppBar(
      title: AppStrings.PRAYER_PARTNERS_TEXT,
      leadingIconPath: AssetPaths.BACK_ICON,
      paddingTop: 20.0,
      leadingTap: (){
        AppNavigation.navigatorPop(context);
      },
      trailingIconPath: AssetPaths.SEARCH_ICON,
    );
  }




  //Prayer Groups List Widget
  Widget _praiyerGroupsListWidget(int partnerIndex)
  {
    return GestureDetector(
      onTap: (){
        print("next screen");
        //AppNavigation.navigateTo(context, FinishPrayingScreen());
        AppNavigation.navigateTo(context, ChatScreen());
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.85,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.075,right: MediaQuery.of(context).size.width*0.075,top: 7.5,bottom: 7.5),
        padding: EdgeInsets.only(top: 6.0,bottom: 6.0,left: 12.0,right: 12.0),
        decoration: BoxDecoration(
            color:AppColors.WHITE_COLOR,
            borderRadius: BorderRadius.circular(40.0),
        ),
        child: Row(
          children: [
            Container(
              width: 38.0,
              height: 38.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AssetPaths.PARTNER_IMAGE),
                  fit: BoxFit.cover
                )
              ),
            ),

            SizedBox(
              width: 15.0,
            ),

            Expanded(
              child: Text(prayerPartnerList[partnerIndex],style: TextStyle(fontSize: 15.5,color:AppColors.BLACK_COLOR,fontWeight: FontWeight.w700),maxLines: 1,overflow: TextOverflow.ellipsis,),
            ),


          ],
        ),
      ),
    );
  }



  //Add new prayer button widget
  Widget _addPrayerButtonWidget()
  {
    return CustomButton(
      containerWidth: MediaQuery.of(context).size.width*0.75,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: true,
      buttonText: AppStrings.ADD_NEW_PRAYER_PARTNER_TEXT.toUpperCase(),
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.2,
      paddingTop: 13.5,
      paddingBottom: 13.5,
      onTap: (){
        AppNavigation.navigateTo(context, AddPrayerPartnerScreen());
      },
    );
  }


  //Add new prayer button widget
  Widget _inviteToPrayerAppWidget()
  {
    return CustomButton(
      containerWidth: MediaQuery.of(context).size.width*0.75,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: true,
      buttonText: AppStrings.INVITE_TO_PRAYER_APP.toUpperCase(),
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.2,
      paddingTop: 13.5,
      paddingBottom: 13.5,
      onTap: (){
        _inviteFriend();
      },
    );
  }


  void _inviteFriend()
  {
    ShareClass.shareMethod(message: AppStrings.SHARE_MESSAGE_TEXT);
  }


}
