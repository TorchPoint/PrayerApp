import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/widgets/custom_raised_button.dart';
import 'package:prayer_hybrid_app/widgets/custom_text_form_field.dart';

class AddPrayerScreen extends StatefulWidget {
  @override
  _AddPrayerScreenState createState() => _AddPrayerScreenState();
}

class _AddPrayerScreenState extends State<AddPrayerScreen> {
  final GlobalKey<FormState> _addPrayerKey = GlobalKey<FormState>();
  TextEditingController _prayerTitleController = TextEditingController();
  TextEditingController _addNameController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  List<String> categories = [
    "Once",
    "Daily",
    "Weekly",
    "Monthly"
  ];
  String currentCategoryValue;
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
                padding: EdgeInsets.zero,
                child: Form(
                  key: _addPrayerKey,
                  child: Column(
                    children: [
                     SizedBox(height: MediaQuery.of(context).size.height*0.05,),

                    _prayerTitleWidget(),

                     SizedBox(height: 25.0),

                     _addNameWidget(),

                      SizedBox(height: 25.0,),

                      _categoryWidget(),

                      SizedBox(height: 25.0,),

                      Container(
                          width: MediaQuery.of(context).size.width*0.85,
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text(AppStrings.DESCRIPTION_TEXT,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w700,letterSpacing: 1.5),textScaleFactor: 1.4,)
                      ),

                      SizedBox(height: 10.0,),

                      _descriptionWidget(),

                      SizedBox(height: 25.0,),

                      _addPrayerButtonWidget(),

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
      title: "",
      leadingIconPath: AssetPaths.BACK_ICON,
      leadingTap: (){
        print("Leading tap");
        AppNavigation.navigatorPop(context);
      },
      trailingIconPath: AssetPaths.NOTIFICATION_ICON,
      trailingTap: (){
        print("Notification Icon");
      },
    );
  }


  //Prayer Title Widget
  Widget _prayerTitleWidget()
  {
    return CustomTextFormField(
      textController: _prayerTitleController,
      containerWidth: MediaQuery.of(context).size.width*0.85,
      hintText: AppStrings.PRAYER_TITLE_HINT_TEXT,
      borderRadius: 30.0,
      contentPaddingLeft: 16.0,
      onValidate: (value){
        if(value.trim().isEmpty)
          {
           return AppStrings.PRAYER_TITLE_EMPTY_ERROR;
          }
        return null;
      },

    );
  }

  //Add Name Widget
  Widget _addNameWidget()
  {
    return CustomTextFormField(
      textController: _addNameController,
      containerWidth: MediaQuery.of(context).size.width*0.85,
      hintText: AppStrings.ADD_NAME_HINT_TEXT,
      borderRadius: 30.0,
      contentPaddingLeft: 16.0,
      onValidate: (value){
        if(value.trim().isEmpty)
        {
          return AppStrings.ADD_NAME_EMPTY_ERROR;
        }
        return null;
      },

    );
  }

  Widget _categoryWidget()
  {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              iconEnabledColor: AppColors.WHITE_COLOR,
              dropdownColor: AppColors.MENU_TEXT_COLOR,
              decoration: InputDecoration(

                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: AppColors.WHITE_COLOR)
                ),

                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: AppColors.WHITE_COLOR)
                ),

                errorBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: AppColors.ERROR_COLOR)
                ),

                focusedErrorBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: AppColors.ERROR_COLOR)
                ),

                border: InputBorder.none,
                errorStyle: TextStyle(
                  fontSize: 13.0,
                  color:  AppColors.ERROR_COLOR,
                  fontWeight: FontWeight.w600,
                ),
                errorMaxLines: 2,
                hintText: AppStrings.CATEGORY_HINT_TEXT,
                hintStyle: TextStyle(
                  fontSize: 17.0,
                  color: AppColors.WHITE_COLOR,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: EdgeInsets.only(top: 14.0,bottom: 14.0,left: 16.0,right: 14.0)
              ),
              isDense: true,
              value: currentCategoryValue,
              validator: (value){
                if(value == null)
                {
                  return AppStrings.CATEGORY_EMPTY_ERROR;
                }
                return null;
              },
              onChanged: (String categoryValue) {
                print("current categoryValue:${categoryValue}");
                setState(() {
                  currentCategoryValue = categoryValue;
                });
              },

              selectedItemBuilder: (BuildContext context) {
                return categories.map((value) {
                  return Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    child: Text(
                      value.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColors.WHITE_COLOR,
                          fontSize: 17,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  );
                }).toList();
              },

              items: categories.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    //width: MediaQuery.of(context).size.width*0.6,
                    child: Text(value,style: TextStyle(
                      fontSize: 17.0,
                      color: value == currentCategoryValue ? AppColors.SETTINGS_OPTIONS_COLOR :AppColors.WHITE_COLOR,
                      fontWeight: FontWeight.w600,
                    ),

                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  //Add Name Widget
  Widget _descriptionWidget()
  {
    return CustomTextFormField(
      textController: _descriptionController,
      containerWidth: MediaQuery.of(context).size.width*0.85,
      hintText: AppStrings.DESCRIPTION_HINT_TEXT,
      borderRadius: 13.0,
      contentPaddingLeft: 16.0,
      maxLines: 5,
      onValidate: (value){
        if(value.trim().isEmpty)
        {
          return AppStrings.DESCRIPTION_EMPTY_ERROR;
        }
        return null;
      },

    );
  }


  // Add Prayer Button Widget
  Widget _addPrayerButtonWidget()
  {
    return CustomRaisedButton(
      containerWidth: MediaQuery.of(context).size.width*0.85,
      containerHeight: MediaQuery.of(context).size.height*0.075,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: 0.0,
      buttonText: AppStrings.ADD_PRAYER_TEXT,
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.25,
      onPressed: (){
        if(_addPrayerKey.currentState.validate())
        {

        }
      },
    );
  }






}
