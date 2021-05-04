import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prayer_hybrid_app/prayer_partner/screens/contact_list_screen.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_raised_button.dart';
import 'package:prayer_hybrid_app/widgets/custom_text_form_field.dart';
import 'package:prayer_hybrid_app/prayer_partner/screens/prayer_partner_list_screen.dart';
import 'package:prayer_hybrid_app/utils/app_dialogs.dart';

class AddPrayerPartnerScreen extends StatefulWidget {
  @override
  _AddPrayerPartnerScreenState createState() => _AddPrayerPartnerScreenState();
}

class _AddPrayerPartnerScreenState extends State<AddPrayerPartnerScreen> {
  TextEditingController _addNameController = TextEditingController();
  TextEditingController _addMobileNoController = TextEditingController();
  bool errorBoolName = true,errorBoolMobile = true;
  String errorName = "",errorMobile ="";
  Map<String,dynamic> contactInfo = Map<String,dynamic>();
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Scaffold(
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        body: Column(
          children: [
            _customAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 18.0,),
                    Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.075,right: MediaQuery.of(context).size.width*0.075),
                        child: Text(AppStrings.ADD_NAME_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600),textScaleFactor: 1.18,)
                    ),
                    SizedBox(height: 10.0,),
                    Align(
                        alignment: Alignment.center,
                        child: _addNameTextFormField()
                    ),

                    _errorWidget(errorBoolName,errorName),

                    SizedBox(height: 18.0,),

                    Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.075,right: MediaQuery.of(context).size.width*0.075),
                        child: Text(AppStrings.ADD_MOBILE_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600),textScaleFactor: 1.18,)
                    ),
                    SizedBox(height: 10.0,),

                    Align(
                        alignment: Alignment.center,
                        child: _addMobileNoTextFormField()
                    ),

                    _errorWidget(errorBoolMobile,errorMobile),

                    SizedBox(height: MediaQuery.of(context).size.height*0.06,),

                    Align(
                      alignment: Alignment.center,
                        child: _addPrayerPartnerWidget()
                    ),

                    SizedBox(height: 22.0,),

                    Align(
                        alignment: Alignment.center,
                        child: _searchContactButtonWidget()
                    ),

                    SizedBox(height: 15.0,),


                  ],
                ),
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
      title: AppStrings.PRAYER_PARTNER_TEXT,
      leadingIconPath: AssetPaths.BACK_ICON,
      leadingTap: (){
        AppNavigation.navigatorPop(context);
      },
    );
  }

  //Group Title Text Form Field
  Widget _addNameTextFormField()
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
        textController: _addNameController,
        containerWidth: MediaQuery.of(context).size.width*0.85,
        hintText: AppStrings.ADD_NAME_TEXT,
        borderRadius: 28.0,
        contentPaddingTop: 13.0,
        contentPaddingBottom: 13.0,
        contentPaddingRight: 20.0,
        contentPaddingLeft: 20.0,
        hintSize: 15.0,
        textSize: 15.0,
        isCollapsed: true,
        borderColor: errorBoolName == true ? AppColors.TRANSPARENT_COLOR : AppColors.ERROR_COLOR,
        filledColor: AppColors.BUTTON_COLOR,
      ),
    );
  }


  //Add Mobile No Text Form Field
  Widget _addMobileNoTextFormField()
  {
    return CustomTextFormField(
      textController: _addMobileNoController,
      containerWidth: MediaQuery.of(context).size.width*0.85,
      hintText: AppStrings.ADD_MOBILE_NO_HINT_TEXT,
      borderRadius: 28.0,
      contentPaddingTop: 13.0,
      contentPaddingBottom: 13.0,
      contentPaddingRight: 20.0,
      contentPaddingLeft: 20.0,
      hintSize: 15.0,
      textSize: 15.0,
      isCollapsed: true,
      borderColor: errorBoolMobile == true ? AppColors.TRANSPARENT_COLOR : AppColors.ERROR_COLOR,
      filledColor: AppColors.WHITE_COLOR,
      hintColor: AppColors.BLACK_COLOR,
      textColor: AppColors.BLACK_COLOR,
      cursorColor: AppColors.BLACK_COLOR,
      keyBoardType: TextInputType.phone,
    );
  }


  //Error Widget
  Widget _errorWidget(bool errorBool,String errorMessage)
  {
    return errorBool == true ?
    Container()
        :
    Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.075,top: 10.0),
        child: Text(errorMessage.toString(),style: TextStyle(fontSize: 13.0, color:  AppColors.ERROR_COLOR, fontWeight: FontWeight.w600,),)
    );
  }



  //Create Group Button Widget
  Widget _addPrayerPartnerWidget()
  {
    return CustomRaisedButton(
      containerWidth: MediaQuery.of(context).size.width*0.75,
      containerHeight: MediaQuery.of(context).size.height*0.072,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: 7.0,
      buttonText: AppStrings.ADD_PRAYER_PARTNER_TEXT.toUpperCase(),
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.2,
      onPressed: () {
        _addPrayerPartnerMethod();
      }
    );
  }


  //Create Search Contact Button Widget
  Widget _searchContactButtonWidget()
  {
    return CustomRaisedButton(
      containerWidth: MediaQuery.of(context).size.width*0.75,
      containerHeight: MediaQuery.of(context).size.height*0.072,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: 7.0,
      buttonText: AppStrings.SEARCH_CONTACT_LIST_TEXT.toUpperCase(),
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.2,
      onPressed: (){
        _askPermissions();
      },
    );
  }


  void _addPrayerPartnerMethod()
    {
      if(_addNameController.text.trim().isEmpty)
        {
          errorName = AppStrings.ADD_NAME_EMPTY_ERROR;
          errorBoolName = false;
        }

      else
        {
          errorName = "";
          errorBoolName = true;
        }

      if(_addMobileNoController.text.trim().isEmpty)
        {
          errorMobile = AppStrings.MOBILE_NO_EMPTY_ERROR;
          errorBoolMobile = false;
        }
      else
        {
          errorMobile = "";
          errorBoolMobile = true;
        }

      if(errorBoolName && errorBoolMobile)
        {
          print("next");
          AppNavigation.navigateTo(context, PrayerPartnerListScreen());
          // _addNameController.text = "";
          // _addMobileNoController.text = "";
        }

      setState(() {

      });

    }


  Future<void> _askPermissions() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      getContactInfo();
    } else {
      _handleInvalidPermissions(permissionStatus);
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    print("PErmission"+permission.toString());
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      AppDialogs.showToast(message:AppStrings.CONTACT_DENIED_ERROR);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      AppDialogs.showToast(message:AppStrings.CONTACT_PERMANENTLY_DENIED_ERROR);
      //ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void getContactInfo() async
  {
    contactInfo = await AppNavigation.navigateToUpdate(context, ContactListScreen());
    _addNameController.text = contactInfo["name"].toString();
    _addMobileNoController.text = contactInfo["phone no"].toString();
    //print(contactInfo.toString());
  }




}
