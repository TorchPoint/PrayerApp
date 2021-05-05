import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_text_form_field.dart';
import 'package:prayer_hybrid_app/reminder_calendar/screens/time_alert_screen.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  TextEditingController _addReminderController = TextEditingController();
  bool errorBoolReminder = true,errorBoolFrequency=true;
  String errorMessageReminder="",errorMessageFrequency="";
  String currentFrequencyValue = AppStrings.SET_FREQUENCY_TEXT;
  static List<String> frequencies = ["Once","Daily","Weekly","Monthly"];
  TimeAlertScreen timeAlertScreen =  TimeAlertScreen();
  CalendarController _calendarController = CalendarController();
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

                    SizedBox(height: 18.0,),

                    Container(
                      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02,right: MediaQuery.of(context).size.width*0.02),
                      child:_calendarWidget()
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
      title: AppStrings.PRAYER_GROUPS_TEXT,
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
      padding: EdgeInsets.only(left: 13.0,right: 13.0,top: 10.5,bottom: 10.5),
      decoration: BoxDecoration(
        color: AppColors.BUTTON_COLOR,
        borderRadius: BorderRadius.circular(28.0),
        border: Border.all(color: errorBoolFrequency == true ? AppColors.TRANSPARENT_COLOR : AppColors.ERROR_COLOR),
        boxShadow: [
          BoxShadow(
            color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 2), // Shadow position
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PopupMenuButton<String>(
            padding: EdgeInsets.zero,
            itemBuilder: (context) {
              return frequencies.map((value) {
                return PopupMenuItem(
                  value: value,
                  child: Text(
                    value,style: TextStyle(
                    fontSize: 16.0,
                    color: value == currentFrequencyValue ? AppColors.SETTINGS_OPTIONS_COLOR :AppColors.MENU_TEXT_COLOR,
                    fontWeight: value == currentFrequencyValue ? FontWeight.w800 : FontWeight.w600,
                ),
                    textAlign: TextAlign.center,
                ));
              }).toList();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  currentFrequencyValue.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: AppColors.WHITE_COLOR,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Icon(Icons.arrow_drop_down,color: AppColors.WHITE_COLOR,),
              ],
            ),
            onSelected: (selectValue) {
              setState(() {
                print('!!!===== $selectValue');
                currentFrequencyValue = selectValue;
              });
            },
          ),
        ],
      ),
    );



    //   Container(
    //   width: MediaQuery.of(context).size.width*0.85,
    //   decoration: BoxDecoration(
    //     color: AppColors.BUTTON_COLOR,
    //     borderRadius: BorderRadius.circular(28.0),
    //     boxShadow: [
    //       BoxShadow(
    //         color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.2),
    //         blurRadius: 6,
    //         offset: Offset(0, 2), // Shadow position
    //       ),
    //     ],
    //   ),
    //   child:DropdownButtonHideUnderline(
    // child: DropdownButtonFormField<String>(
    // iconEnabledColor: AppColors.WHITE_COLOR,
    //   dropdownColor: AppColors.WHITE_COLOR,
    //   decoration: InputDecoration(
    //     isCollapsed: true,
    //       enabledBorder: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(30.0),
    //           borderSide: BorderSide(color: errorBoolFrequency == true ? AppColors.TRANSPARENT_COLOR : AppColors.ERROR_COLOR)
    //       ),
    //
    //       focusedBorder: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(30.0),
    //           borderSide: BorderSide(color: errorBoolFrequency == true ? AppColors.TRANSPARENT_COLOR : AppColors.ERROR_COLOR)
    //       ),
    //
    //       border: InputBorder.none,
    //       hintText: AppStrings.SET_FREQUENCY_HINT_TEXT,
    //       hintStyle: TextStyle(
    //         fontSize: 17.0,
    //         color: AppColors.WHITE_COLOR,
    //         fontWeight: FontWeight.w400,
    //       ),
    //       contentPadding: EdgeInsets.only(top: 12.0,bottom: 12.0,right: MediaQuery.of(context).size.width*0.35),
    //       fillColor: AppColors.BUTTON_COLOR,
    //       filled: true
    //   ),
    //   isDense: true,
    //   value: currentFrequencyValue,
    //   onChanged: (String frequencyValue) {
    //     print("current categoryValue:${frequencyValue}");
    //     setState(() {
    //       currentFrequencyValue = frequencyValue;
    //     });
    //   },
    //
    //   selectedItemBuilder: (BuildContext context) {
    //     return frequencies.map((value) {
    //       return Container(
    //        width: MediaQuery.of(context).size.width*0.4,
    //         child: Text(
    //           value.toString(),
    //           overflow: TextOverflow.ellipsis,
    //           style: TextStyle(
    //               color: AppColors.WHITE_COLOR,
    //               fontSize: 17,
    //               fontWeight: FontWeight.w600
    //           ),
    //           textAlign: TextAlign.center,
    //         ),
    //       );
    //     }).toList();
    //   },
    //
    //   items: frequencies.map((String value) {
    //     return DropdownMenuItem<String>(
    //       value: value,
    //       child: Container(
    //         width: MediaQuery.of(context).size.width*0.6,
    //         child: Text(value,style: TextStyle(
    //           fontSize: 17.0,
    //           color: value == currentFrequencyValue ? AppColors.SETTINGS_OPTIONS_COLOR :AppColors.MENU_TEXT_COLOR,
    //           fontWeight: value == currentFrequencyValue ? FontWeight.w800 : FontWeight.w600,
    //         ),
    //
    //         ),
    //       ),
    //     );
    //   }).toList(),
    // ),
    // )
    // );
  }


  //Calendar Widget
  Widget _calendarWidget()
  {
    return TableCalendar(
      calendarController:_calendarController ,
      startDay: DateTime.now().subtract(Duration(days: 200)),
      endDay: DateTime.now().add(Duration(days: 365)),
      initialSelectedDay: DateTime.now(),
      weekendDays: [],
      initialCalendarFormat: CalendarFormat.month,
      availableCalendarFormats: {CalendarFormat.month:''},
      headerStyle: HeaderStyle(
          centerHeaderTitle: true,formatButtonVisible: false,
           titleTextStyle: TextStyle(color: AppColors.WHITE_COLOR,fontSize: 20.0,fontWeight: FontWeight.w700),
           leftChevronIcon: Icon(Icons.chevron_left,color: AppColors.WHITE_COLOR,size: 28.0,),
           leftChevronPadding: EdgeInsets.zero,
           leftChevronMargin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2),
           rightChevronIcon: Icon(Icons.chevron_right,color: AppColors.WHITE_COLOR,size: 28.0,),
           rightChevronPadding: EdgeInsets.zero,
           rightChevronMargin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.2),

      ),

      calendarStyle: CalendarStyle(outsideDaysVisible: false),
      formatAnimation: FormatAnimation.slide,
      availableGestures:AvailableGestures.horizontalSwipe,
      rowHeight: 65.0,
      builders: CalendarBuilders(
        dayBuilder: (context,dateTime,lists)
        {
         return calendarDaysWidget(dateTime);

        },
        selectedDayBuilder: (context,dateTime,lists)
        {
          return selectDayWidget(dateTime);
        },

        dowWeekdayBuilder:(context,day)
        {
          return weekDaysWidget(day);
        },


      ),

    );
  }


  //Calendar Days Widget
  Widget calendarDaysWidget(DateTime dateTime)
  {
    return Container(
      margin: EdgeInsets.only(right: 6.0,top: 5.0,bottom: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.4),
            blurRadius: 6,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Center(
        child: Text(
          DateFormat(AppStrings.DAY_FORMAT_DD).format(dateTime),
          style: TextStyle(color: AppColors.BLACK_COLOR,fontSize: 12.0,fontWeight: FontWeight.w600),
        ),
      ),
    );
  }


  //Select Day Widget
  Widget selectDayWidget(DateTime dateTime)
  {
    return Container(
      margin: EdgeInsets.only(right: 6.0,top: 5.0,bottom: 5.0),
      decoration: BoxDecoration(
        color: AppColors.BUTTON_COLOR,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.LIGHT_BLACK_COLOR.withOpacity(0.4),
            blurRadius: 6,
            offset: Offset(0, 3), // Shadow position
          ),
        ],

      ),
      child: Center(
        child: Text(
          DateFormat(AppStrings.DAY_FORMAT_DD).format(dateTime),
          style: TextStyle(color: AppColors.WHITE_COLOR,fontSize: 12.0,fontWeight: FontWeight.w600),
        ),
      ),
    );
  }






  //Week Days Widget
  Widget weekDaysWidget(String weekDay)
  {
    return Container(
      height: MediaQuery.of(context).size.height*0.11,
      padding: EdgeInsets.only(left:1.5,right:1.5,top: 1.5,bottom: 1.5),
      margin: EdgeInsets.only(left: 0.5,right: 0.5),
      decoration: BoxDecoration(
          color: AppColors.TRANSPARENT_COLOR,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.WHITE_COLOR)
      ),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.WHITE_COLOR,
            shape: BoxShape.circle
        ),
        child: Center(
          child: Text(
            weekDay.substring(0,2).toUpperCase(),
            style: TextStyle(color: AppColors.BLACK_COLOR,fontSize: 12.0,fontWeight: FontWeight.w600),
          ),
        ),
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

      if(currentFrequencyValue == AppStrings.SET_FREQUENCY_TEXT)
      {
        errorBoolFrequency = false;
        errorMessageFrequency = AppStrings.ADD_FREQUENCY_ERROR_TEXT;
      }
      else
      {
        errorBoolFrequency = true;
        errorMessageFrequency = "";
      }

      setState(() {

      });


      if(errorBoolReminder && errorBoolFrequency)
        {
          AppNavigation.navigatorPop(context);
        }


    }


}
