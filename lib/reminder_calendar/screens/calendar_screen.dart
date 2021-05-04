import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_raised_button.dart';
import 'package:prayer_hybrid_app/widgets/custom_text_form_field.dart';
import 'package:prayer_hybrid_app/reminder_calendar/screens/time_alert_screen.dart';
class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  TextEditingController _addReminderController = TextEditingController();
  bool errorBoolReminder = true,errorBoolFrequency=true;
  String errorMessageReminder="",errorMessageFrequency="";
  String currentFrequencyValue;
  static List<String> frequencies = ["Once","Daily","Weekly","Monthly"];
  TimeAlertScreen timeAlertScreen =  TimeAlertScreen();
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Scaffold(
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        body: Column(
          children: [
            _customAppBar(),
            SizedBox(height: 10.0,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5.0,right: 5.0),
                      child: Text(AppStrings.SET_REMINDER,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w700),textScaleFactor: 1.3,textAlign: TextAlign.center,),
                    ),

                    SizedBox(height: 18.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.075,right: MediaQuery.of(context).size.width*0.075),
                          child: Text(AppStrings.ADD_REMINDER_TITLE,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600),textScaleFactor: 1.18,),
                        )
                    ),
                    SizedBox(height: 10.0,),

                    _addReminderTextFormField(),

                    Align(
                      alignment: Alignment.centerLeft,
                        child: _errorWidget(errorBoolReminder,errorMessageReminder)
                    ),

                    SizedBox(height: 15.0,),

                    _frequencyWidget(),

                    Align(
                        alignment: Alignment.centerLeft,
                        child: _errorWidget(errorBoolFrequency,errorMessageFrequency)
                    ),

                    SizedBox(height: 18.0,),

                    Padding(
                      padding: EdgeInsets.only(left: 5.0,right: 5.0),
                      child: InkWell(
                        onTap: (){
                          timeAlertScreen.timeAlert(context);
                        },
                          child: Text(AppStrings.REMIND_ME_ON,style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600),textScaleFactor: 1.3,textAlign: TextAlign.center,)
                      ),
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


  //Custom App Bar Widget
  Widget _customAppBar()
  {
    return CustomAppBar(
      title: AppStrings.REMINDERS_TEXT,
      trailingIconPath: AssetPaths.TICK_ICON2,
      trailingTap: () {
        addReminderMethod();
      }
    );
  }

//Add Reminder TextForm Field
  Widget _addReminderTextFormField()
  {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      decoration: BoxDecoration(
        color: AppColors.BUTTON_COLOR,
        borderRadius: BorderRadius.circular(28.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 2), // Shadow position
          ),
        ],
      ),
      child: CustomTextFormField(
        textController: _addReminderController,
        containerWidth: MediaQuery.of(context).size.width*0.85,
        hintText: AppStrings.ADD_REMINDER_TITLE_HINT_TEXT,
        borderRadius: 28.0,
        contentPaddingTop: 13.0,
        contentPaddingBottom: 13.0,
        contentPaddingRight: 20.0,
        contentPaddingLeft: 20.0,
        hintSize: 15.0,
        textSize: 15.0,
        isCollapsed: true,
        borderColor: errorBoolReminder == true ? AppColors.TRANSPARENT_COLOR : AppColors.ERROR_COLOR,
        filledColor: AppColors.BUTTON_COLOR,
      ),
    );
  }

  //Error Widget
  Widget _errorWidget(bool errorBool,String errorMessage)
  {
    return errorBool == true ?
    Container()
        :
    Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.075,top: 10.0),
        child: Text(errorMessage.toString(),style: TextStyle(fontSize: 13.0, color:  AppColors.ERROR_COLOR, fontWeight: FontWeight.w600,),)
    );
  }


  //Frequency Widget
  Widget _frequencyWidget()
  {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      decoration: BoxDecoration(
        color: AppColors.BUTTON_COLOR,
        borderRadius: BorderRadius.circular(28.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 2), // Shadow position
          ),
        ],
      ),
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              iconEnabledColor: AppColors.WHITE_COLOR,
              dropdownColor: AppColors.WHITE_COLOR,
              decoration: InputDecoration(

                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: AppColors.TRANSPARENT_COLOR)
                  ),

                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: AppColors.TRANSPARENT_COLOR)
                  ),

                  border: InputBorder.none,
                  hintText: AppStrings.CATEGORY_HINT_TEXT,
                  hintStyle: TextStyle(
                    fontSize: 17.0,
                    color: AppColors.WHITE_COLOR,
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: EdgeInsets.only(top: 13.0,bottom: 13.0,left: 20.0,right: 20.0),
                  fillColor: AppColors.BUTTON_COLOR,
                  filled: true
              ),
              isDense: true,
              value: currentFrequencyValue,
              onChanged: (String frequencyValue) {
                print("current categoryValue:${frequencyValue}");
                setState(() {
                  currentFrequencyValue = frequencyValue;
                });
              },

              selectedItemBuilder: (BuildContext context) {
                return frequencies.map((value) {
                  return Container(
                    width: MediaQuery.of(context).size.width*0.68,
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

              items: frequencies.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    //width: MediaQuery.of(context).size.width*0.6,
                    child: Text(value,style: TextStyle(
                      fontSize: 17.0,
                      color: value == currentFrequencyValue ? AppColors.SETTINGS_OPTIONS_COLOR :AppColors.MENU_TEXT_COLOR,
                      fontWeight: value == currentFrequencyValue ? FontWeight.w800 : FontWeight.w600,
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

void addReminderMethod()
    {
      if(_addReminderController.text.trim().isEmpty)
      {
        errorBoolReminder = false;
        errorMessageReminder = AppStrings.ADD_REMINDER_TITLE_ERROR_TEXT;
      }
      else
      {
        errorBoolReminder = true;
        errorMessageReminder = "";
      }

      if(currentFrequencyValue == null)
      {
        errorBoolFrequency = false;
        errorMessageFrequency = AppStrings.ADD_FREQUENCY_ERROR_TEXT;
      }
      else
      {
        errorBoolFrequency = true;
        errorMessageFrequency = "";
      }

      if(errorBoolReminder && errorBoolFrequency)
        {
          print("ok ha");
        }

    }
}
