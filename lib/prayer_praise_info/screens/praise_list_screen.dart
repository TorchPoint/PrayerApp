import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/add_prayer/screens/add_prayer_screen.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_raised_button.dart';
import 'package:prayer_hybrid_app/widgets/custom_text_form_field.dart';
import 'package:prayer_hybrid_app/prayer_praise_info/screens/finish_praise_screen.dart';

class PraiseListScreen extends StatefulWidget {
  @override
  _PraiseListScreenState createState() => _PraiseListScreenState();
}

class _PraiseListScreenState extends State<PraiseListScreen> {
  TextEditingController _searchController = TextEditingController();
  int selectIndex = 0;
  List<String> prayerList = ["Test","Marriage","Car","Medical Emergency","Loan","Mom","Test","Marriage","Car","Medical Emergency","Loan","Mom"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.0,),
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
                      return _praiseList(index);
                    }
                ),
                SizedBox(height: 20.0,),

                _addNewPrayerButtonWidget(),
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

  Widget _praiseList(int praiseIndex)
  {
    return GestureDetector(
      onTap: (){
        print("next screen");
        AppNavigation.navigateTo(context, FinishPraiseScreen());
      },
      onLongPress: (){
        setState(() {
          selectIndex = praiseIndex;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.85,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.075,right: MediaQuery.of(context).size.width*0.075,top: 7.0,bottom: 7.0),
        padding: EdgeInsets.only(top: 13.0,bottom: 13.0,left: 20.0,right: selectIndex == praiseIndex ? 6.0 : 20.0),
        decoration: BoxDecoration(
            color: selectIndex == praiseIndex ? AppColors.BUTTON_COLOR : AppColors.WHITE_COLOR,
            borderRadius: BorderRadius.circular(23.0),
            boxShadow: selectIndex == praiseIndex ?
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
              child: Text(prayerList[praiseIndex].toString(),style: TextStyle(fontSize: 14.5,color: selectIndex == praiseIndex ? AppColors.WHITE_COLOR : AppColors.BLACK_COLOR,fontWeight: FontWeight.w700),maxLines: 1,overflow: TextOverflow.ellipsis,),
            ),

            _arrowDeleteIcons(praiseIndex),

          ],
        ),
      ),
    );
  }

  Widget _arrowDeleteIcons(int praiseIndex)
  {
    return selectIndex == praiseIndex ?
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


  //Add New Prayer Button Widget
  Widget _addNewPrayerButtonWidget()
  {
    return CustomRaisedButton(
      containerWidth: MediaQuery.of(context).size.width*0.75,
      containerHeight: MediaQuery.of(context).size.height*0.072,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: 7.0,
      buttonText: AppStrings.ADD_NEW_PRAYER_TEXT.toUpperCase(),
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.15,
      onPressed: (){
        AppNavigation.navigateReplacement(context, AddPrayerScreen(prayerButtonText: AppStrings.ADD_PRAYER_TEXT.toUpperCase()));
      },
    );
  }


}
