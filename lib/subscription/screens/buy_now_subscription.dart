import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/subscription/screens/pay_subscription_screen.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/widgets/custom_raised_button.dart';

class BuyNowSubscription extends StatefulWidget {
  @override
  _BuyNowSubscriptionState createState() => _BuyNowSubscriptionState();
}

class _BuyNowSubscriptionState extends State<BuyNowSubscription> {
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Scaffold(
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        body: Column(
          children: [
            _customAppBar(),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.05),

                  Text(AppStrings.SELECT_PACKAGE_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600,letterSpacing: 1.0),textScaleFactor: 1.45,),

                  SizedBox(height: MediaQuery.of(context).size.height*0.02),

                  _monthlySubscriptionWidget(),

                  SizedBox(height: MediaQuery.of(context).size.height*0.04),

                  _annualSubscriptionWidget(),

                ],
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
      title: AppStrings.SUBSCRIBE_TEXT,
      leadingIconPath: AssetPaths.BACK_ICON,
      leadingTap: (){
        print("Leading tap");
        AppNavigation.navigatorPop(context);
      },
      trailingIconPath: AssetPaths.CANCEL_ICON,
      trailingTap: (){
        AppNavigation.navigatorPop(context);
      },
    );
  }

  //Monthly Subscription Widget
  Widget _monthlySubscriptionWidget()
  {
    return _subscriptionWidget(subscriptionTitle: AppStrings.MONTHLY_SUBSCRIPTION_TEXT,subscriptionAmount: AppStrings.DOLLAR_ZERO_TEXT);
  }

  //Annual Subscription Widget
  Widget _annualSubscriptionWidget()
  {
    return _subscriptionWidget(subscriptionTitle: AppStrings.ANNUAL_SUBSCRIPTION_TEXT,subscriptionAmount: AppStrings.DOLLAR_NINE_TEXT);
  }



  //Subscription Widget
  Widget _subscriptionWidget({String subscriptionTitle,String subscriptionAmount})
  {
    return Container(
     width: MediaQuery.of(context).size.width*0.82,
     height: MediaQuery.of(context).size.height*0.23,
      color: AppColors.TRANSPARENT_COLOR,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.82,
            height: MediaQuery.of(context).size.height*0.20,
            decoration: BoxDecoration(
              color: AppColors.WHITE_COLOR,
              borderRadius: BorderRadius.circular(6.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.3),
                  blurRadius: 10,
                  offset: Offset(0, 4), // Shadow position
                ),
              ],
            ),
            child: Column(
              children: [
              Container(
                width: MediaQuery.of(context).size.width*0.82,
                height: MediaQuery.of(context).size.height*0.06,
                decoration: BoxDecoration(
                    color: AppColors.BUTTON_COLOR,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.0),
                    topRight: Radius.circular(6.0)
                  ),
                ),
                child: Center(child: Text(subscriptionTitle,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w700,letterSpacing: 1.0),textScaleFactor: 1.1,textAlign: TextAlign.center,)),
              ),

             Spacer(
               flex: 1,
             ),

             Text(subscriptionAmount,style: TextStyle(color: AppColors.BUTTON_COLOR,fontWeight: FontWeight.w800,letterSpacing: 1.0),textScaleFactor: 2.4,textAlign: TextAlign.center,),

             Spacer(
               flex: 3,
             )



              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buyNowWidget(),
          ),
        ],
      ),
    );
  }


  Widget _buyNowWidget()
  {
    return CustomRaisedButton(
      containerWidth: MediaQuery.of(context).size.width*0.35,
      containerHeight: MediaQuery.of(context).size.height*0.058,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: 7.0,
      buttonText: AppStrings.BUY_NOW_TEXT,
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 0.9,
      onPressed: (){
        AppNavigation.navigateTo(context, PaySubscription());
      },
    );
  }


}
