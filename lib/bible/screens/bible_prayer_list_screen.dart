import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';


class BiblePrayerListScreen extends StatefulWidget {
  @override
  _BiblePrayerListScreenState createState() => _BiblePrayerListScreenState();
}

class _BiblePrayerListScreenState extends State<BiblePrayerListScreen> {
  List<String> biblePrayerList = ["Genesis","Exodus","Leviticus","Numbers","Deuteronomy","Joshua","Judges","Rudh","1 Samuel","2 Samuel"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppStrings.OLD_TESTAMENT_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600),textScaleFactor: 1.55,),
        SizedBox(height: 15.0,),
        Expanded(
          child:ListView.builder
            (
              itemCount: biblePrayerList.length,
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext ctxt, int index) {
                return _prayersList(index);
              }
          ),
        ),
      ],
    );
  }


  Widget _prayersList(int biblePrayerIndex)
  {
    return GestureDetector(
      onTap: (){
        print("next screen");
        //AppNavigation.navigateTo(context, FinishPrayingScreen());
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.85,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.075,right: MediaQuery.of(context).size.width*0.075,top: 7.5,bottom: biblePrayerIndex == biblePrayerList.length -1 ? 15.0 : 7.5),
        padding: EdgeInsets.only(top: 13.0,bottom: 13.0,left: 15.0,right: 5.0),
        decoration: BoxDecoration(
            color: AppColors.WHITE_COLOR,
            borderRadius: BorderRadius.circular(23.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(biblePrayerList[biblePrayerIndex],style: TextStyle(fontSize: 14.5,color: AppColors.BLACK_COLOR,fontWeight: FontWeight.w700),maxLines: 1,overflow: TextOverflow.ellipsis,),
            ),

          ],
        ),
      ),
    );
  }

}
