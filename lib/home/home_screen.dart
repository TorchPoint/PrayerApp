import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/add_praise/screens/add_praise_screen.dart';
import 'package:prayer_hybrid_app/add_prayer/screens/add_prayer_screen.dart';
import 'package:prayer_hybrid_app/bible/screens/bible_tab_screen.dart';
import 'package:prayer_hybrid_app/drawer/drawer_screen.dart';
import 'package:prayer_hybrid_app/prayer_partner/screens/add_prayer_partner.dart';
import 'package:prayer_hybrid_app/prayer_praise_info/screens/pray_now_screen.dart';
import 'package:prayer_hybrid_app/reminder/screens/reminder_screen.dart';
import 'package:prayer_hybrid_app/subscription/screens/buy_now_subscription.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _prayNowCategoryWidget(),
            SizedBox(width: MediaQuery.of(context).size.width*0.05,),
            _addPrayerCategoryWidget(),
          ],
        ),

        SizedBox(height: 15.0,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _bibleCategoryWidget(),
            SizedBox(width: MediaQuery.of(context).size.width*0.05,),
            _addPraiseCategoryWidget(),
          ],
        ),

        SizedBox(height: 15.0,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _prayerPartnersSubscriptionCategoryWidget(),
            SizedBox(width: MediaQuery.of(context).size.width*0.05,),
            _reminderCategoryWidget(),
          ],
        )



      ],
    );
  }

  //Pray Now Category Widget
  Widget _prayNowCategoryWidget()
  {
    return GestureDetector(
      onTap: (){
        AppNavigation.navigateTo(context, PrayNowScreen());
      },
        child: _categoryContainerWidget(AppStrings.PRAY_NOW_TEXT,AssetPaths.PRAY_NOW_IMAGE,6.0,0.13),
    );
  }


  //Add Prayer Category Widget
  Widget _addPrayerCategoryWidget()
  {
    return GestureDetector(
      onTap: (){
        AppNavigation.navigateTo(context, AddPrayerScreen());
      },
      child: _categoryContainerWidget(AppStrings.ADD_PRAYER_TEXT,AssetPaths.ADD_PRAYER_IMAGE,7.5,0.13),
    );
  }


  //The Bible Category Widget
  Widget _bibleCategoryWidget()
  {
    return GestureDetector(
      onTap: (){
        AppNavigation.navigateTo(context, BibleTabScreen());
      },
      child: _categoryContainerWidget(AppStrings.BIBLE_TEXT,AssetPaths.BIBLE_IMAGE,6.0,0.13),
    );
  }


  //Add Praise Category Widget
  Widget _addPraiseCategoryWidget()
  {
    return GestureDetector(
      onTap: (){
        AppNavigation.navigateTo(context, AddPraiseScreen());
      },
      child: _categoryContainerWidget(AppStrings.ADD_PRAISE_TEXT,AssetPaths.ADD_PRAISE_IMAGE,6.0,0.16),
    );
  }

  //Prayer Partners Without Category Widget
  Widget _prayerPartnersWithoutSubscriptionCategoryWidget()
  {
    return GestureDetector(
      onTap: (){
        AppNavigation.navigateTo(context, BuyNowSubscription());
      },
      child: _categoryContainerWidget(AppStrings.PRAYER_PARTNERS_TEXT,AssetPaths.PRAYER_PARTNER_WITHOUT_SUBSCRIPTION_IMAGE,6.0,0.12),
    );
  }

  //Reminder Category Widget
  Widget _reminderCategoryWidget()
  {
    return GestureDetector(
      onTap: (){
      AppNavigation.navigateTo(context, ReminderScreen());
      },
      child: _categoryContainerWidget(AppStrings.REMINDER_TEXT,AssetPaths.REMINDER_IMAGE,6.0,0.09),
    );
  }



  Widget _categoryContainerWidget(String title,String imagePath,double sizeHeight,double imageWidth)
  {
    return Container(
      width: MediaQuery.of(context).size.width*0.39,
      height: MediaQuery.of(context).size.height*0.2,
      decoration: BoxDecoration(
          color: AppColors.WHITE_COLOR,
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.39,
            height: MediaQuery.of(context).size.height*0.113,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*imageWidth,
                  height: MediaQuery.of(context).size.height*0.065,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.contain
                    )
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: sizeHeight,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 2.0,right: 2.0),
                child: Text(title.toString(),style:TextStyle(color: AppColors.BLACK_COLOR,fontWeight: FontWeight.w700),textScaleFactor:1.1,overflow: TextOverflow.ellipsis,maxLines: 2,)
            ),
          )

        ],
      ),
    );
  }


  //Prayer Partners Subscription Category Widget
  Widget _prayerPartnersSubscriptionCategoryWidget()
  {
    return GestureDetector(
        onTap: (){
          AppNavigation.navigateTo(context, BuyNowSubscription());
        },
        child: Container(
          width: MediaQuery.of(context).size.width*0.39,
          height: MediaQuery.of(context).size.height*0.2,
          decoration: BoxDecoration(
              color: AppColors.WHITE_COLOR,
              borderRadius: BorderRadius.circular(8.0)
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.19,
                  height: MediaQuery.of(context).size.height*0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0)),
                    image: DecorationImage(
                        image: AssetImage(AssetPaths.SUBSCRIPTION_TEXT_IMAGE),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
              ),

              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.39,
                    height: MediaQuery.of(context).size.height*0.113,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.12,
                          height: MediaQuery.of(context).size.height*0.065,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(AssetPaths.PRAYER_PARTNER_SUBSCRIPTION_IMAGE),
                                  fit: BoxFit.contain
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.0,),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(left: 2.0,right: 2.0),
                        child: Text(AppStrings.PRAYER_PARTNERS_TEXT,style:TextStyle(color: AppColors.BLACK_COLOR,fontWeight: FontWeight.w700),textScaleFactor:1.1,overflow: TextOverflow.ellipsis,maxLines: 2,textAlign: TextAlign.center,)
                    ),
                  )

                ],
              ),
            ],
          ),
        )
    );
  }

}
