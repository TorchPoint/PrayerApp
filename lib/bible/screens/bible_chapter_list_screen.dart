import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/bible/screens/bible_chapter_details_screen.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';

class BibleChapterListScreen extends StatefulWidget {
  @override
  _BibleChapterListScreenState createState() => _BibleChapterListScreenState();
}

class _BibleChapterListScreenState extends State<BibleChapterListScreen> {
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
                  SizedBox(height: 10.0,),
                  Text(AppStrings.GENESIS_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600,letterSpacing: 1.0),textScaleFactor: 1.5,),
                  SizedBox(height: 15.0,),
                  Expanded(
                    child:ListView.builder
                      (
                        itemCount: 10,
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return _bibleChaptersList(index);
                        }
                    ),
                  ),
                ],
              ),
            )
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
    );
  }

  Widget _bibleChaptersList(int bibleChapterIndex)
  {
    return GestureDetector(
      onTap: (){
        print("bible chapter screen");
        AppNavigation.navigateTo(context, BibleChapterDetailsScreen());
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.85,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.075,right: MediaQuery.of(context).size.width*0.075,top: 7.5,bottom: bibleChapterIndex == 9 ? 15.0 : 7.5),
        padding: EdgeInsets.only(top: 13.0,bottom: 13.0,left: 20.0,right: 20.0),
        decoration: BoxDecoration(
          color: AppColors.WHITE_COLOR,
          borderRadius: BorderRadius.circular(23.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text("Chapter ${bibleChapterIndex+1}",style: TextStyle(fontSize: 14.5,color: AppColors.BLACK_COLOR,fontWeight: FontWeight.w700),maxLines: 1,overflow: TextOverflow.ellipsis,),
            ),

          ],
        ),
      ),
    );
  }
}
