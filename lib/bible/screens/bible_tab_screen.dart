import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/bible/screens/bible_prayer_list_screen.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';


class BibleTabScreen extends StatefulWidget {
  @override
  _BibleTabScreenState createState() => _BibleTabScreenState();
}

class _BibleTabScreenState extends State<BibleTabScreen> with SingleTickerProviderStateMixin{
  TabController _bibleTabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bibleTabController = new TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Scaffold(
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        body: Column(
          children: [
            _customAppBar(),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 8.0,),
                  _tabBarWidget(),
                  SizedBox(height: 10.0,),
                  Expanded(
                    child: TabBarView(
                        controller: _bibleTabController,
                        children: [
                          BiblePrayerListScreen(),
                          BiblePrayerListScreen(),
                          BiblePrayerListScreen(),
                        ]
                    ),
                  ),
                ],
              ) ,
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
      title: AppStrings.BIBLE_SECOND_TEXT,
      leadingIconPath: AssetPaths.BACK_ICON,
      leadingTap: (){
        AppNavigation.navigatorPop(context);
      },
      trailingIconPath: AssetPaths.SETTING_ICON,
      trailingTap: (){
        print("Setting Icon");
      },
    );
  }

  //Tab Bar Widget
  Widget _tabBarWidget()
  {
    return Theme(
      data: ThemeData(
        splashColor: AppColors.TRANSPARENT_COLOR,
        highlightColor: AppColors.TRANSPARENT_COLOR,
      ),
      child: TabBar(
        controller: _bibleTabController,
        isScrollable: true,
        unselectedLabelColor: AppColors.TRANSPARENT_COLOR,
        labelColor: AppColors.TRANSPARENT_COLOR,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BubbleTabIndicator(
          indicatorColor: AppColors.BUTTON_COLOR,
          tabBarIndicatorSize: TabBarIndicatorSize.label,
          indicatorRadius: 30.0,
          padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 11.0,bottom: 9.0),
        ),
        tabs: [
          Tab(
            child: Padding(
                padding: EdgeInsets.only(left: 7.0,right: 7.0),
                child: Text(AppStrings.PRAYERS_TEXT.toUpperCase(),style: TextStyle(color: AppColors.WHITE_COLOR),textScaleFactor: 1.1,)
            ),
          ),
          Tab(
            child: Padding(
                padding: EdgeInsets.only(left: 7.0,right: 7.0),
                child: Text(AppStrings.HIGHLIGHTS_TEXT.toUpperCase(),style: TextStyle(color: AppColors.WHITE_COLOR),textScaleFactor: 1.1,)
            ),
          ),
          Tab(
            child: Padding(
                padding: EdgeInsets.only(left: 7.0,right: 7.0),
                child: Text(AppStrings.NOTES_TEXT.toUpperCase(),style: TextStyle(color: AppColors.WHITE_COLOR),textScaleFactor: 1.1,)
            ),
          ),
        ],
      ),
    );
  }


}
