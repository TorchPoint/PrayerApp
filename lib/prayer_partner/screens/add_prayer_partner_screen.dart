import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prayer_hybrid_app/prayer_partner/screens/contact_list_screen.dart';
import 'package:prayer_hybrid_app/services/base_service.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_button.dart';
import 'package:prayer_hybrid_app/widgets/custom_text_form_field.dart';
import 'package:prayer_hybrid_app/utils/app_dialogs.dart';

class AddPrayerPartnerScreen extends StatefulWidget {
  @override
  _AddPrayerPartnerScreenState createState() => _AddPrayerPartnerScreenState();
}

class _AddPrayerPartnerScreenState extends State<AddPrayerPartnerScreen> {
  TextEditingController _addNameController = TextEditingController();
  TextEditingController _addMobileNoController = TextEditingController();
  bool errorBoolName = true, errorBoolMobile = true, contact = false;
  String errorName = "", errorMobile = "";
  Map<String, dynamic> contactInfo = Map<String, dynamic>();
  final GlobalKey<FormState> _addPrayerPartnerKey = GlobalKey<FormState>();
  BaseService baseService = BaseService();

  void showPicker() {
    showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
        flagSize: 25,
        backgroundColor: AppColors.BACKGROUND2_COLOR,
        textStyle: TextStyle(fontSize: 16, color: AppColors.WHITE_COLOR),
        //Optional. Sets the border radius for the bottomsheet.
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        //Optional. Styles the search field.
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          labelStyle: TextStyle(color: AppColors.WHITE_COLOR),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
          ),
        ),
      ),
      onSelect: (Country country) =>
          print('Select country: ${country.displayName}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Scaffold(
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        body: Column(
          children: [
            _customAppBar(),
            SizedBox(
              height: 6.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _addPrayerPartnerKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 23.0,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: _addNameTextFormField()),
                      SizedBox(
                        height: 23.0,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: _addMobileNoTextFormField()),
                      SizedBox(height: 23.0),
                      Align(
                          alignment: Alignment.center,
                          child: _addPrayerPartnerWidget()),
                      SizedBox(
                        height: 20.0,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: _searchContactButtonWidget()),
                      SizedBox(
                        height: 20.0,
                      ),
                      contact == true
                          ? Align(
                              alignment: Alignment.center,
                              child: _searchContactButtonWidget())
                          : Container(),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Custom App Bar Widget
  Widget _customAppBar() {
    return CustomAppBar(
      title: AppStrings.PRAYER_PARTNER_TEXT,
      leadingIconPath: AssetPaths.BACK_ICON,
      paddingTop: 20.0,
      leadingTap: () {
        AppNavigation.navigatorPop(context);
      },
    );
  }

  //Group Title Text Form Field
  Widget _addNameTextFormField() {
    return CustomTextFormField(
      textController: _addNameController,
      containerWidth: MediaQuery.of(context).size.width * 0.85,
      hintText: AppStrings.ADD_NAME_TEXT,
      borderRadius: 28.0,
      contentPaddingTop: 17.5,
      contentPaddingBottom: 17.5,
      contentPaddingRight: 20.0,
      contentPaddingLeft: 20.0,
      hintSize: 15.0,
      textSize: 15.0,
      isCollapsed: true,
      hintColor: AppColors.WHITE_COLOR,
      textColor: AppColors.WHITE_COLOR,
      cursorColor: AppColors.WHITE_COLOR,
      onValidate: (value) {
        if (value.trim().isEmpty) {
          return AppStrings.ADD_NAME_EMPTY_ERROR;
        }
        return null;
      },
    );
  }

  //Add Mobile No Text Form Field
  Widget _addMobileNoTextFormField() {
    return CustomTextFormField(
      textController: _addMobileNoController,
      containerWidth: MediaQuery.of(context).size.width * 0.85,
      hintText: AppStrings.ADD_MOBILE_NO_HINT_TEXT,
      borderRadius: 28.0,
      contentPaddingTop: 17.5,
      contentPaddingBottom: 17.5,
      contentPaddingRight: 20.0,
      contentPaddingLeft: 20.0,
      hintSize: 15.0,
      textSize: 15.0,
      isCollapsed: true,
      //borderColor: errorBoolMobile == true ? AppColors.TRANSPARENT_COLOR : AppColors.ERROR_COLOR,
      filledColor: AppColors.TRANSPARENT_COLOR,
      hintColor: AppColors.WHITE_COLOR,
      textColor: AppColors.WHITE_COLOR,
      cursorColor: AppColors.WHITE_COLOR,
      keyBoardType: TextInputType.phone,
      // onTextFieldTap: showPicker,
      // textFieldReadOnly: true,
      onValidate: (value) {
        if (value.trim().isEmpty) {
          return AppStrings.MOBILE_NO_EMPTY_ERROR;
        }
        return null;
      },
    );
  }

  //Create Group Button Widget
  Widget _addPrayerPartnerWidget() {
    return CustomButton(
        containerWidth: MediaQuery.of(context).size.width * 0.75,
        buttonColor: AppColors.BUTTON_COLOR,
        borderColor: AppColors.BUTTON_COLOR,
        elevation: true,
        buttonText: AppStrings.ADD_PRAYER_PARTNER_TEXT.toUpperCase(),
        textColor: AppColors.WHITE_COLOR,
        fontWeight: FontWeight.w700,
        paddingTop: 13.5,
        paddingBottom: 13.5,
        fontSize: 1.2,
        onTap: () {
          _addPrayerPartnerMethod();
        });
  }

  //Create Search Contact Button Widget
  Widget _searchContactButtonWidget() {
    return CustomButton(
      containerWidth: MediaQuery.of(context).size.width * 0.75,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: true,
      buttonText: AppStrings.SEARCH_CONTACT_LIST_TEXT.toUpperCase(),
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.2,
      paddingTop: 13.5,
      paddingBottom: 13.5,
      onTap: () {
        _askPermissions();
      },
    );
  }

  void _addPrayerPartnerMethod() async{
    if (_addPrayerPartnerKey.currentState.validate()) {
      await baseService
          .addPrayerPartners(
        context,
        _addMobileNoController.text,
        _addNameController.text,
      )
          .then((value) {
        print("***" + value.toString());
      });
    }
  }

  Future<void> _askPermissions() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      getContactInfo();
    } else {
      getContactInfo();
      //_handleInvalidPermissions(permissionStatus);
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    print("PErmission" + permission.toString());
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
      AppDialogs.showToast(message: AppStrings.CONTACT_DENIED_ERROR);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      AppDialogs.showToast(
          message: AppStrings.CONTACT_PERMANENTLY_DENIED_ERROR);
      //ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void getContactInfo() async {
    contactInfo =
        await AppNavigation.navigateToUpdate(context, ContactListScreen());
    if (contactInfo != null) {
      _addNameController.text = contactInfo["name"].toString();
      _addMobileNoController.text = contactInfo["phone no"].toString();
    }
    //print(contactInfo.toString());
  }
}
