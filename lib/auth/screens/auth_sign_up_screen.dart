import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/drawer/drawer_screen.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/constants.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_raised_button.dart';
import 'package:prayer_hybrid_app/widgets/custom_social_button.dart';
import 'package:prayer_hybrid_app/widgets/custom_text_form_field.dart';
import 'dart:io' show Platform;
class AuthSignUpScreen extends StatefulWidget {
  final PageController pageController;

  AuthSignUpScreen({this.pageController});

  @override
  _AuthSignUpScreenState createState() => _AuthSignUpScreenState();
}

class _AuthSignUpScreenState extends State<AuthSignUpScreen> {
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String emailPattern = Constants.EMAIL_VALIDATION_REGEX;
  RegExp emailRegExp;
  String passwordPattern = Constants.PASSWORD_VALIDATE_REGEX;
  RegExp passwordRegExp;
  bool passwordInvisible = true,confirmPasswordInvisible=true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05),
        child: Form(
          key: _signUpKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.08),
                child: Text(AppStrings.WELCOME_TO_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600,letterSpacing: 1.5),textScaleFactor: 1.6,),
              ),
              _prayerImageWidget(),

              SizedBox(height: 25.0,),

              _firstNameWidget(),

              SizedBox(height: 14.0,),

              _lastNameWidget(),

              SizedBox(height: 14.0,),

              _emailWidget(),

              SizedBox(height: 14.0,),

              _passwordWidget(),

              SizedBox(height: 14.0,),

              _confirmPasswordWidget(),

              SizedBox(height: 14.0,),

              _signUpButtonWidget(),

              SizedBox(height: 18.0,),

              _alreadyAccountRichTextWidget(),

              SizedBox(height: 25.0,),

              Platform.isIOS ?
              _signInAppleButtonWidget()
                  :
              Container(),


              Platform.isIOS ?
              SizedBox(height: 15.0,)
                  :
              SizedBox(height: 0.0,),

              _signInFacebookButtonWidget(),

              SizedBox(height: 15.0,),

              _signInGoogleButtonWidget(),

              SizedBox(height: 5.0,),



            ],
          ),
        ),
      ),
    );
  }

  Widget _prayerImageWidget()
  {
    return Container(
      width: MediaQuery.of(context).size.width*0.42,
      height: MediaQuery.of(context).size.height*0.07,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetPaths.FOREGROUND_IMAGE),
              fit: BoxFit.contain
          )
      ),
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



  //Confirm Password Widget
  Widget _confirmPasswordWidget()
  {
    return CustomTextFormField(
      textController: _confirmPasswordController,
      containerWidth: MediaQuery.of(context).size.width*0.85,
      hintText: AppStrings.CONFIRM_PASSWORD_HINT_TEXT,
      borderRadius: 30.0,
      contentPaddingLeft: 0.0,
      prefixIcon: AssetPaths.PASSWORD_ICON,
      prefixIconWidth: 15.0,
      obscureText: confirmPasswordInvisible == true ? true : false,
      errorMaxLines: 4,
      suffixIcon: confirmPasswordInvisible == true ? AssetPaths.VISIBLE_OFF_ICON : AssetPaths.VISIBLE_ON_ICON,
      suffixIconWidth: 22.0,
      onSuffixIconTap: (){
        setState(() {
          confirmPasswordInvisible = !confirmPasswordInvisible;
        });
      },

      onValidate: (value){
        passwordRegExp = RegExp(passwordPattern);
        if(value.trim().isEmpty)
        {
          return AppStrings.CONFIRM_PASSWORD_EMPTY_ERROR;
        }
        else if(!passwordRegExp.hasMatch(value))
        {
          return AppStrings.CONFIRM_PASSWORD_INVALID_ERROR;
        }
        else if(value != _passwordController.text)
          {
          return AppStrings.PASSWORD_DIFFERENT_ERROR;
          }
        return null;
      },

    );
  }



  //Sign Up Widget
  Widget _signUpButtonWidget()
  {
    return CustomRaisedButton(
      containerWidth: MediaQuery.of(context).size.width*0.85,
      containerHeight: MediaQuery.of(context).size.height*0.072,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: 7.0,
      buttonText: AppStrings.SIGN_UP_DASH_TEXT,
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.25,
      onPressed: (){
        if(_signUpKey.currentState.validate())
          {
             print("sign up");
             AppNavigation.navigateTo(context, DrawerScreen());
          }
      },
    );
  }





//Already have account Widget
Widget _alreadyAccountRichTextWidget()
 {
   return Container(
     width: MediaQuery.of(context).size.width*0.85,
     child: RichText(
       textAlign: TextAlign.center,
         text: TextSpan(
         text: AppStrings.ALREADY_HAVE_ACCOUNT_TEXT,
         style: TextStyle(color: AppColors.WHITE_COLOR,fontSize: 15.0,letterSpacing: 1.0),
     children: <TextSpan>[
     TextSpan(
         text: AppStrings.SIGN_IN_DASH_TEXT, style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: 1.0,decoration: TextDecoration.underline,decorationColor: AppColors.WHITE_COLOR, decorationThickness: 2.0,),
         recognizer: TapGestureRecognizer()..onTap = () {
           widget.pageController.jumpToPage(4);
         }
     ),

 ],
     )
     ),
   );

 }



  //Sign in With Apple
  Widget _signInAppleButtonWidget()
  {
    return CustomSocialButton(
      containerWidth: MediaQuery.of(context).size.width*0.85,
      containerHeight: MediaQuery.of(context).size.height*0.072,
      buttonColor: AppColors.WHITE_COLOR,
      labelText: AppStrings.SIGN_IN_APPLE_TEXT,
      labelTextColor: AppColors.BLACK_COLOR,
      iconPath: AssetPaths.APPLE_ICON,
      iconWidth: 20.0,
      iconColor: AppColors.BLACK_COLOR,
      onPressed: (){
        print("Sign in with Apple");
        AppNavigation.navigateTo(context, DrawerScreen());
      },
    );
  }

  //Sign in With Facebook
  Widget _signInFacebookButtonWidget()
  {
    return CustomSocialButton(
      containerWidth: MediaQuery.of(context).size.width*0.85,
      containerHeight: MediaQuery.of(context).size.height*0.072,
      buttonColor: AppColors.FACEBOOK_BUTTON_COLOR,
      labelText: AppStrings.SIGN_IN_FACEBOOK_TEXT,
      labelTextColor: AppColors.WHITE_COLOR,
      iconPath: AssetPaths.FACEBOOK_ICON,
      iconWidth: 14.0,
      iconColor: AppColors.WHITE_COLOR,
      onPressed: (){
        print("Sign in with Facebook");
        AppNavigation.navigateTo(context, DrawerScreen());
      },
    );
  }



  //Sign in With Google
  Widget _signInGoogleButtonWidget()
  {
    return CustomSocialButton(
      containerWidth: MediaQuery.of(context).size.width*0.85,
      containerHeight: MediaQuery.of(context).size.height*0.072,
      buttonColor: AppColors.GOOGLE_BUTTON_COLOR,
      labelText: AppStrings.SIGN_IN_GOOGLE_TEXT,
      labelTextColor: AppColors.WHITE_COLOR,
      iconPath: AssetPaths.GOOGLE_ICON,
      iconWidth: 22.0,
      iconColor: AppColors.WHITE_COLOR,
      onPressed: (){
        print("Sign in with Google");
        AppNavigation.navigateTo(context, DrawerScreen());
      },
    );
  }




 @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }




}
