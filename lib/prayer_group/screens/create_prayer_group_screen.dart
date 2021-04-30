import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/prayer_group/screens/prayer_group_list_screen.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/widgets/custom_raised_button.dart';
import 'package:prayer_hybrid_app/widgets/custom_text_form_field.dart';


class CreatePrayerGroupScreen extends StatefulWidget {
  @override
  _CreatePrayerGroupScreenState createState() => _CreatePrayerGroupScreenState();
}

class _CreatePrayerGroupScreenState extends State<CreatePrayerGroupScreen> {
  TextEditingController _groupTitleController = TextEditingController();
  List<String> groupMemberList = ["Victoria","Mildred","Andy"];
  bool groupTitleBool = true;

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Scaffold(
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _customAppBar(),
             Expanded(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                 SizedBox(height: 18.0,),
                 Padding(
                     padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.075,right: MediaQuery.of(context).size.width*0.075),
                     child: Text(AppStrings.GROUP_TITLE_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600),textScaleFactor: 1.18,)
                 ),
                 SizedBox(height: 10.0,),
                 Align(
                   alignment: Alignment.center,
                     child: _groupTitleTextFormField()),

                   _errorGroupTitleWidget(),

                   SizedBox(height: 18.0,),

                   _groupMembersRowAddWidget(),

                   Expanded(
                     child: SingleChildScrollView(
                       child: Column(
                         children: [
                           ListView.builder
                             (
                               padding: EdgeInsets.zero,
                               itemCount: groupMemberList.length,
                               shrinkWrap: true,
                               physics: NeverScrollableScrollPhysics(),
                               itemBuilder: (BuildContext ctxt, int index) {
                                 return _groupMembersListWidget(index);
                               }
                           ),

                           Align(
                               alignment: Alignment.center,
                               child: _createGroupWidget()
                           ),

                           SizedBox(height: 10.0,)

                         ],
                       ),
                     ),
                   ),


               ],
               ),
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
      title: AppStrings.PRAYER_GROUPS_TEXT,
      leadingIconPath: AssetPaths.BACK_ICON,
      leadingTap: (){
        AppNavigation.navigatorPop(context);
      },
      trailingIconPath: AssetPaths.SETTING_ICON,
      trailingTap: (){
        print("Prayer Group Icon");
      },
    );
  }

  //Group Title Text Form Field
  Widget _groupTitleTextFormField()
  {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      decoration: BoxDecoration(
        color: AppColors.BUTTON_COLOR,
        borderRadius: BorderRadius.circular(28.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 5), // Shadow position
          ),
        ],
      ),
      child: CustomTextFormField(
        textController: _groupTitleController,
        containerWidth: MediaQuery.of(context).size.width*0.85,
        hintText: AppStrings.GROUP_TITLE_HINT_TEXT,
        borderRadius: 28.0,
        contentPaddingTop: 13.0,
        contentPaddingBottom: 13.0,
        contentPaddingRight: 20.0,
        contentPaddingLeft: 20.0,
        hintSize: 15.0,
        textSize: 15.0,
        isCollapsed: true,
        borderColor: groupTitleBool == true ? AppColors.TRANSPARENT_COLOR : AppColors.ERROR_COLOR,
        filledColor: AppColors.BUTTON_COLOR,
      ),
    );
  }


  //Error Group Title Widget
  Widget _errorGroupTitleWidget()
  {
    return groupTitleBool == true ?
    Container()
        :
    Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.075,top: 10.0),
        child: Text(AppStrings.GROUP_TITLE_EMPTY_ERROR,style: TextStyle(fontSize: 13.0, color:  AppColors.ERROR_COLOR, fontWeight: FontWeight.w600,),)
    );
  }


//Group Members Row Add Widget
  Widget _groupMembersRowAddWidget()
  {
    return Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.075,right: MediaQuery.of(context).size.width*0.075),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.GROUP_MEMBERS_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600),textScaleFactor: 1.18,),
            IconButton(
                constraints: BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: Icon(Icons.add),
                color: AppColors.WHITE_COLOR,
                onPressed: (){
                  print("add");
                  _addGroupMemberAlert();
                }),
          ],
        )
    );

  }


 //Add Group Members List
  Widget _groupMembersListWidget(int groupMemberIndex)
  {
    return GestureDetector(
      onTap: (){
       print("group memebers");
        //AppNavigation.navigateTo(context, BibleChapterDetailsScreen());
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.85,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.075,right: MediaQuery.of(context).size.width*0.075,top: 8.0,bottom:groupMemberList.length -1 == groupMemberIndex ? 16.0 :8.0),
        padding: EdgeInsets.only(top: 13.0,bottom: 13.0,left: 20.0,right: 20.0),
        decoration: BoxDecoration(
          color: AppColors.WHITE_COLOR,
          borderRadius: BorderRadius.circular(23.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(groupMemberList[groupMemberIndex],style: TextStyle(fontSize: 14.5,color: AppColors.BLACK_COLOR,fontWeight: FontWeight.w700),maxLines: 1,overflow: TextOverflow.ellipsis,),
            ),

          ],
        ),
      ),
    );
  }


  //Create Group Button Widget
  Widget _createGroupWidget()
  {
    return CustomRaisedButton(
      containerWidth: MediaQuery.of(context).size.width*0.75,
      containerHeight: MediaQuery.of(context).size.height*0.072,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: 7.0,
      buttonText: AppStrings.CREATE_GROUP_TEXT.toUpperCase(),
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.25,
      onPressed: (){
        if(_groupTitleController.text.trim().isEmpty)
          {
            setState(() {
              groupTitleBool = false;
            });
          }
        else{
          setState(() {
            groupTitleBool = true;
          });
          AppNavigation.navigateTo(context,PrayerGroupListScreen());
        }
      },
    );
  }



  //Add group member alert
  void _addGroupMemberAlert()
  {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.09,right: MediaQuery.of(context).size.width*0.09),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            child:Container(
              height: MediaQuery.of(context).size.height*0.5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _groupMemberTextFormField()






                ],
              ),
            )


          );
        }
    );
  }


  //Group Member Text Form Field
  Widget _groupMemberTextFormField()
  {
    return CustomTextFormField(
      textController: _groupTitleController,
      containerWidth: MediaQuery.of(context).size.width*0.85,
      hintText: AppStrings.GROUP_TITLE_HINT_TEXT,
      borderRadius: 28.0,
      contentPaddingTop: 13.0,
      contentPaddingBottom: 13.0,
      contentPaddingRight: 20.0,
      contentPaddingLeft: 20.0,
      hintSize: 15.0,
      textSize: 15.0,
      isCollapsed: true,
    );
  }







}
