import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';


class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
                      SizedBox(height: 20.0,),
                      //For Profile Container
                      Container(
                        color:AppColors.WHITE_COLOR,
                        child: profileImage(),
                      ),
                      //For Menu Container
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(AssetPaths.DRAWER_BACKGROUND_IMAGE),fit: BoxFit.fill),
                          ),
                          //child: userMenuData(),
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
            Text("ok"),
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

     },
    );
  }


  //Profile Data
  Widget profileImage()
  {
    return Column(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              color:AppColors.WHITE_COLOR,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.IMAGE_BACKGROUND_COLOR,width: 4.0)
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.2,vertical: 1.2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(AssetPaths.PROFILE_IMAGE),
              fit: BoxFit.fill),
            ),
          ),
        ),

        profileSubData(),

      ],
    );
  }

  //Profile Sub Data
  Widget profileSubData()
  {
    return GestureDetector(
      onTap: (){
        //AppNavigation.navigatorPop(context);
        //goToCompleteProfileScreen();
        //AppNavigation.navigatorPop(context);
      },
      child: Column(
        children: [
          SizedBox(height: 7.0,),
          Padding(
            padding: EdgeInsets.only(left: 2.0,right: 2.0),
              child: Text(AppStrings.USER_NAME_TEXT,style: TextStyle(color: AppColors.IMAGE_BACKGROUND_COLOR,fontWeight: FontWeight.w600),textScaleFactor: 1.4,textAlign: TextAlign.center,),
          ),

          SizedBox(height: 6.0,),

          Padding(
            padding: EdgeInsets.only(left: 2.0,right: 2.0),
              child: Text(AppStrings.USER_EMAIL_TEXT,style: TextStyle(color: AppColors.IMAGE_BACKGROUND_COLOR,letterSpacing: 1.0,fontWeight: FontWeight.w500),textScaleFactor: 1.1,textAlign: TextAlign.center,)
          ),
          SizedBox(height: 6.0,),
        ],
      ),
    );
  }

  // Widget menuData()
  // {
  //   return Column(
  //     children: [
  //       SizedBox(height: MediaQuery.of(context).size.height*0.15,),
  //       Expanded(
  //         child: ListView(
  //           children: [
  //             //For home
  //             menuListTile(imagePath: AssetPaths.HOME_MENU_ICON,title: AppStrings.HOME_TEXT,index:1),
  //
  //
  //             //For Schedule
  //             menuListTile(imagePath: AssetPaths.SCHEDULE_MENU_ICON,title: AppStrings.SCHEDULE_TEXT,index:2),
  //
  //
  //             //For Payment Cards
  //             menuListTile(imagePath: AssetPaths.PAYMENT_MENU_ICON,title: AppStrings.PAYMENT_MENU_TEXT,index:3),
  //
  //
  //             //For Terms And Conditions
  //             menuListTile(imagePath: AssetPaths.TC_MENU_ICON,title: AppStrings.TERMS_CONDITIONS_TEXT,index:4),
  //
  //             //For Privacy Policy
  //             menuListTile(imagePath: AssetPaths.PRIVACY_POLICY_MENU_ICON,title: AppStrings.PRIVACY_POLICY_TEXT,index:5),
  //
  //             //For History
  //             menuListTile(imagePath: AssetPaths.HISTORY_MENU_ICON,title: AppStrings.HISTORY_TEXT,index:6,iconColor: AppColors.DARK_YELLOW_COLOR),
  //
  //
  //             //For Help And Feedback
  //             menuListTile(imagePath: AssetPaths.HELP_FEEDBACK_MENU_ICON,title: AppStrings.HELP_FEEDBACK_TEXT,index:7,iconColor: AppColors.DARK_YELLOW_COLOR),
  //
  //             //For Logout
  //             menuListTile(imagePath: AssetPaths.LOGOUT_MENU_ICON,title: AppStrings.LOGOUT_TEXT,index:8),
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }



}
