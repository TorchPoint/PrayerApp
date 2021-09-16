import 'package:flutter/cupertino.dart';
import 'package:prayer_hybrid_app/models/prayer_model.dart';
import 'package:prayer_hybrid_app/models/reminder_model.dart';
import 'package:prayer_hybrid_app/models/user_model.dart';

class AppUserProvider extends ChangeNotifier {
  AppUser _appUser;
  List<AppUser> prayerPartnersList;
  List<AppUser> searchPartnersList;

  AppUser get appUser => _appUser;

  void setUser(AppUser appUser) {
    _appUser = appUser;
    notifyListeners();
  }

  void restUserProvider() {
    _appUser = null;
    notifyListeners();
  }

  void fetchPrayerPartners(List newPartners) {
    prayerPartnersList = [];
    if (newPartners != null) {
      newPartners.forEach((element) {
        prayerPartnersList.add(AppUser.fromJson(element));
      });
    }
    notifyListeners();
  }

  void fetchSearchListPartners(List newSearchPartners) {
    searchPartnersList = [];
    if (searchPartnersList != null) {
      newSearchPartners.forEach((element) {
        searchPartnersList.add(AppUser.fromJson(element));
      });
    }
    notifyListeners();
  }

  void resetPartnersList() {
    if (prayerPartnersList != null) {
      prayerPartnersList.clear();
    }
    notifyListeners();
  }

  void resetSearchPartnersList() {
    if (searchPartnersList != null) {
      searchPartnersList.clear();
    }
    notifyListeners();
  }
}

class PrayerProvider extends ChangeNotifier {
  PrayerModel _prayerModel;
  List<PrayerModel> prayerList;
  List<PrayerModel> praiseList;
  List<PrayerModel> searchPrayerList;
  List<PrayerModel> searchPraiseList;

  PrayerModel get prayerModel => _prayerModel;

  void resetPrayerProvider() {
    if (praiseList != null) {
      prayerList.clear();
    }
    notifyListeners();
  }

  void restPraise() {
    if (praiseList != null) {
      praiseList.clear();
    }
    notifyListeners();
  }

  void fetchPrayerList(List prayers) {
    prayerList = [];
    if (prayers != null) {
      prayers.forEach((element) {
        prayerList.add(PrayerModel.fromJson(element));
      });
    }
    notifyListeners();
  }

  void fetchPraiseList(List praise) {
    praiseList = [];
    if (praise != null) {
      praise.forEach((element) {
        praiseList.add(PrayerModel.fromJson(element));
      });
    }
    notifyListeners();
  }

  void fetchSearchList(List searchList) {
    searchPraiseList = [];
    searchPrayerList = [];

    if (searchList != null) {
      searchList.forEach((element) {
        if (element["type"] == "praise") {
          searchPraiseList.add(PrayerModel.fromJson(element));
        } else if (element["type"] == "prayer") {
          searchPrayerList.add(PrayerModel.fromJson(element));
        }
      });
    }
    notifyListeners();
  }

  void resetPrayerSearchList() {
    if (searchPrayerList != null) {
      searchPrayerList.clear();
    }
    notifyListeners();
  }

  void resetPraiseSearchList() {
    if (searchPraiseList != null) {
      searchPraiseList.clear();
    }
    notifyListeners();
  }

  void addPrayer(PrayerModel prayerModel) {
    prayerList.add(prayerModel);
    notifyListeners();
  }
}

class ReminderProvider extends ChangeNotifier {
  ReminderModel _reminderModel;

  List<ReminderModel> reminderList;

  ReminderModel get reminderModel => _reminderModel;

  void resetReminderModel() {
    if (reminderList != null) {
      reminderList.clear();
    }
    notifyListeners();
  }

  void fetchReminderList(List reminders) {
    reminderList = [];
    if (reminders != null) {
      reminders.forEach((element) {
        reminderList.add(ReminderModel.fromJson(element));
      });
    }
    notifyListeners();
  }
}
