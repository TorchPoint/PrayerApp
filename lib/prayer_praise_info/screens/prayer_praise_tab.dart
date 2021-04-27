import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/prayer_praise_info/screens/praise_list.dart';
import 'package:prayer_hybrid_app/prayer_praise_info/screens/prayers_list.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';

class PrayerPraiseTab extends StatefulWidget {
  int tabInitialIndex;
  PrayerPraiseTab({this.tabInitialIndex = 0});
  @override
  _PrayerPraiseTabState createState() => _PrayerPraiseTabState();
}

class _PrayerPraiseTabState extends State<PrayerPraiseTab> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, length: 2,initialIndex:widget.tabInitialIndex);
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
                 _tabBarWidget(),

                  SizedBox(height: 10.0,),
                  Expanded(
                    child: TabBarView(
                        controller: _tabController,
                        children: [
                          PrayersList(),
                         PraiseList(),
                        ]
                    ),
                  ),


                ],
              ),
            ),
          ],
        )
      ),
    );
  }

  //Custom App Bar Widget
  Widget _customAppBar()
  {
    return CustomAppBar(
      title: AppStrings.PRAYERS_TEXT,
      leadingIconPath: AssetPaths.BACK_ICON,
      leadingTap: (){
        AppNavigation.navigatorPop(context);
      },
      trailingIconPath: AssetPaths.A_TO_Z_ICON,
      trailingTap: (){
        print("A to Z icon");
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
      controller: _tabController,
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
              child: Text(AppStrings.PRAISES_TEXT.toUpperCase(),style: TextStyle(color: AppColors.WHITE_COLOR),textScaleFactor: 1.1,)
          ),
        ),
      ],
    ),
  );
}

}
