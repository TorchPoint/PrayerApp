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
import 'package:textfield_search/textfield_search.dart';


class CreatePrayerGroupScreen extends StatefulWidget {
  @override
  _CreatePrayerGroupScreenState createState() => _CreatePrayerGroupScreenState();
}

class _CreatePrayerGroupScreenState extends State<CreatePrayerGroupScreen> {
  TextEditingController _groupTitleController = TextEditingController();
  TextEditingController _searchMemberController = TextEditingController();
  final membersList = [
    'John',
    'Mathews',
    'Brain',
    'Tom',
    'Terry'
  ];
  List<String> groupMemberList = ["Victoria","Mildred","Andy"];
  bool groupTitleBool = true;
  bool groupMemberBool = true;
  String currentMember = "";
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

                   Padding(
                       padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.075,right: MediaQuery.of(context).size.width*0.075),
                       child: Text(AppStrings.SEARCH_GROUP_MEMBERS_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600),textScaleFactor: 1.18,)
                   ),
                   SizedBox(height: 10.0,),

                   Align(
                       alignment: Alignment.center,
                       child: _searchMembersTextFormField()),

                   _errorMemberWidget(),

                   SizedBox(height: 18.0,),

                   Align(
                     alignment: Alignment.center,
                       child: _addMemberWidget()
                   ),

                   SizedBox(height: 10.0,),

                   _groupMembersListTextWidget(),

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
      borderColor: groupTitleBool == true ? AppColors.TRANSPARENT_COLOR : AppColors.ERROR_COLOR,
      filledColor: AppColors.WHITE_COLOR,
      hintColor: AppColors.BLACK_COLOR,
      textColor: AppColors.BLACK_COLOR,
      cursorColor: AppColors.BLACK_COLOR,
    );
  }


  //Search Members Text Form Field
  Widget _searchMembersTextFormField()
  {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.075,right: MediaQuery.of(context).size.width*0.075),
      child: TextFieldSearch(
          initialList: membersList,
          label: "",
          controller: _searchMemberController,
          decoration: InputDecoration(
            isCollapsed: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28.0),
                borderSide: BorderSide(color:groupMemberBool == true ? AppColors.TRANSPARENT_COLOR : AppColors.ERROR_COLOR)
            ),

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28.0),
                borderSide: BorderSide(color: groupMemberBool == true ? AppColors.TRANSPARENT_COLOR : AppColors.ERROR_COLOR)
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28.0),
              //borderSide: BorderSide(color: AppColors.WHITE_COLOR)
            ),

            hintText: AppStrings.SEARCH_MEMBERS_HINT_TEXT,
            hintStyle: TextStyle(
              fontSize: 15,
              color: AppColors.BLACK_COLOR,
              fontWeight: FontWeight.w400,

            ),
            contentPadding: EdgeInsets.only(top: 13.0,bottom: 13.0,left: 20.0,right: 20.0),
            fillColor: AppColors.WHITE_COLOR,
            filled: true,
          ),
        textStyle: TextStyle(
          fontSize:15.5,
          color: AppColors.BLACK_COLOR,
          fontWeight: FontWeight.w600,
        ),
      )
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

  //Error Member Widget
  Widget _errorMemberWidget()
  {
    return groupMemberBool == true ?
    Container()
        :
    Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.075,top: 10.0),
        child: Text(AppStrings.SEARCH_MEMBER_EMPTY_ERROR,style: TextStyle(fontSize: 13.0, color:  AppColors.ERROR_COLOR, fontWeight: FontWeight.w600,),)
    );
  }



  Widget _addMemberWidget()
  {
    return CustomRaisedButton(
      containerWidth: MediaQuery.of(context).size.width*0.52,
      containerHeight: MediaQuery.of(context).size.height*0.06,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: 7.0,
      buttonText: AppStrings.ADD_MEMBER_TEXT,
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.25,
      onPressed: (){
        if(_searchMemberController.text.trim().isEmpty)
        {
          setState(() {
            groupMemberBool = false;
          });
        }
        else{
          setState(() {
            groupMemberBool = true;
          });
          //AppNavigation.navigateTo(context,PrayerGroupListScreen());
        }
      },
    );
  }



//Group Members Row Add Widget
  Widget _groupMembersListTextWidget()
  {
    return Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.075,right: MediaQuery.of(context).size.width*0.075),
        child:Text(AppStrings.GROUP_MEMBERS_LIST_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600),textScaleFactor: 1.18,),
    );

  }


 //Add Group Members List
  Widget _groupMembersListWidget(int groupMemberIndex)
  {
    return GestureDetector(
      onTap: (){
       print("group members");
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



  // //Add group member alert Work Start
  // void _addGroupMemberAlert()
  // {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Dialog(
  //           insetPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.09,right: MediaQuery.of(context).size.width*0.09),
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(10.0)
  //           ),
  //           child:Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               SizedBox(height: MediaQuery.of(context).size.height*0.05,),
  //               Padding(
  //                 padding: EdgeInsets.only(left: 15.0,right: 15.0),
  //                   child: _addMembersTextFormField()
  //               ),
  //
  //               SizedBox(height: MediaQuery.of(context).size.height*0.05,),
  //               _addMemberButtonWidget(),
  //               SizedBox(height: MediaQuery.of(context).size.height*0.05,),
  //
  //             ],
  //           )
  //
  //
  //         );
  //       }
  //   );
  // }
  //
  //
  // //Add Group Memebers Text Form Field End
  // Widget _addMembersTextFormField()
  // {
  //   return Container(
  //     width: MediaQuery.of(context).size.width*0.85,
  //     decoration: BoxDecoration(
  //       color: AppColors.BUTTON_COLOR,
  //       borderRadius: BorderRadius.circular(28.0),
  //       boxShadow: [
  //         BoxShadow(
  //           color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.2),
  //           blurRadius: 6,
  //           offset: Offset(0, 5), // Shadow position
  //         ),
  //       ],
  //     ),
  //     child: CustomTextFormField(
  //       textController: _addMemberController,
  //       containerWidth: MediaQuery.of(context).size.width*0.6,
  //       hintText: AppStrings.GROUP_MEMBER_HINT_TEXT,
  //       borderRadius: 10.0,
  //       contentPaddingTop: 13.0,
  //       contentPaddingBottom: 13.0,
  //       contentPaddingRight: 20.0,
  //       contentPaddingLeft: 20.0,
  //       hintSize: 15.0,
  //       textSize: 15.0,
  //       isCollapsed: true,
  //       borderColor: AppColors.TRANSPARENT_COLOR,
  //       filledColor: AppColors.BUTTON_COLOR,
  //     ),
  //   );
  // }
  //
  //
  // //Add Group Member Button Widget
  // Widget _addMemberButtonWidget()
  // {
  //   return CustomRaisedButton(
  //     containerWidth: MediaQuery.of(context).size.width*0.5,
  //     containerHeight: MediaQuery.of(context).size.height*0.065,
  //     buttonColor: AppColors.WHITE_COLOR,
  //     borderColor: AppColors.BUTTON_COLOR,
  //     elevation: 0.0,
  //     buttonText: AppStrings.ADD_MEMBER_TEXT,
  //     textColor: AppColors.BUTTON_COLOR,
  //     fontWeight: FontWeight.w700,
  //     fontSize: 1.25,
  //     onPressed: (){
  //       AppNavigation.navigatorPop(context);
  //     },
  //   );
  // }






  @override
  void dispose() {
    super.dispose();
    _groupTitleController.dispose();
    _searchMemberController.dispose();
  }




}
