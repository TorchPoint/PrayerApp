import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/password/screens/reset_password_screen.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/constants.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/widgets/custom_raised_button.dart';
import 'package:prayer_hybrid_app/widgets/custom_text_form_field.dart';

class ContinueEmailScreen extends StatefulWidget {
  @override
  _ContinueEmailScreenState createState() => _ContinueEmailScreenState();
}

class _ContinueEmailScreenState extends State<ContinueEmailScreen> {
  final GlobalKey<FormState> _continueKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  String emailPattern = Constants.EMAIL_VALIDATION_REGEX;
  RegExp emailRegExp;


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
                  key: _continueKey,
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                      _emailWidget(),
                      SizedBox(height: 25.0),
                      _continueButtonWidget(),
                      SizedBox(height: 10.0),
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

  Widget _continueButtonWidget()
  {
    return CustomRaisedButton(
      containerWidth: MediaQuery.of(context).size.width*0.45,
      containerHeight: MediaQuery.of(context).size.height*0.061,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: 7.0,
      buttonText: AppStrings.CONTINUE_TEXT,
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.28,
      onPressed: (){
        if(_continueKey.currentState.validate())
          {
            AppNavigation.navigateReplacement(context, ResetPasswordScreen());
          }
      },
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
  }

}
