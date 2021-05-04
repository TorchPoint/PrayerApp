import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:contacts_service_example/main.dart';

import 'package:contacts_service/contacts_service.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/app_strings.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:prayer_hybrid_app/widgets/custom_app_bar.dart';
import 'package:prayer_hybrid_app/widgets/custom_background_container.dart';
//import 'package:intl/intl.dart';

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<Contact> getContacts = [];
  List<Contact> showContacts;

  @override
  void initState() {
    super.initState();
    getContactsFromDevice();
  }


  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Scaffold(
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        body: Column(
          children: [
            _customAppBar(),
            Expanded(
              child: showContacts != null
                  ?
                  showContacts.length != 0 ?
                ListView.builder(
                itemCount: showContacts.length,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading:CircleAvatar(child: Text(showContacts[index].initials() ?? "")),
                    title: Text(showContacts[index].displayName ?? "",style: TextStyle(color: AppColors.WHITE_COLOR,fontWeight: FontWeight.w600),textScaleFactor: 1.2,),
                    subtitle: Text(showContacts[index].phones.elementAt(0).value ?? "",style: TextStyle(color: AppColors.WHITE_COLOR),textScaleFactor: 1.0,),
                    onTap: (){
                      print("display name"+showContacts[index].displayName.toString());
                      print("phone no"+showContacts[index].phones.elementAt(0).value.toString());
                      AppNavigation.navigatorPopData(context,
                          {
                        "name":showContacts[index].displayName.toString(),
                         "phone no":showContacts[index].phones.elementAt(0).value.toString()
                      });
                    },
                  );
                },
              )
                  :
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 5.0),
                      child: Text(AppStrings.NO_CONTACT_AVAILABLE,style: TextStyle(fontWeight: FontWeight.w800,color: AppColors.WHITE_COLOR),textScaleFactor: 1.3,textAlign: TextAlign.center,),
                    ),
                  )
                  :
              Center(
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.SETTINGS_OPTIONS_COLOR),),
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
      title: AppStrings.CONTACT_LIST_TEXT,
      leadingIconPath: AssetPaths.BACK_ICON,
      leadingTap: (){
        AppNavigation.navigatorPop(context);
      },
    );
  }


  Future<void> getContactsFromDevice() async {
    // Load without thumbnails initially.
    var contacts = (await ContactsService.getContacts(
        withThumbnails: false, iOSLocalizedLabels: false))
        .toList();
    print("Contacts:${contacts.length}");
    if(contacts != null) {
      for (int i = 0; i < contacts.length; i++) {
        Contact c = contacts[i];
        if(c.phones.length !=0) {
          getContacts.add(c);
        }
      }
    }
    setState(() {
      showContacts = getContacts;
    });


    print("Contact filter list:${showContacts.length.toString()}");
    // print("Contact filter list:${_contacts[0].phones.elementAt(0).value}");

  }


}

