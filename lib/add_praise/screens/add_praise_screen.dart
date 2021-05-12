import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/prayer_praise_info/screens/prayer_praise_tab_screen.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/widgets/custom_raised_button.dart';
import 'package:prayer_hybrid_app/widgets/custom_text_form_field.dart';

class AddPraiseScreen extends StatefulWidget {
  final String praiseButtonText;

  AddPraiseScreen({this.praiseButtonText});
  @override
  _AddPraiseScreenState createState() => _AddPraiseScreenState();
}

class _AddPraiseScreenState extends State<AddPraiseScreen> {
  final GlobalKey<FormState> _addPraiseKey = GlobalKey<FormState>();
  TextEditingController _praiseTitleController = TextEditingController();
  TextEditingController _addNameController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
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
                  key: _addPraiseKey,
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),

                      _praiseTitleWidget(),

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

                      _addPraiseButtonWidget(),

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
        print("Leading tap");
        AppNavigation.navigatorPop(context);
      },
      trailingIconPath: AssetPaths.NOTIFICATION_ICON,
      trailingTap: (){
        print("Notification Icon");
      },
    );
  }


  //Praise Title Widget
  Widget _praiseTitleWidget()
  {
    return CustomTextFormField(
      textController: _praiseTitleController,
      containerWidth: MediaQuery.of(context).size.width*0.85,
      hintText: AppStrings.PRAISE_TITLE_HINT_TEXT,
      borderRadius: 30.0,
      contentPaddingLeft: 16.0,
      onValidate: (value){
        if(value.trim().isEmpty)
        {
          return AppStrings.PRAISE_TITLE_EMPTY_ERROR;
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

  //Category Widget
  Widget _categoryWidget()
  {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              iconEnabledColor: AppColors.WHITE_COLOR,
              dropdownColor: AppColors.WHITE_COLOR,
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
                      borderSide: BorderSide(color: AppColors.ERROR_COLOR,width: 1.3)
                  ),

                  focusedErrorBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: AppColors.ERROR_COLOR,width: 1.3)
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
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
                //print("current categoryValue:${categoryValue}");
                setState(() {
                  currentCategoryValue = categoryValue;
                });
              },

              selectedItemBuilder: (BuildContext context) {
                return AppStrings.categories.map((value) {
                  return Container(
                    width: MediaQuery.of(context).size.width*0.65,
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

              items: AppStrings.categories.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    //width: MediaQuery.of(context).size.width*0.6,
                    child: Text(value,style: TextStyle(
                      fontSize: 17.0,
                      color: value == currentCategoryValue ? AppColors.SETTINGS_OPTIONS_COLOR :AppColors.MENU_TEXT_COLOR,
                      fontWeight: value == currentCategoryValue ? FontWeight.w800 : FontWeight.w600,
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

  //Add Description Widget
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


  //Add Praise Button Widget
  Widget _addPraiseButtonWidget()
  {
    return CustomRaisedButton(
      containerWidth: MediaQuery.of(context).size.width*0.65,
      containerHeight: MediaQuery.of(context).size.height*0.07,
      buttonColor: AppColors.BUTTON_COLOR,
      borderColor: AppColors.BUTTON_COLOR,
      elevation: 7.0,
      buttonText: widget.praiseButtonText,
      textColor: AppColors.WHITE_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 1.3,
      onPressed: (){
        if(_addPraiseKey.currentState.validate())
        {
          if(widget.praiseButtonText == AppStrings.ADD_PRAISE_TEXT.toUpperCase())
          {
            AppNavigation.navigateReplacement(context, PrayerPraiseTabScreen(tabInitialIndex: 1));
          }
          else
          {
            AppNavigation.navigatorPop(context);
          }

        }
      },
    );
  }


  @override
  void dispose() {
    super.dispose();
    _praiseTitleController.dispose();
    _addNameController.dispose();
    _categoryController.dispose();
    _descriptionController.dispose();
  }





}
