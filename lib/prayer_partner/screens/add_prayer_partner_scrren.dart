import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contact/contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_raised_button.dart';
import 'package:prayer_hybrid_app/widgets/custom_text_form_field.dart';
import 'package:prayer_hybrid_app/prayer_partner/screens/prayer_partner_list_screen.dart';

class AddPrayerPartnerScreen extends StatefulWidget {
  @override
  _AddPrayerPartnerScreenState createState() => _AddPrayerPartnerScreenState();
}

class _AddPrayerPartnerScreenState extends State<AddPrayerPartnerScreen> {
  TextEditingController _addNameController = TextEditingController();
  TextEditingController _addMobileNoController = TextEditingController();
  bool errorBoolName = true,errorBoolMobile = true;
  String errorName = "",errorMobile ="";
  bool _hasPermission;
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
        //   if(_groupTitleController.text.trim().isEmpty)
        //   {
        //     setState(() {
        //       groupTitleBool = false;
        //     });
        //   }
        //   else{
        //     setState(() {
        //       groupTitleBool = true;
        //     });
        //     AppNavigation.navigateTo(context,PrayerGroupListScreen());
        //   }
        //_askPermissions();
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


//     void contactList() async{
//       // Get all contacts without thumbnail(faster)
//
//       final contacts = Contacts.listContacts();
//       final total = await contacts.length;
//       print(total.toString());
//
// // This will fetch the page this contact belongs to, and return the contact
//       final contact = await contacts.get(total - 1);
//
//       while(await contacts.moveNext()) {
//         final contact = await contacts.current;
//         print(contact.displayName);
//         print(contact.phones.toString());
//       }
//     }
//
//
//   Future<void> _askPermissions() async {
//     PermissionStatus permissionStatus;
//     while (permissionStatus != PermissionStatus.granted) {
//       try {
//         permissionStatus = await _getContactPermission();
//         if (permissionStatus != PermissionStatus.granted) {
//           _hasPermission = false;
//           _handleInvalidPermissions(permissionStatus);
//         } else {
//           _hasPermission = true;
//         }
//       } catch (e) {
//         if (await showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Text('Contact Permissions'),
//                 content: Text(
//                     'We are having problems retrieving permissions.  Would you like to '
//                         'open the app settings to fix?'),
//                 actions: [
//                   Text('Close')
//                 ],
//               );
//             }) ==
//             true) {
//           await openAppSettings();
//         }
//       }
//     }
//
//     contactList();
//   }
//
//   Future<PermissionStatus> _getContactPermission() async {
//     final status = await Permission.contacts.status;
//     if (!status.isGranted) {
//       final result = await Permission.contacts.request();
//       return result;
//     } else {
//       return status;
//     }
//   }
//
//   void _handleInvalidPermissions(PermissionStatus permissionStatus) {
//     if (permissionStatus == PermissionStatus.denied) {
//       throw PlatformException(
//           code: 'PERMISSION_DENIED',
//           message: 'Access to location data denied',
//           details: null);
//     } else if (permissionStatus == PermissionStatus.restricted) {
//       throw PlatformException(
//           code: 'PERMISSION_DISABLED',
//           message: 'Location data is not available on device',
//           details: null);
//     }
//   }


}
