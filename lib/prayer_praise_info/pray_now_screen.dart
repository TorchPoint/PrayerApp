import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';

class PrayNowScreen extends StatefulWidget {
  @override
  _PrayNowScreenState createState() => _PrayNowScreenState();
}

class _PrayNowScreenState extends State<PrayNowScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Scaffold(
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
                child: Text(AppStrings.PENDING_PRAYERS_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600,letterSpacing: 0.6),textScaleFactor: 1.45,textAlign:TextAlign.center,)
            ),
            SizedBox(height: 1.0,),
            Align(
                alignment: Alignment.center,
                child: Text(AppStrings.START_PRAYING_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600,letterSpacing: 0.6),textScaleFactor: 1.45,textAlign:TextAlign.center,)
            ),
            SizedBox(height: 25.0,),
            _prayNowContainerWidget(),
          ],
        ),
      ),
    );
  }

//Pray Now Container Widget
  Widget _prayNowContainerWidget()
  {
    return GestureDetector(
      onTap: (){
           print("Pray Now");
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.36,
        height: MediaQuery.of(context).size.height*0.20,
        decoration: BoxDecoration(
            color: AppColors.WHITE_COLOR,
            borderRadius: BorderRadius.circular(8.0)
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.36,
              height: MediaQuery.of(context).size.height*0.10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.11,
                    height: MediaQuery.of(context).size.height*0.06,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AssetPaths.PRAY_NOW_SECOND_IMAGE),
                            fit: BoxFit.contain
                        )
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 2.0,right: 2.0),
                  child: Text(AppStrings.PRAY_NOW_TEXT,style:TextStyle(color: AppColors.BLACK_COLOR,fontWeight: FontWeight.w700),textScaleFactor:1.35,overflow: TextOverflow.ellipsis,maxLines: 3,)
              ),
            )

          ],
        ),
      ),
    );
  }


}
