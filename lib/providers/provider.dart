import 'package:flutter/cupertino.dart';
import 'package:prayer_hybrid_app/models/prayer_model.dart';
import 'package:prayer_hybrid_app/models/user_model.dart';

class AppUserProvider extends ChangeNotifier {
  AppUser _appUser;
  List<AppUser> appUserList;

  AppUser get appUser => _appUser;

  void setUser(AppUser appUser) {
    _appUser = appUser;
    notifyListeners();
  }

  void restUserProvider() {
    _appUser = null;
    notifyListeners();
  }
}

class PrayerProvider extends ChangeNotifier {
  PrayerModel _prayerModel;
  List<PrayerModel> prayerList;
  List<PrayerModel> praiseList;

  PrayerModel get prayerModel => _prayerModel;

  void resetPrayerProvider() {
    prayerList.clear();
    notifyListeners();
  }

  void restPraise() {
    praiseList.clear();
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
   if(praise!=null){
     praise.forEach((element) {
       praiseList.add(PrayerModel.fromJson(element));
     });
   }
    notifyListeners();
  }

  void addPrayer(PrayerModel prayerModel) {
    prayerList.add(prayerModel);
    notifyListeners();
  }
}
