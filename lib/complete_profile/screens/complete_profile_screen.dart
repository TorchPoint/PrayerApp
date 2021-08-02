import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
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
  TextEditingController _passwordController = TextEditingController();
  String emailPattern = Constants.EMAIL_VALIDATION_REGEX;
  RegExp emailRegExp;
  String passwordPattern = Constants.PASSWORD_VALIDATE_REGEX;
  RegExp passwordRegExp;
  bool passwordInvisible = true;
  File profileFileImage;
  ImagePicker picker = ImagePicker();
  PickedFile pickedFile;
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
                      imageGalleryOption();
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

                      _passwordWidget(),

                      SizedBox(height: 14.0,),

                      _completeProfileWidget(),

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
      containerWidth: MediaQuery.of(context).size.width*0.85,
      hintText: AppStrings.FIRST_NAME_HINT_TEXT,
      borderRadius: 30.0,
      contentPaddingLeft: 0.0,
      prefixIcon: AssetPaths.NAME_ICON,
      prefixIconWidth: 15.0,
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
      containerWidth: MediaQuery.of(context).size.width*0.85,
      hintText: AppStrings.LAST_NAME_HINT_TEXT,
      borderRadius: 30.0,
      contentPaddingLeft: 0.0,
      prefixIcon: AssetPaths.NAME_ICON,
      prefixIconWidth: 15.0,
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
      containerWidth: MediaQuery.of(context).size.width*0.85,
      hintText: AppStrings.EMAIL_HINT_TEXT,
      borderRadius: 30.0,
      contentPaddingLeft: 0.0,
      prefixIcon: AssetPaths.EMAIL_ICON,
      prefixIconWidth: 15.0,
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

  //Password Widget
  Widget _passwordWidget()
  {
    return CustomTextFormField(
      textController: _passwordController,
      containerWidth: MediaQuery.of(context).size.width*0.85,
      hintText: AppStrings.PASSWORD_HINT_TEXT,
      borderRadius: 30.0,
      contentPaddingLeft: 0.0,
      prefixIcon: AssetPaths.PASSWORD_ICON,
      prefixIconWidth: 15.0,
      obscureText: passwordInvisible == true ? true : false,
      errorMaxLines: 4,
      suffixIcon: passwordInvisible == true ? AssetPaths.VISIBLE_OFF_ICON : AssetPaths.VISIBLE_ON_ICON,
      suffixIconWidth: 22.0,
      onSuffixIconTap: (){
        setState(() {
          passwordInvisible = !passwordInvisible;
        });
      },

      onValidate: (value){
        passwordRegExp = RegExp(passwordPattern);
        if(value.trim().isEmpty)
        {
          return AppStrings.PASSWORD_EMPTY_ERROR;
        }
        else if(!passwordRegExp.hasMatch(value))
        {
          return AppStrings.PASSWORD_INVALID_ERROR;
        }
        return null;
      },

    );
  }


  //Edit Profile Widget
  Widget _completeProfileWidget()
  {
    return CustomButton(
      containerWidth: MediaQuery.of(context).size.width*0.85,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: true,
      buttonText: AppStrings.EDIT_PROFILE_TEXT.toUpperCase(),
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.25,
      paddingTop: 13.5,
      paddingBottom: 13.5,
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
  void imageGalleryOption() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            color: AppColors.MENU_TEXT_COLOR,
            child: SafeArea(
              child: Wrap(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      getCameraImage();
                    },
                    child: Container(
                      color: AppColors.TRANSPARENT_COLOR,
                      margin: EdgeInsets.only(top: 15.0,bottom: 8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 15.0,),
                          Icon(
                            Icons.camera_enhance,
                            color: Colors.white,
                          ),
                          SizedBox(width: 15.0,),
                          Text(
                            AppStrings.CAMERA_TEXT,
                            style:
                            TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white),
                            textScaleFactor: 1.3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  GestureDetector(
                    onTap: (){
                      getGalleryImage();
                    },
                    child: Container(
                      color: AppColors.TRANSPARENT_COLOR,
                      margin: EdgeInsets.only(top: 9.0,bottom: 15.0),
                      child: Row(
                        children: [
                          SizedBox(width: 15.0,),
                          Icon(
                            Icons.image,
                            color: Colors.white,
                          ),
                          SizedBox(width: 15.0,),
                          Text(
                            AppStrings.GALLERY_TEXT,
                            style:
                            TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white),
                            textScaleFactor: 1.3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  void getCameraImage() async
  {
    pickedFile = await picker.getImage(source: ImageSource.camera,imageQuality: 70);
    if(pickedFile != null)
    {
      cropImage(pickedFile.path);
    }
    AppNavigation.navigatorPop(context);
  }

  void getGalleryImage() async
  {
    pickedFile = await picker.getImage(source: ImageSource.gallery,imageQuality: 80);
    if(pickedFile != null)
    {
      cropImage(pickedFile.path);
    }
    AppNavigation.navigatorPop(context);
  }


  void cropImage(String pickedImageFile) async
  {
    profileFileImage = await ImageCropper.cropImage(
        sourcePath: pickedImageFile,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: AppStrings.APP_TITLE_TEXT,
            toolbarColor: AppColors.MENU_TEXT_COLOR,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        )
    );

    if(profileFileImage != null)
    {

    }

    setState(() {

    });

  }

}
