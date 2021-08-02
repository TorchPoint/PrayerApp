import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/constants.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/widgets/custom_button.dart';
import 'package:prayer_hybrid_app/widgets/custom_text_form_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _resetPasswordKey = GlobalKey<FormState>();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String passwordPattern = Constants.PASSWORD_VALIDATE_REGEX;
  RegExp passwordRegExp;
  bool passwordInvisible = true,confirmPasswordInvisible=true;
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
                  key: _resetPasswordKey,
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.08,),
                      _newPasswordWidget(),
                      SizedBox(height: 18.0,),
                      _confirmPasswordWidget(),
                      SizedBox(height: 25.0,),
                      _resetPasswordButtonWidget(),
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
      leadingIconPath: AssetPaths.BACK_ICON,
      leadingTap: (){
        AppNavigation.navigatorPop(context);
      },
    );
  }

  //Password Widget
  Widget _newPasswordWidget()
  {
    return CustomTextFormField(
      textController: _newPasswordController,
      containerWidth: MediaQuery.of(context).size.width*0.85,
      hintText: AppStrings.NEW_PASSWORD_HINT_TEXT,
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
          return AppStrings.NEW_PASSWORD_EMPTY_ERROR;
        }
        else if(!passwordRegExp.hasMatch(value))
        {
          return AppStrings.NEW_PASSWORD_INVALID_ERROR;
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
        else if(value != _newPasswordController.text)
        {
          return AppStrings.PASSWORD_DIFFERENT_ERROR;
        }
        return null;
      },

    );
  }


  //Reset Password Button Widget
  Widget _resetPasswordButtonWidget()
  {
    return CustomButton(
      containerWidth: MediaQuery.of(context).size.width*0.83,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: true,
      buttonText: AppStrings.RESET_PASSWORD_TEXT,
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.25,
      paddingTop: 13.5,
      paddingBottom: 13.5,
      onTap: (){
        if(_resetPasswordKey.currentState.validate())
        {
          AppNavigation.navigatorPop(context);
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
  }


}
