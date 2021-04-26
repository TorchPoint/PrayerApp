import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/add_prayer/screens/add_prayer_screen.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';


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
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child:Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.TRANSPARENT_COLOR,
          drawer:Container(
            color: AppColors.WHITE_COLOR,
            child: SafeArea(
              child: Drawer(
                child: Container(
                  color: AppColors.WHITE_COLOR,
                  child: Column(
                    children: [
                      //For Profile Container
                      Container(
                        color:AppColors.WHITE_COLOR,
                        //height: MediaQuery.of(context).size.height*0.35,
                        child: profileData(),
                      ),
                      //For Menu Container
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(AssetPaths.DRAWER_BACKGROUND_IMAGE),fit: BoxFit.fill),
                          ),
                          child: userMenuData(),
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),
        body:Column(
          children: [
            _customAppBar(),
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
                  padding: EdgeInsets.symmetric(horizontal: 6.0,vertical: 7.0),
                  decoration: BoxDecoration(
                      color: AppColors.MENU_TEXT_COLOR,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                      )
                  ),
                  child:Icon(Icons.close,color: AppColors.WHITE_COLOR,size: 25.0,)
              ),
            ),
          ],
        ),

        Container(
          width: 120.0,
          height: 120.0,
          color: AppColors.WHITE_COLOR,
          child: Stack(
            children: [
              Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                    color:AppColors.WHITE_COLOR,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.MENU_TEXT_COLOR,width: 4.0)
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 1.2,vertical: 1.2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:AssetImage(AssetPaths.PROFILE_IMAGE),
                        fit: BoxFit.fill),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                    onTap: (){
                      AppNavigation.navigatorPop(context);
                    },
                    child: Image.asset(AssetPaths.EDIT_MENU_ICON,width: 42.0,)
                ),
              )
            ],
          ),
        ),

        profileSubData(),

      ],
    );
  }

  //It includes user name , user phone no, user email
  Widget profileSubData()
  {
    return GestureDetector(
      onTap: (){
        AppNavigation.navigatorPop(context);
      },
      child: Column(
        children: [
          SizedBox(height: 8.0,),
          Padding(
              padding: EdgeInsets.only(left: 5.0,right: 5.0),
              child: Text(AppStrings.USER_NAME_TEXT,style: TextStyle(color: AppColors.MENU_TEXT_COLOR,fontWeight: FontWeight.w800,letterSpacing: 0.5),textScaleFactor: 1.5,textAlign: TextAlign.center,)
          ),
          SizedBox(height: 6.0,),
          Padding(
              padding: EdgeInsets.only(left: 5.0,right: 5.0),
              child: Text(AppStrings.USER_PHONE_NO_TEXT,style: TextStyle(color: AppColors.BLACK_COLOR,fontWeight: FontWeight.w700),textScaleFactor: 1.1,textAlign: TextAlign.center,)
          ),
          SizedBox(height: 5.0,),
          Padding(
              padding: EdgeInsets.only(left: 5.0,right: 5.0),
              child: Text(AppStrings.USER_EMAIL_TEXT,style: TextStyle(color: AppColors.BLACK_COLOR,fontWeight: FontWeight.w700),textScaleFactor: 1.1,textAlign: TextAlign.center,)
          ),
          SizedBox(height: 6.0,),
        ],
      ),
    );
  }

  Widget userMenuData()
  {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.15,),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [

              //For My Prayer List
              menuListTile(imagePath: AssetPaths.PRAYER_LIST_MENU_ICON,title: AppStrings.MY_PRAYER_LIST_TEXT,index:1,topMargin:9.0,bottomMargin:9.0,imageWidth: 23,sizedBoxWidth:19,leftPadding:20.0),

              //For My Praise List
              menuListTile(imagePath: AssetPaths.PRAISE_LIST_MENU_ICON,title: AppStrings.MY_PRAISE_LIST_TEXT,index:2,topMargin:9.0,bottomMargin:9.0,imageWidth: 30,sizedBoxWidth:14,leftPadding:18.0),

              //For Shared Prayers
              menuListTile(imagePath: AssetPaths.SHARED_PRAYERS_MENU_ICON,title: AppStrings.SHARED_PRAYERS_TEXT,index:3,topMargin:9.0,bottomMargin:9.0,imageWidth: 23,sizedBoxWidth:21,leftPadding:18.0),

              //For Prayer Groups List
              menuListTile(imagePath: AssetPaths.PRAYER_GROUPS_MENU_ICON,title: AppStrings.PRAYER_GROUPS_TEXT,index:4,topMargin:9.0,bottomMargin:9.0,imageWidth: 23,sizedBoxWidth:21,leftPadding:18.0),

              //For Report
              menuListTile(imagePath: AssetPaths.REPORT_MENU_ICON,title: AppStrings.REPORT_TEXT,index:5,topMargin:9.0,bottomMargin:9.0,imageWidth: 22,sizedBoxWidth:20,leftPadding:20.0),

              //For Settings
              menuListTile(imagePath: AssetPaths.SETTINGS_MENU_ICON,title: AppStrings.SETTINGS_TEXT,index:6,topMargin:settingsOn == true ? 12.0 : 9.0,bottomMargin:settingsOn == true ? 9.0 : 9.0,imageWidth: 22,sizedBoxWidth:20,leftPadding:20.0,backgroundContainerColor: settingsOn == true ? AppColors.SETTINGS_OPTIONS_COLOR.withOpacity(0.9) : AppColors.TRANSPARENT_COLOR,settingIcon: settingsOn == true ? Icons.keyboard_arrow_down : null),

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
                      menuListTile(imagePath: AssetPaths.NOTIFICATION_MENU_ICON,title: AppStrings.NOTIFICATION_TEXT,index:7,topMargin:9.0,bottomMargin:9.0,imageWidth: 21,sizedBoxWidth:35,leftPadding:20.0),

                      //For Timer
                      menuListTile(imagePath: AssetPaths.TIMER_MENU_ICON,title: AppStrings.TIMER_TEXT,index:8,topMargin:9.0,bottomMargin:9.0,imageWidth: 22,sizedBoxWidth:34,leftPadding:20.0),

                      //For Security
                      menuListTile(imagePath: AssetPaths.SECURITY_MENU_ICON,title: AppStrings.SECURITY_TEXT,index:9,topMargin:9.0,bottomMargin:9.0,imageWidth: 20,sizedBoxWidth:37,leftPadding:20.0),
                    ],
                  ),
                )

           ),

              //For Logout
              menuListTile(imagePath: AssetPaths.LOGOUT_MENU_ICON,title: AppStrings.LOGOUT_TEXT,index:10,topMargin:9.0,bottomMargin:9.0,imageWidth: 18,sizedBoxWidth:26,leftPadding:20.0,imageColor: AppColors.WHITE_COLOR.withOpacity(0.8)),

              SizedBox(height: 5.0,),





            ],
          ),
        )
      ],
    );
  }

  Widget menuListTile({String imagePath,String title,Widget menuWidget,int index,Color imageColor,double topMargin,double bottomMargin,double imageWidth,double sizedBoxWidth,double leftPadding,Color backgroundContainerColor,IconData settingIcon})
  {
    return GestureDetector(
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
            Expanded(child: Text(title,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600),textScaleFactor: 1.1,)),
            settingIcon != null ?
            Padding(
              padding: EdgeInsets.only(right: 10.0),
                child: Icon(settingIcon,color: AppColors.WHITE_COLOR.withOpacity(0.9),)
            )
            :Container(),

          ],
        ),
      ),
    );
  }


  void navigateToNewScreen({int navigateIndex})
  {
    //For My Prayer List
    if(navigateIndex == 1)
    {
      AppNavigation.navigatorPop(context);
    }
    //For My Praise List
    else if(navigateIndex == 2)
    {
      AppNavigation.navigatorPop(context);
    }
    //For Shared Prayers
    else if(navigateIndex == 3)
    {
      AppNavigation.navigatorPop(context);
      AppNavigation.navigateTo(context, AddPrayerScreen());
    }
    //For Prayer Groups List
    else if(navigateIndex == 4)
    {
      AppNavigation.navigatorPop(context);
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
    }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

}
