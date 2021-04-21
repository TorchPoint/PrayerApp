import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/widgets/custom_raised_button.dart';


class AuthFirstScreen extends StatefulWidget {
  @override
  _AuthFirstScreenState createState() => _AuthFirstScreenState();
}

class _AuthFirstScreenState extends State<AuthFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
         Padding(
           padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.13),
           child: Text(AppStrings.WELCOME_TO_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600,letterSpacing: 1.5),textScaleFactor: 1.6,),
         ),

         _prayerImageWidget(),

          Container(
            width: MediaQuery.of(context).size.width*0.75,
            margin: EdgeInsets.only(top: 10.0),
            child: Text(AppStrings.GET_STARTED_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600,letterSpacing: 1.0),textScaleFactor: 1.1,textAlign: TextAlign.center,),
          ),

          Container(
            width: MediaQuery.of(context).size.width*0.75,
            margin: EdgeInsets.only(top: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _loginButtonWidget(),
                _signUpButtonWidget(),
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          )

        ],
      ),
    );
  }

  Widget _prayerImageWidget()
  {
    return Container(
      width: MediaQuery.of(context).size.width*0.58,
      height: MediaQuery.of(context).size.height*0.15,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetPaths.FOREGROUND_IMAGE),
              fit: BoxFit.contain
          )
      ),
    );
  }

  Widget _loginButtonWidget()
  {
    return CustomRaisedButton(
      containerWidth: MediaQuery.of(context).size.width*0.35,
      containerHeight: MediaQuery.of(context).size.height*0.061,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: 7.0,
      buttonText: AppStrings.LOGIN_TEXT,
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.25,
      onPressed: (){
      print("login");
      },
    );
  }


  Widget _signUpButtonWidget()
  {
    return CustomRaisedButton(
      containerWidth: MediaQuery.of(context).size.width*0.35,
      containerHeight: MediaQuery.of(context).size.height*0.061,
      buttonColor: AppColors.TRANSPARENT_COLOR,
      borderColor: AppColors.WHITE_COLOR,
      buttonText: AppStrings.SIGN_UP_TEXT,
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.25,
      onPressed: (){
        print("SignUp");
      },
    );
  }

}
