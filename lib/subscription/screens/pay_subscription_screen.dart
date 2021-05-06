import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/widgets/custom_raised_button.dart';
import 'package:prayer_hybrid_app/subscription/screens/payment_cards_screen.dart';

class PaySubscription extends StatefulWidget {
  @override
  _PaySubscriptionState createState() => _PaySubscriptionState();
}

class _PaySubscriptionState extends State<PaySubscription> {
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

                  Text(AppStrings.ANNUAL_SUBSCRIPTION_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600,letterSpacing: 1.0),textScaleFactor: 1.45,),

                  SizedBox(height: MediaQuery.of(context).size.height*0.04),

                  _paySubscriptionWidget(),

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
        print("Cancel Icon");
        AppNavigation.navigatorPop(context);
      },
    );
  }



  //Subscription Widget
  Widget _paySubscriptionWidget()
  {
    return Container(
      width: MediaQuery.of(context).size.width*0.82,
      height: MediaQuery.of(context).size.height*0.48,
      color: AppColors.TRANSPARENT_COLOR,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.82,
            height: MediaQuery.of(context).size.height*0.45,
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
                  height: MediaQuery.of(context).size.height*0.09,
                  decoration: BoxDecoration(
                    color: AppColors.BUTTON_COLOR,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6.0),
                        topRight: Radius.circular(6.0)
                    ),
                  ),
                  child: Center(child: Text(AppStrings.DOLLAR_NINE_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w700,letterSpacing: 1.0),textScaleFactor: 1.9,textAlign: TextAlign.center,)),
                ),

               Flexible(
                 flex: 1,
                fit: FlexFit.tight,
                 child: Container(),
               ),

                Flexible(
                  flex: 8,
                  fit: FlexFit.tight,
                    child:ListView.builder
                      (
                        itemCount: 6,
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Padding(
                            padding: EdgeInsets.only(top:6.0,bottom: 6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Padding(
                                  padding:EdgeInsets.only(top:3.0),
                                    child: Image.asset(AssetPaths.TICK_ICON,width: 10.0,)
                                ),
                                SizedBox(width: 8.0,),
                                Text(AppStrings.LOREM_IPSUM_TEXT2,style: TextStyle(color: AppColors.BLACK_COLOR,fontWeight: FontWeight.w900,letterSpacing: 1.0),textScaleFactor: 0.9),
                              ],
                            ),
                          );
                        }
                    )
                ),

                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Container(),
                ),



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
      buttonText: AppStrings.PAY_DOLLAR_TEXT,
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 0.9,
      onPressed: (){
        AppNavigation.navigateTo(context, PaymentCardsScreen());
      },
    );
  }


}
