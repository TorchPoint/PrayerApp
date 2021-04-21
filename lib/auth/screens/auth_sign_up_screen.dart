import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/widgets/custom_raised_button.dart';
import 'package:prayer_hybrid_app/widgets/custom_text_form_field.dart';

class AuthSignUpScreen extends StatefulWidget {
  @override
  _AuthSignUpScreenState createState() => _AuthSignUpScreenState();
}

class _AuthSignUpScreenState extends State<AuthSignUpScreen> {
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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

              _signUpButtonWidget(),

              SizedBox(height: 18.0,),

              _socialLoginWidget(),

              SizedBox(height: 14.0,),

              _alreadyAccountRichTextWidget(),



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
      containerWidth: 0.8,
      hintText: AppStrings.FIRST_NAME_HINT_TEXT,
      borderRadius: 30.0,
      contentPaddingLeft: 0.0,
      prefixIcon: AssetPaths.NAME_ICON,
      prefixIconWidth: 15.0,
      onValidate: (value){
        if(value.trim().isEmpty)
          {

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
      containerWidth: 0.8,
      hintText: AppStrings.LAST_NAME_HINT_TEXT,
      borderRadius: 30.0,
      contentPaddingLeft: 0.0,
      prefixIcon: AssetPaths.NAME_ICON,
      prefixIconWidth: 15.0,
      onValidate: (value){
        if(value.trim().isEmpty)
        {

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
      containerWidth: 0.8,
      hintText: AppStrings.EMAIL_HINT_TEXT,
      borderRadius: 30.0,
      contentPaddingLeft: 0.0,
      prefixIcon: AssetPaths.EMAIL_ICON,
      prefixIconWidth: 15.0,
      onValidate: (value){
        if(value.trim().isEmpty)
        {

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
      containerWidth: 0.8,
      hintText: AppStrings.PASSWORD_HINT_TEXT,
      borderRadius: 30.0,
      contentPaddingLeft: 0.0,
      prefixIcon: AssetPaths.PASSWORD_ICON,
      prefixIconWidth: 15.0,
      obscureText: true,
      onValidate: (value){
        if(value.trim().isEmpty)
        {

        }
        return null;
      },

    );
  }

  //Sign Up Widget
  Widget _signUpButtonWidget()
  {
    return CustomRaisedButton(
      containerWidth: MediaQuery.of(context).size.width*0.8,
      containerHeight: MediaQuery.of(context).size.height*0.072,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: 0.0,
      buttonText: AppStrings.SIGN_UP_DASH_TEXT,
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.25,
      onPressed: (){
        print("login");
      },
    );
  }

  //Social Login Widgets
  Widget _socialLoginWidget()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetPaths.FACEBOOK_ICON,width: 45.0,),
        SizedBox(width: 10.0,),
        Image.asset(AssetPaths.GOOGLE_ICON,width: 45.0,),
        SizedBox(width: 10.0,),
        Image.asset(AssetPaths.APPLE_ICON,width: 45.0,),
      ],
    );
  }

  //Already have account Widget
Widget _alreadyAccountRichTextWidget()
 {
   return RichText(
       text: TextSpan(
       text: AppStrings.ALREADY_HAVE_ACCOUNT_TEXT,
       style: TextStyle(color: AppColors.WHITE_COLOR,fontSize: 15.0,letterSpacing: 1.0),
   children: <TextSpan>[
   TextSpan(text: AppStrings.SIGN_IN_DASH_TEXT, style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: 1.0,decoration: TextDecoration.underline,decorationColor: AppColors.WHITE_COLOR, decorationThickness: 2.0,)),

 ],
   )
   );

 }

}
