import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/add_praise/screens/add_praise_screen.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_raised_button.dart';
import 'package:prayer_hybrid_app/widgets/custom_text_form_field.dart';
import 'package:prayer_hybrid_app/prayer_praise_info/screens/finish_praying_screen.dart';

class PrayersListScreen extends StatefulWidget {
  @override
  _PrayersListScreenState createState() => _PrayersListScreenState();
}

class _PrayersListScreenState extends State<PrayersListScreen> {
  TextEditingController _searchController = TextEditingController();
  int selectIndex = 0;
  List<String> prayerList = ["Test","Marriage","Car","Medical Emergency","Loan"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.0,),
        _searchTextFormField(),
         SizedBox(height: 10.0,),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder
                  (
                    itemCount: prayerList.length,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext ctxt, int index) {
                      return _prayersList(index);
                    }
                ),
                SizedBox(height: 20.0,),

                _addNewPraiseButtonWidget(),
                SizedBox(height: 15.0,),
              ],
            ),
          ),
        ),



      ],
    );
  }

  Widget _searchTextFormField()
  {
    return CustomTextFormField(
      textController: _searchController,
      containerWidth: MediaQuery.of(context).size.width*0.85,
      hintText: AppStrings.SEARCH_HINT_TEXT,
      borderRadius: 28.0,
      contentPaddingTop: 13.0,
      contentPaddingBottom: 13.0,
      contentPaddingRight: 8.0,
      contentPaddingLeft: 20.0,
      suffixIcon: AssetPaths.SEARCH_ICON,
      suffixIconWidth: 15,
      hintSize: 15.0,
      textSize: 15.0,
      isCollapsed: true,
    );
  }
  
  Widget _prayersList(int prayerIndex)
  {
    return GestureDetector(
      onTap: (){
        print("next screen");
        AppNavigation.navigateTo(context, FinishPrayingScreen());
      },
      onLongPress: (){
        setState(() {
          selectIndex = prayerIndex;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.85,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.075,right: MediaQuery.of(context).size.width*0.075,top: 7.0,bottom: 7.0),
        padding: EdgeInsets.only(top: 13.0,bottom: 13.0,left: 20.0,right: selectIndex == prayerIndex ? 6.0 : 20.0),
        decoration: BoxDecoration(
          color: selectIndex == prayerIndex ? AppColors.BUTTON_COLOR : AppColors.WHITE_COLOR,
          borderRadius: BorderRadius.circular(23.0),
            boxShadow: selectIndex == prayerIndex ?
            [
              BoxShadow(
                color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]
                :
                []
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(prayerList[prayerIndex],style: TextStyle(fontSize: 14.5,color: selectIndex == prayerIndex ? AppColors.WHITE_COLOR : AppColors.BLACK_COLOR,fontWeight: FontWeight.w700),maxLines: 1,overflow: TextOverflow.ellipsis,),
            ),

            _arrowDeleteIcons(prayerIndex),

          ],
        ),
      ),
    );
  }

  Widget _arrowDeleteIcons(int prayerIndex)
  {
    return selectIndex == prayerIndex ?
    Row(
      children: [
        GestureDetector(
          onTap: (){
            print("arrow");
          },
          child: Container(
            color: AppColors.TRANSPARENT_COLOR,
            child: Padding(
                padding: EdgeInsets.only(left: 3.0,right: 7.5),
                child: Image.asset(AssetPaths.ARROW_ICON,width: 15.0,)
            ),
          ),
        ),

        GestureDetector(
          onTap: (){
            print("delete");
          },
          child: Container(
            color: AppColors.TRANSPARENT_COLOR,
            child: Padding(
                padding: EdgeInsets.only(left: 7.5,right: 13.0),
                child: Image.asset(AssetPaths.DELETE_ICON,width: 12.0,)
            ),
          ),
        ),
      ],
    )
        :
    Container();
  }


  //Add New Praise Button Widget
  Widget _addNewPraiseButtonWidget()
  {
    return CustomRaisedButton(
      containerWidth: MediaQuery.of(context).size.width*0.65,
      containerHeight: MediaQuery.of(context).size.height*0.065,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: 7.0,
      buttonText: AppStrings.ADD_NEW_PRAISE_TEXT.toUpperCase(),
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.15,
      onPressed: (){
        AppNavigation.navigateReplacement(context, AddPraiseScreen(praiseButtonText: AppStrings.ADD_PRAISE_TEXT.toUpperCase()));
      },
    );
  }


}
