import 'dart:io';
import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/common_classes/image_gallery_class.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/constants.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/widgets/custom_button.dart';
import 'package:prayer_hybrid_app/widgets/custom_text_form_field.dart';

class CompleteProfileScreen extends StatefulWidget {
  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final GlobalKey<FormState> _completeProfileKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileNoController = TextEditingController();
  String emailPattern = Constants.EMAIL_VALIDATION_REGEX;
  RegExp emailRegExp;
  String passwordPattern = Constants.PASSWORD_VALIDATE_REGEX;
  RegExp passwordRegExp;
  bool passwordInvisible = true;
  File profileFileImage;
  String profileImagePath;
  ImageGalleryClass imageGalleryClass = ImageGalleryClass();
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
                child: Form(
                  key: _completeProfileKey,
                  child: Column(
                    children: [
                  GestureDetector(
                    onTap: (){
                      _imageGalleryOption();
                    },
                    child: Container(
                    margin: EdgeInsets.only(top: 15.0),
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color:profileFileImage == null ? AppColors.TRANSPARENT_COLOR : AppColors.WHITE_COLOR,width:profileFileImage == null  ? 0.0 : 3.0 ),
                      image: DecorationImage(
                          image: profileFileImage != null ?
                          FileImage(profileFileImage)
                          :
                          AssetImage(AssetPaths.COMPLETE_PROFILE_IMAGE),
                          fit: BoxFit.fill
                      )
                    )
                    ),
                  ),


                      SizedBox(height: 25.0,),

                      _firstNameWidget(),

                      SizedBox(height: 14.0,),

                      _lastNameWidget(),

                      SizedBox(height: 14.0,),

                      _emailWidget(),

                      SizedBox(height: 14.0,),

                      _mobileNumberWidget(),

                      SizedBox(height: 14.0,),

                      _completeProfileWidget(),
                      SizedBox(height: 10.0,),

                    ],
                  ),
                ),
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
      title: AppStrings.EDIT_PROFILE_TEXT,
      leadingIconPath: AssetPaths.BACK_ICON,
      isBarImage: false,
      paddingTop: 20.0,
      leadingTap: (){
        print("Leading tap");
        AppNavigation.navigatorPop(context);
      },
    );
  }

  //First Name Widget
  Widget _firstNameWidget()
  {
    return CustomTextFormField(
      textController: _firstNameController,
      containerWidth: MediaQuery.of(context).size.width*0.82,
      hintText: AppStrings.FIRST_NAME_HINT_TEXT,
      borderRadius: 30.0,
      contentPaddingRight: 0.0,
      prefixIcon: AssetPaths.NAME_ICON,
      prefixIconWidth: 16.0,
      contentPaddingTop: 17.0,
      contentPaddingBottom: 17.0,
      onValidate: (value){
        if(value.trim().isEmpty)
        {
          return AppStrings.FIRST_NAME_EMPTY_ERROR;
        }
        return null;
      },

    );
  }

  //Last Name Widget
  Widget _lastNameWidget()
  {
    return CustomTextFormField(
      textController: _lastNameController,
      containerWidth: MediaQuery.of(context).size.width*0.82,
      hintText: AppStrings.LAST_NAME_HINT_TEXT,
      borderRadius: 30.0,
      contentPaddingRight: 0.0,
      prefixIcon: AssetPaths.NAME_ICON,
      prefixIconWidth: 16.0,
      contentPaddingTop: 17.0,
      contentPaddingBottom: 17.0,
      onValidate: (value){
        if(value.trim().isEmpty)
        {
          return AppStrings.LAST_NAME_EMPTY_ERROR;
        }
        return null;
      },

    );
  }

  //Email Widget
  Widget _emailWidget()
  {
    return CustomTextFormField(
      textController: _emailController,
      containerWidth: MediaQuery.of(context).size.width*0.82,
      hintText: AppStrings.EMAIL_HINT_TEXT,
      borderRadius: 30.0,
      contentPaddingRight: 0.0,
      prefixIcon: AssetPaths.EMAIL_ICON,
      prefixIconWidth: 16.0,
      contentPaddingTop: 17.0,
      contentPaddingBottom: 17.0,
      onValidate: (value){
        emailRegExp = RegExp(emailPattern);
        if(value.trim().isEmpty)
        {
          return AppStrings.EMAIL_EMPTY_ERROR;
        }
        else if(!emailRegExp.hasMatch(value))
        {
          return AppStrings.EMAIL_INVALID_ERROR;
        }
        return null;
      },

    );
  }

  //Mobile Number Widget
  Widget _mobileNumberWidget()
  {
    return CustomTextFormField(
      textController: _mobileNoController,
      containerWidth: MediaQuery.of(context).size.width*0.82,
      hintText: AppStrings.MOBILE_NUMBER_HINT_TEXT,
      borderRadius: 30.0,
      contentPaddingRight: 0.0,
      prefixIcon: AssetPaths.MOBILE_ICON,
      prefixIconWidth: 16.0,
      contentPaddingTop: 17.0,
      contentPaddingBottom: 17.0,
      keyBoardType: TextInputType.phone,
      onValidate: (value){
        if(value.trim().isEmpty)
        {
          return AppStrings.MOBILE_NUMBER_EMPTY_ERROR;
        }
        return null;
      },

    );
  }



  //Edit Profile Widget
  Widget _completeProfileWidget()
  {
    return CustomButton(
      containerWidth: MediaQuery.of(context).size.width*0.82,
      buttonColor: AppColors.WHITE_COLOR,
      borderColor: AppColors.WHITE_COLOR,
      elevation: true,
      buttonText: AppStrings.EDIT_PROFILE_TEXT.toUpperCase(),
      textColor: AppColors.BLACK_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.25,
      paddingTop: 13.0,
      paddingBottom: 13.0,
      onTap: (){
        if(_completeProfileKey.currentState.validate())
        {
          print("complete profile");
          AppNavigation.navigatorPop(context);
        }
      },
    );
  }


  //Select Image Start
  void _imageGalleryOption() {
    imageGalleryClass.imageGalleryBottomSheet(
        context: context,
        onCameraTap: (){
          _getImage(imageText:AppStrings.CAMERA_TEXT);
        },
        onGalleryTap: (){
          _getImage(imageText:AppStrings.GALLERY_TEXT);
        }
    );
  }


  void _getImage({String imageText}) async
  {
    if(imageText == AppStrings.CAMERA_TEXT)
    {
      profileImagePath = await imageGalleryClass.getCameraImage();
      _cropImage(imagePath:profileImagePath);
    }
    else if(imageText == AppStrings.GALLERY_TEXT)
    {
      profileImagePath = await imageGalleryClass.getGalleryImage();
      _cropImage(imagePath:profileImagePath);
    }
  }

  void _cropImage({String imagePath}) async
  {
    //Ya use hoa modal bottom sheet ko remove krna ka liya
    AppNavigation.navigatorPop(context);

    if(imagePath != null)
    {
      profileFileImage = await imageGalleryClass.cropImage(imageFilePath: imagePath);


      if(profileFileImage != null)
      {

      }

      setState(() {

      });
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _mobileNoController.dispose();
    super.dispose();
  }



}
