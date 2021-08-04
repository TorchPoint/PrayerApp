import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/auth/screens/auth_main_screen.dart';
import 'package:prayer_hybrid_app/home/home_screen.dart';
import 'package:prayer_hybrid_app/prayer_group/screens/prayer_group_list_screen.dart';
import 'package:prayer_hybrid_app/prayer_praise_info/screens/prayer_praise_tab_screen.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/complete_profile/screens/complete_profile_screen.dart';


class DrawerScreen extends StatefulWidget{
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool settingsOn = false;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child:Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.TRANSPARENT_COLOR,
          drawer:Drawer(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        AppColors.BACKGROUND1_COLOR,
                        AppColors.BACKGROUND2_COLOR,
                        AppColors.BACKGROUND2_COLOR,
                      ],
                      stops: [0.1,0.5,1.0]

                  )
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    //For Profile Container
                    profileData(),
                    //For Menu Container
                    Expanded(
                      child: userMenuData(),
                    )

                  ],
                ),
              ),
            ),
          ),
        body:Column(
          children: [
            _customAppBar(),
            Expanded(
              child:HomeScreen(),
            ),
          ],
        )
      )
    );
  }

  //Custom App Bar Widget
  Widget _customAppBar()
  {
    return CustomAppBar(
     title: AppStrings.HOME_TEXT,
     leadingIconPath: AssetPaths.MENU_ICON,
      paddingTop: 20.0,
      isBarImage: false,
      leadingIconSize: 25.0,
     leadingTap: (){
       _scaffoldKey.currentState.openDrawer();
     },
     trailingIconPath: AssetPaths.NOTIFICATION_ICON,
     trailingTap: (){
       print("Notification Icon");
     },
    );
  }

 //It includes user image and and close drawer button
  Widget profileData()
  {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: (){
                AppNavigation.navigatorPop(context);
              },
              child: Container(
                     width: 21.0,
                     height: 21.0,
                     margin: EdgeInsets.only(right: 20.0,top: 12.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetPaths.BACK_ICON),
                        fit: BoxFit.contain
                      )
                    ),),
            ),
          ],
        ),

        GestureDetector(
          onTap: (){
            log("ok ha");
           // AppNavigation.navigateTo(context,CompleteProfileScreen());
          },
          child: Container(
            margin: EdgeInsets.only(left: 18.0,right: 15.0,top: MediaQuery.of(context).size.height*0.04,bottom: MediaQuery.of(context).size.height*0.07),
            child: Row(
              children: [
                Container(
                  width: 90.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                    color:AppColors.WHITE_COLOR,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.WHITE_COLOR,width: 2.0),
                    image: DecorationImage(
                        image:AssetImage(AssetPaths.PROFILE_IMAGE),
                        fit: BoxFit.cover),
                  ),

                ),

                SizedBox(width: 5.0,),

                Expanded(child: profileSubData()),
              ],
            ),
          ),
        )



      ],
    );
  }

  //It includes user name , user phone no, user email
  Widget profileSubData()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.0,),
        Padding(
            padding: EdgeInsets.only(left: 5.0,right: 5.0),
            child: Text(AppStrings.USER_NAME_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w700,letterSpacing: 0.5),textScaleFactor: 1.25,textAlign: TextAlign.start,maxLines: 2,overflow: TextOverflow.ellipsis,)
        ),
        SizedBox(height: 6.0,),
        Padding(
            padding: EdgeInsets.only(left: 5.0,right: 5.0),
            child: Text(AppStrings.USER_PHONE_NO_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w700),textScaleFactor: 0.98,textAlign: TextAlign.start,maxLines: 2,overflow: TextOverflow.ellipsis,)
        ),
        SizedBox(height: 5.0,),
        Padding(
            padding: EdgeInsets.only(left: 5.0,right: 5.0),
            child: Text(AppStrings.USER_EMAIL_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w700),textScaleFactor: 0.98,textAlign: TextAlign.start,maxLines: 2,overflow: TextOverflow.ellipsis,)
        ),
        SizedBox(height: 6.0,),
      ],
    );
  }

  Widget userMenuData()
  {
    return ListView(
      padding: EdgeInsets.zero,
      children: [

        //For My Prayer List
        menuListTile(imagePath: AssetPaths.PRAYER_LIST_MENU_ICON,title: AppStrings.MY_PRAYER_LIST_TEXT,index:1,topMargin:13.0,bottomMargin:13.0,imageWidth: 20,sizedBoxWidth:22,leftPadding:20.0),

        //For My Praise List
        menuListTile(imagePath: AssetPaths.PRAISE_LIST_MENU_ICON,title: AppStrings.MY_PRAISE_LIST_TEXT,index:2,topMargin:13.0,bottomMargin:13.0,imageWidth: 30,sizedBoxWidth:14,leftPadding:18.0),

        //For Shared Prayers
        menuListTile(imagePath: AssetPaths.SHARED_PRAYERS_MENU_ICON,title: AppStrings.SHARED_PRAYERS_TEXT,index:3,topMargin:13.0,bottomMargin:13.0,imageWidth: 23,sizedBoxWidth:21,leftPadding:18.0),

        //For Prayer Groups List
        menuListTile(imagePath: AssetPaths.PRAYER_GROUPS_MENU_ICON,title: AppStrings.PRAYER_GROUPS_TEXT,index:4,topMargin:13.0,bottomMargin:13.0,imageWidth: 23,sizedBoxWidth:21,leftPadding:18.0),

        //For Report
        menuListTile(imagePath: AssetPaths.REPORT_MENU_ICON,title: AppStrings.REPORT_TEXT,index:5,topMargin:13.0,bottomMargin:13.0,imageWidth: 22,sizedBoxWidth:20,leftPadding:20.0),

        //For Settings
        menuListTile(imagePath: AssetPaths.SETTINGS_MENU_ICON,title: AppStrings.SETTINGS_TEXT,index:6,topMargin:13.0,bottomMargin:13.0,imageWidth: 22,sizedBoxWidth:20,leftPadding:20.0,backgroundContainerColor: settingsOn == true ? AppColors.SETTINGS_OPTIONS_COLOR.withOpacity(0.9) : AppColors.TRANSPARENT_COLOR,settingIcon: settingsOn == true ? Icons.keyboard_arrow_down : null,dividerContainer: settingsOn == true ? false : true),

        //For Settings Option
        SizeTransition(
          sizeFactor: CurvedAnimation(
            curve: Curves.linear,
            parent: _animationController,
          ),
        child: Container(
          color: AppColors.SETTINGS_OPTIONS_COLOR.withOpacity(0.5),
            child: Column(
              children: [
                //For Notification
                menuListTile(imagePath: AssetPaths.NOTIFICATION_ICON,title: AppStrings.NOTIFICATION_TEXT,index:7,topMargin:10.0,bottomMargin:10.0,imageWidth: 21,sizedBoxWidth:35,leftPadding:20.0,dividerContainer: false),

                //For Timer
                menuListTile(imagePath: AssetPaths.TERMS_CONDITION_MENU_ICON,title: AppStrings.TERMS_CONDITIONS_TEXT,index:8,topMargin:10.0,bottomMargin:10.0,imageWidth: 18,sizedBoxWidth:38,leftPadding:20.0,dividerContainer: false),

                //For Security
                menuListTile(imagePath: AssetPaths.PRIVACY_POLICY_MENU_ICON,title: AppStrings.PRIVACY_POLICY_TEXT,index:9,topMargin:10.0,bottomMargin:10.0,imageWidth: 20,sizedBoxWidth:37,leftPadding:20.0),
              ],
            ),
          )

     ),

        //For Logout
        menuListTile(imagePath: AssetPaths.LOGOUT_MENU_ICON,title: AppStrings.LOGOUT_TEXT,index:10,topMargin:9.0,bottomMargin:9.0,imageWidth: 18,sizedBoxWidth:26,leftPadding:20.0,imageColor: AppColors.WHITE_COLOR.withOpacity(0.8)),

        SizedBox(height: 5.0,),





      ],
    );
  }

  Widget menuListTile({String imagePath,String title,Widget menuWidget,int index,Color imageColor,double topMargin,double bottomMargin,double imageWidth,double sizedBoxWidth,double leftPadding,Color backgroundContainerColor,IconData settingIcon,bool dividerContainer = true})
  {
    return Column(
      children: [
        GestureDetector(
          onTap: ()
          {
            navigateToNewScreen(navigateIndex:index);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: backgroundContainerColor ?? AppColors.TRANSPARENT_COLOR,
            padding: EdgeInsets.only(left: leftPadding,top: topMargin,bottom: bottomMargin),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(imagePath,width: imageWidth,color: imageColor),
                SizedBox(width: sizedBoxWidth,),
                Expanded(child: Text(title,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w700),textScaleFactor: 1.3,)),
                settingIcon != null ?
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                    child: Icon(settingIcon,color: AppColors.WHITE_COLOR.withOpacity(0.9),)
                )
                :Container(),

              ],
            ),
          ),
        ),
        Visibility(
          visible: dividerContainer,
          child: Container(
          width: MediaQuery.of(context).size.width,
          height: 0.5,
          color: AppColors.WHITE_COLOR,
          ),
        )


      ],
    );
  }


  void navigateToNewScreen({int navigateIndex})
  {
    //For My Prayer List
    if(navigateIndex == 1)
    {
      AppNavigation.navigatorPop(context);
      AppNavigation.navigateTo(context, PrayerPraiseTabScreen(tabInitialIndex: 0,));
    }
    //For My Praise List
    else if(navigateIndex == 2)
    {
      AppNavigation.navigatorPop(context);
      AppNavigation.navigateTo(context, PrayerPraiseTabScreen(tabInitialIndex: 1,));
    }
    //For Shared Prayers
    else if(navigateIndex == 3)
    {
      AppNavigation.navigatorPop(context);
      AppNavigation.navigateTo(context, PrayerPraiseTabScreen());
    }
    //For Prayer Groups List
    else if(navigateIndex == 4)
    {
      AppNavigation.navigatorPop(context);
      // AppNavigation.navigateTo(context, CreatePrayerGroupScreen());
      AppNavigation.navigateTo(context, PrayerGroupListScreen());
    }
    //For Report
    else if(navigateIndex == 5)
    {
      AppNavigation.navigatorPop(context);
    }
    //For Settings
    else if(navigateIndex == 6)
    {
      //AppNavigation.navigatorPop(context);

        settingsOn = !settingsOn;
        settingsOn == true ? _animationController.forward() : _animationController.reverse();
        setState(() {

        });

    }
    //For Notification
    else if(navigateIndex == 7)
    {
      AppNavigation.navigatorPop(context);
    }
    //For Timer
    else if(navigateIndex == 8)
    {
      AppNavigation.navigatorPop(context);
    }
    //For Security
    else if(navigateIndex == 9)
    {
      AppNavigation.navigatorPop(context);
    }
    //For Logout
    else if(navigateIndex == 10)
    {
      AppNavigation.navigatorPop(context);
      AppNavigation.navigateToRemovingAll(context, AuthMainScreen());
    }
  }


  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

}
