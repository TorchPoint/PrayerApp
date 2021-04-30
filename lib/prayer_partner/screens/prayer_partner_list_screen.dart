import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/widgets/custom_raised_button.dart';



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
            SizedBox(height: 10.0,),
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

            _addNewPrayerButtonWidget(),

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
      title: AppStrings.PRAYER_PARTNERS_TEXT,
      leadingIconPath: AssetPaths.BACK_ICON,
      leadingTap: (){
        AppNavigation.navigatorPop(context);
      },
    );
  }




  //Prayer Groups List Widget
  Widget _praiyerGroupsListWidget(int partnerIndex)
  {
    return GestureDetector(
      onTap: (){
        print("next screen");
        //AppNavigation.navigateTo(context, FinishPrayingScreen());
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.85,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.075,right: MediaQuery.of(context).size.width*0.075,top: 7.5,bottom: 7.5),
        padding: EdgeInsets.only(top: 13.0,bottom: 13.0,left: 20.0,right: 20.0),
        decoration: BoxDecoration(
            color:AppColors.WHITE_COLOR,
            borderRadius: BorderRadius.circular(23.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(prayerPartnerList[partnerIndex],style: TextStyle(fontSize: 14.5,color:AppColors.BLACK_COLOR,fontWeight: FontWeight.w700),maxLines: 1,overflow: TextOverflow.ellipsis,),
            ),


          ],
        ),
      ),
    );
  }



  //Add new prayer button widget
  Widget _addNewPrayerButtonWidget()
  {
    return CustomRaisedButton(
      containerWidth: MediaQuery.of(context).size.width*0.75,
      containerHeight: MediaQuery.of(context).size.height*0.072,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: 7.0,
      buttonText: AppStrings.ADD_NEW_PRAYER_PARTNER_TEXT.toUpperCase(),
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.10,
      onPressed: (){
        AppNavigation.navigatorPop(context);
      },
    );
  }

}
