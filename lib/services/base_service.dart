import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:prayer_hybrid_app/auth/screens/auth_main_screen.dart';
import 'package:prayer_hybrid_app/auth/screens/auth_verification_screen.dart';
import 'package:prayer_hybrid_app/drawer/drawer_screen.dart';
import 'package:prayer_hybrid_app/models/user_model.dart';
import 'package:prayer_hybrid_app/password/screens/reset_password_screen.dart';
import 'package:prayer_hybrid_app/prayer_group/screens/prayer_group_list_screen.dart';
import 'package:prayer_hybrid_app/prayer_partner/screens/prayer_partner_list_screen.dart';
import 'package:prayer_hybrid_app/prayer_praise_info/screens/prayer_praise_tab_screen.dart';
import 'package:prayer_hybrid_app/providers/provider.dart';
import 'package:prayer_hybrid_app/reminder_calendar/screens/reminder_screen.dart';
import 'package:prayer_hybrid_app/services/API_const.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class BaseService {
  var id;
  String token;
  String user;

  void showToast(message, color) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: color,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      textColor: AppColors.WHITE_COLOR,
    );
  }

  /////===== USER DATA SETTING AND LOADING ======/////
  void loadLocalUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getInt("userID");
    token = prefs.getString("token");
    user = prefs.getString("user");
    debugPrint("ID FROM LOCAL:" + id.toString());
    debugPrint("Token FROM LOCAL:" + token.toString());
    debugPrint("User FROM Local:" + user.toString());
  }

  Future loadUserData(BuildContext context) async {
    var userProvider = Provider.of<AppUserProvider>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = prefs.getString("user");

    if (user == null) {
      AppNavigation.navigateReplacement(context, AuthMainScreen());
    } else {
      var data = jsonDecode(user);
      userProvider.setUser(AppUser.fromJson(data));

      AppNavigation.navigateReplacement(context, DrawerScreen());
    }
  }

  Future setUserData(BuildContext context, value) async {
    var userProvider = Provider.of<AppUserProvider>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("userID", value["data"]["id"]);
    id = prefs.getInt("userID");
    debugPrint("LocalID:" + id.toString());
    prefs.setString("token", value["bearer_token"]);
    token = prefs.getString("token");
    token = prefs.getString("token");
    debugPrint("Token:" + token.toString());
    prefs.setString("user", jsonEncode(AppUser.fromJson(value["data"])));
    userProvider.setUser(AppUser.fromJson(value["data"]));
  }

  /////===== USER DATA SETTING AND LOADING END======/////

  /////-----BASE METHODS----//////

  Future getBaseMethod(url, {loading = true, tokenCheck = false}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uri = Uri.parse(ApiConst.BASE_URL + url);
    print(uri);
    if (loading) {
      EasyLoading.show(dismissOnTap: true, status: "Loading...");
    }
    final http.Response response = await http.get(uri,
        headers: tokenCheck == true
            ? {"Authorization": "Bearer ${prefs.getString("token")}"}
            : {});

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      var jsonData = jsonDecode(response.body);
      debugPrint(jsonData.toString());
      return jsonData;
    }
  }

  Future postBaseMethod(url, body, {token}) async {
    var uri = Uri.parse(ApiConst.BASE_URL + url);
    debugPrint(uri.toString());
    debugPrint(body);
    EasyLoading.instance..backgroundColor = AppColors.BACKGROUND1_COLOR;
    EasyLoading.show(
      status: "Loading",
    );

    final http.Response response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "Bearer $token"
      },
    );
    try {
      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        var jsonData = jsonDecode(response.body);
        debugPrint(jsonData.toString());
        return jsonData;
      } else {
        EasyLoading.dismiss();
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future formDataBaseMethod(url,
      {bool tokenCheck = false,
      bodyCheck = true,
      Map<String, String> body,
      File files,
      filesCheck = false}) async {
    var uri = Uri.parse(ApiConst.BASE_URL + url);
    debugPrint("Url:" + uri.toString());
    debugPrint("Body:" + body.toString());
    EasyLoading.show(status: "Loading", dismissOnTap: true);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var request = http.MultipartRequest('POST', uri);

    request.headers.addAll(tokenCheck == true
        ? {
            'Accept': 'application/json',
            'Content-Type': 'multipart/form-data',
            "Authorization": "Bearer ${prefs.getString("token")}"
          }
        : {
            'Accept': 'application/json',
            'Content-Type': 'multipart/form-data',
          });

    if (filesCheck == true) {
      request.files
          .add(await http.MultipartFile.fromPath('attachment', files.path));
    }
    bodyCheck == true ? request.fields.addAll(body) : request.files.addAll({});

    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    try {
      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        debugPrint("Response:" + respStr);
        return jsonDecode(respStr);
      } else {
        EasyLoading.dismiss();
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  /////-----BASE METHODS END----//////

  //---- SIGNUP AND LOGIN FLOW-----////////

  Future loginFormUser(BuildContext context, {email, password}) async {
    Map<String, String> requestBody = <String, String>{
      "email": email ?? "",
      "password": password ?? "",
      "device_token": "testing",
      "device_type": Platform.operatingSystem ?? "ios"
    };
    await formDataBaseMethod(ApiConst.SIGN_IN_URL, body: requestBody)
        .then((value) {
      if (value["status"] == 0) {
        showToast(value["message"], AppColors.ERROR_COLOR);
      } else if (value["status"] == 1) {
        if (value["data"]["account_verified"] == 0) {
          AppNavigation.navigateTo(
              context,
              VerificationScreen(
                emailVerificationCheck: false,
                userData: value["data"]["id"].toString(),
              ));
        } else {
          setUserData(context, value);
          showToast(value["message"], AppColors.SUCCESS_COLOR);
          AppNavigation.navigateReplacement(context, DrawerScreen());
        }
      }
    });
  }

  Future signUpUser(BuildContext context, firstName, lastName, email,
      phoneNumber, password) async {
    Map<String, String> requestBody = <String, String>{
      "email": email ?? "",
      "password": password ?? "",
      "device_token": "testing",
      "device_type": Platform.operatingSystem ?? "ios",
      "first_name": firstName ?? "",
      "last_name": lastName ?? "",
      "contact_no": phoneNumber ?? ""
    };
    await formDataBaseMethod(ApiConst.SIGNUP_URL,
            bodyCheck: true, body: requestBody)
        .then((value) {
      if (value["status"] == 1) {
        showToast(value["message"], AppColors.SUCCESS_COLOR);

        AppNavigation.navigateTo(
            context,
            VerificationScreen(
              emailVerificationCheck: false,
              userData: value["data"]["user_id"].toString(),
            ));
      } else {
        showToast(value["message"], AppColors.ERROR_COLOR);
      }
    });
  }

  Future verifyUserUsingOTP(BuildContext context, userID, otp) async {
    Map<String, String> requestBody = <String, String>{
      "user_id": userID,
      "otp": otp,
    };

    await formDataBaseMethod(ApiConst.VERIFICATION_URL,
            body: requestBody, bodyCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        showToast(value["message"], AppColors.SUCCESS_COLOR);
        setUserData(context, value);
        AppNavigation.navigateTo(context, DrawerScreen());
      } else {
        showToast(value["message"], AppColors.ERROR_COLOR);
      }
    });
  }

  Future reSendVerification(BuildContext context, userID) async {
    Map<String, String> requestBody = <String, String>{
      "user_id": userID,
    };
    await formDataBaseMethod(ApiConst.RESEND_EMAIL_VERIFICATION_URL,
            bodyCheck: true, body: requestBody)
        .then((value) {
      if (value["status"] == 1) {
        showToast(value["message"], AppColors.SUCCESS_COLOR);
      }
    });
  }

  Future updateUserprofile(
      BuildContext context, firstName, lastName, phoneNumber,
      {File attachment}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userProvider = Provider.of<AppUserProvider>(context, listen: false);
    Map<String, String> requestBody = <String, String>{
      "first_name": firstName ?? "",
      "last_name": lastName ?? "",
      "contact_no": phoneNumber ?? "",
    };

    await formDataBaseMethod(ApiConst.UPDATE_PROFILE,
            bodyCheck: true,
            tokenCheck: true,
            body: requestBody,
            files: attachment,
            filesCheck: attachment != null ? true : false)
        .then((value) {
      if (value["status"] == 1) {
        showToast(value["message"], AppColors.SUCCESS_COLOR);
        // setUserData(context, value);
        prefs.setString("user", jsonEncode(AppUser.fromJson(value["data"])));
        userProvider.setUser(AppUser.fromJson(value["data"]));
      }
    });
  }

  Future updateOrChangePassword(
      BuildContext context, oldPassword, newPassword) async {
    Map<String, String> requestBody = <String, String>{
      "old_password": oldPassword,
      "new_password": newPassword,
    };

    await formDataBaseMethod(ApiConst.UPDATE_PASSWORD_URL,
            bodyCheck: true, body: requestBody, tokenCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        showToast(value["message"], AppColors.SUCCESS_COLOR);
        AppNavigation.navigateTo(context, DrawerScreen());
      } else {
        showToast(value["message"], AppColors.ERROR_COLOR);
      }
    });
  }

  //---- SIGNUP AND LOGIN FLOW END-----////////

  ////------ Password Change Flow-------/////

  Future forgetPassword(BuildContext context, email) async {
    Map<String, String> requestBody = <String, String>{
      "email": email ?? "",
    };
    await formDataBaseMethod(ApiConst.FORGET_PASSWORD_URL,
            body: requestBody, bodyCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        showToast(value["message"], AppColors.SUCCESS_COLOR);
        AppNavigation.navigateToRemovingAll(
            context,
            VerificationScreen(
              emailVerificationCheck: true,
              userData: email,
            ));
      } else {
        showToast(value["errors"], AppColors.ERROR_COLOR);
      }
    });
  }

  Future verifyForgetPasswordUsingEmail(
      BuildContext context, email, otp) async {
    Map<String, String> requestBody = <String, String>{
      "email": email,
      "otp": otp,
    };

    await formDataBaseMethod(ApiConst.FORGET_VERIFICATION_URL,
            bodyCheck: true, body: requestBody)
        .then((value) {
      if (value["status"] == 1) {
        showToast(value["message"], AppColors.SUCCESS_COLOR);
        AppNavigation.navigateTo(
            context,
            ResetPasswordScreen(
              otp: otp,
              email: email,
            ));
      } else {
        showToast(value["errors"], AppColors.ERROR_COLOR);
      }
    });
  }

  Future restPassword(BuildContext context, newPassword, email, otp) async {
    Map<String, String> requestBody = <String, String>{
      "email": email,
      "otp": otp,
      "new_password": newPassword
    };

    await formDataBaseMethod(ApiConst.RESET_PASSWORD_URL,
            body: requestBody, bodyCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        showToast(value["message"], AppColors.SUCCESS_COLOR);
        AppNavigation.navigateToRemovingAll(context, AuthMainScreen());
      } else {
        showToast(value["errors"], AppColors.ERROR_COLOR);
      }
    });
  }

  ////------ Password Change Flow END-------/////

  //-----LOGOUT------//

  Future logoutUser(BuildContext context) async {
    var userProvider = Provider.of<AppUserProvider>(context, listen: false);
    var prayerProvider = Provider.of<PrayerProvider>(context, listen: false);
    var reminderProvider =
        Provider.of<ReminderProvider>(context, listen: false);
    var groupProvider = Provider.of<GroupProvider>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await formDataBaseMethod(ApiConst.LOGOUT_URL,
            bodyCheck: false, tokenCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        showToast(value["message"], AppColors.SUCCESS_COLOR);
        prefs.clear();
        if (prayerProvider != null) {
          prayerProvider.resetPrayerProvider();
          prayerProvider.restPraise();
        }
        if (reminderProvider != null) {
          reminderProvider.resetReminderModel();
        }
        if (userProvider != null) {
          userProvider.resetPartnersList();
        }
        if (groupProvider != null) {
          groupProvider.resetGroupsList();
        }
        AppNavigation.navigatorPop(context);
        AppNavigation.navigateToRemovingAll(context, AuthMainScreen());
      } else {
        print("error");
      }
    });
  }

  //-----LOGOUT END------//

  ////====== SOCIAL LOGINS========/////

  Future fbSocialMethod(BuildContext context) async {
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ['public_profile', 'email'],
    );

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken;

      final graphResponse = await http.get(Uri.parse(
          'https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${accessToken.token}'));
      print("Graph response" + graphResponse.body.toString());
      var data = jsonDecode(graphResponse.body);

      socialLoginFacebook(
        context,
        data["id"],
        data["name"],
        data["email"],
        data["picture"]["data"]["url"],
      );
    } else if (result.status == LoginStatus.cancelled) {
      showToast("${result.message}", AppColors.ERROR_COLOR);
    } else if (result.status == LoginStatus.failed) {
      showToast("${result.message}", AppColors.ERROR_COLOR);
    }
  }

  Future googleSocialMethod(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      socialLoginGoogle(
          context,
          googleSignIn.currentUser.id,
          googleSignIn.currentUser.displayName,
          googleSignIn.currentUser.email,
          googleSignIn.currentUser.photoUrl);
    }
  }

  Future appleSocialMethod(BuildContext context) async {
    var userProvider = Provider.of<AppUserProvider>(context, listen: false);
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    if (userProvider.appUser == null) {
      socialLoginApple(context, credential.userIdentifier, credential.givenName,
          credential.email);
    } else {
      socialLoginApple(context, userProvider.appUser.userSocialToken,
          userProvider.appUser.firstName, userProvider.appUser.email);
    }
    print(credential);
  }

  Future socialLoginApple(
      BuildContext context, accessToken, name, email) async {
    Map<String, String> requestBody = <String, String>{
      "access_token": accessToken,
      "device_token": "testing",
      "device_type": Platform.operatingSystem ?? "ios",
      "provider": "apple",
      "name": name,
      "email": email,
      "image": "",
      "phone": "",
    };
    await formDataBaseMethod(ApiConst.SOCIAL_LOGIN,
            body: requestBody, bodyCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        setUserData(context, value);
        showToast(value["message"], AppColors.SUCCESS_COLOR);
        AppNavigation.navigateReplacement(context, DrawerScreen());
      } else {
        showToast(value["message"], AppColors.ERROR_COLOR);
      }
    });
  }

  Future socialLoginFacebook(
      BuildContext context, accessToken, name, email, image) async {
    Map<String, String> requestBody = <String, String>{
      "access_token": accessToken,
      "device_token": "testing",
      "device_type": Platform.operatingSystem ?? "ios",
      "provider": "facebook",
      "name": name,
      "email": email,
      "image": image,
      "phone": "",
    };

    await formDataBaseMethod(ApiConst.SOCIAL_LOGIN,
            body: requestBody, bodyCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        setUserData(context, value);
        showToast(value["message"], AppColors.SUCCESS_COLOR);
        AppNavigation.navigateReplacement(context, DrawerScreen());
      } else {
        showToast(value["message"], AppColors.ERROR_COLOR);
      }
    });
  }

  Future socialLoginGoogle(
      BuildContext context, accessToken, name, email, image) async {
    Map<String, String> requestBody = <String, String>{
      "access_token": accessToken,
      "device_token": "testing",
      "device_type": Platform.operatingSystem ?? "ios",
      "provider": "google",
      "name": name,
      "email": email,
      "image": image,
      "phone": "",
    };

    await formDataBaseMethod(ApiConst.SOCIAL_LOGIN,
            body: requestBody, bodyCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        setUserData(context, value);
        showToast(value["message"], AppColors.SUCCESS_COLOR);
        AppNavigation.navigateReplacement(context, DrawerScreen());
      } else {
        showToast(value["message"], AppColors.ERROR_COLOR);
      }
    });
  }

  ////====== SOCIAL LOGINS END========/////

  /////======== CORE MODULE =========///////

  Future fetchPrayers(BuildContext context) async {
    var prayerProvider = Provider.of<PrayerProvider>(context, listen: false);

    await getBaseMethod(ApiConst.FETCH_PRAYERS_URL + "?type=prayer",
            tokenCheck: true, loading: true)
        .then((value) {
      if (value["status"] == 1) {
        prayerProvider.fetchPrayerList(value["data"]);
      } else {
        showToast(value["message"], AppColors.ERROR_COLOR);
        prayerProvider.resetPrayerProvider();
      }
    });
  }

  Future addPrayer(BuildContext context, categoryID, desc, title, name) async {
    Map<String, String> requestBody = <String, String>{
      "category": categoryID,
      "description": desc,
      "title": title,
      "name": name,
      "type": "prayer",
    };

    await formDataBaseMethod(ApiConst.ADD_PRAYER_URL,
            tokenCheck: true, bodyCheck: true, body: requestBody)
        .then((value) {
      if (value["status"] == 1) {
        showToast("Prayer Added", AppColors.SUCCESS_COLOR);
        AppNavigation.navigatorPop(context);
        AppNavigation.navigateTo(context, PrayerPraiseTabScreen());
      }
    });
  }

  Future updatePrayer(
      BuildContext context, categoryID, prayerId, desc, title, name) async {
    Map<String, String> requestBody = <String, String>{
      "category": categoryID.toString(),
      "description": desc,
      "title": title,
      "name": name,
      "type": "prayer",
      "prayer": prayerId.toString(),
    };

    await formDataBaseMethod(ApiConst.UPDATE_PRAYER_URL,
            body: requestBody, bodyCheck: true, tokenCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        showToast(value["message"], AppColors.SUCCESS_COLOR);
        AppNavigation.navigatorPop(context);
        AppNavigation.navigateTo(context, PrayerPraiseTabScreen());
      }
    });
  }

  Future deletePrayer(BuildContext context, prayerID) async {
    Map<String, String> requestBody = <String, String>{
      "prayer": prayerID.toString(),
    };

    await formDataBaseMethod(ApiConst.DELETE_PRAYER_URL,
            bodyCheck: true, body: requestBody, tokenCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        showToast(value["message"], AppColors.SUCCESS_COLOR);
        fetchPrayers(context);
      }
    });
  }

  Future fetchPraise(BuildContext context) async {
    var praiseProvider = Provider.of<PrayerProvider>(context, listen: false);

    await getBaseMethod(ApiConst.FETCH_PRAYERS_URL + "?type=praise",
            tokenCheck: true, loading: true)
        .then((value) {
      if (value["status"] == 1) {
        praiseProvider.fetchPraiseList(value["data"]);
      } else {
        showToast(value["message"], AppColors.ERROR_COLOR);
        praiseProvider.restPraise();
      }
    });
  }

  Future addPraise(BuildContext context, categoryID, desc, title, name) async {
    Map<String, String> requestBody = <String, String>{
      "category": categoryID,
      "description": desc,
      "title": title,
      "name": name,
      "type": "praise",
    };

    await formDataBaseMethod(ApiConst.ADD_PRAYER_URL,
            tokenCheck: true, bodyCheck: true, body: requestBody)
        .then((value) {
      if (value["status"] == 1) {
        showToast("Praise Added", AppColors.SUCCESS_COLOR);
        AppNavigation.navigatorPop(context);
        AppNavigation.navigateTo(context, PrayerPraiseTabScreen());
      }
    });
  }

  Future updatePraise(
      BuildContext context, categoryID, praiseId, desc, title, name) async {
    Map<String, String> requestBody = <String, String>{
      "category": categoryID.toString(),
      "description": desc,
      "title": title,
      "name": name,
      "type": "praise",
      "prayer": praiseId.toString(),
    };

    await formDataBaseMethod(ApiConst.UPDATE_PRAYER_URL,
            body: requestBody, bodyCheck: true, tokenCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        showToast(value["message"], AppColors.SUCCESS_COLOR);
        AppNavigation.navigatorPop(context);
        AppNavigation.navigateTo(context, PrayerPraiseTabScreen());
      }
    });
  }

  Future deletePraise(BuildContext context, praiseID) async {
    Map<String, String> requestBody = <String, String>{
      "prayer": praiseID.toString(),
    };

    await formDataBaseMethod(ApiConst.DELETE_PRAYER_URL,
            bodyCheck: true, body: requestBody, tokenCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        showToast(value["message"], AppColors.SUCCESS_COLOR);
        fetchPraise(context);
      } else {}
    });
  }



  Future finishPrayer(BuildContext context, prayerID, prayerDuration) async {
    Map<String, String> requestBody = <String, String>{
      "prayer": prayerID.toString(),
      "prayer_duration": prayerDuration
    };

    await formDataBaseMethod(ApiConst.ANSWER_PRAYER_URL,
            body: requestBody, bodyCheck: true, tokenCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        showToast("Ended", AppColors.SUCCESS_COLOR);
        AppNavigation.navigatorPop(context);
        AppNavigation.navigateTo(context, PrayerPraiseTabScreen());
      }
    });
  }

  Future searchPrayer(BuildContext context, search) async {
    var praiseProvider = Provider.of<PrayerProvider>(context, listen: false);

    getBaseMethod(ApiConst.SEARCH_PRAYERS_URL + "?search=${search}",
            loading: true, tokenCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        praiseProvider.fetchSearchList(value["data"]);
      } else {
        praiseProvider.resetPrayerSearchList();
        praiseProvider.resetPraiseSearchList();
        showToast(value["message"], AppColors.ERROR_COLOR);
      }
    });
  }

  Future searchGroupPartners(BuildContext context, search) async {
    var userProvider = Provider.of<AppUserProvider>(context, listen: false);

    await getBaseMethod(ApiConst.SEARCH_PARTNERS_URL + "?search=${search}",
            tokenCheck: true, loading: true)
        .then((value) {
      if (value["status"] == 1) {
        userProvider.fetchSearchListPartners(value["data"]);
      } else {
        showToast(value["message"], AppColors.ERROR_COLOR);
      }
    });
  }

  Future fetchReminderList(BuildContext context) async {
    var reminderProvider =
        Provider.of<ReminderProvider>(context, listen: false);

    await getBaseMethod(ApiConst.FETCH_REMINDERS_URL,
            tokenCheck: true, loading: true)
        .then((value) {
      if (value["status"] == 1) {
        reminderProvider.fetchReminderList(value["data"]);
      } else {
        reminderProvider.resetReminderModel();
      }
    });
  }

  Future addReminder(BuildContext context, title, frequency, reminderTime,
      reminderDate) async {
    Map<String, String> requestBody = <String, String>{
      "title": title,
      "reminder_date": reminderDate,
      "type": frequency,
      "reminder_time": reminderTime,
    };

    await formDataBaseMethod(ApiConst.ADD_REMINDER_URL,
            bodyCheck: true, body: requestBody, tokenCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        showToast("Reminder Added", AppColors.SUCCESS_COLOR);
        // Navigator.pop(context);
        // fetchReminderList(context);
        AppNavigation.navigatorPop(context);
        AppNavigation.navigateReplacement(context, ReminderScreen());
      }
    });
  }

  Future updateReminder(BuildContext context, title, frequency, reminderTime,
      reminderDate, reminderID) async {
    Map<String, String> requestBody = <String, String>{
      "title": title,
      "reminder_date": reminderDate,
      "type": frequency,
      "reminder_time": reminderTime,
      "reminder": reminderID.toString(),
    };
    await formDataBaseMethod(ApiConst.UPDATE_REMINDER_URL,
            bodyCheck: true, body: requestBody, tokenCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        showToast("Reminder Updated", AppColors.SUCCESS_COLOR);
        AppNavigation.navigatorPop(context);
        AppNavigation.navigateReplacement(context, ReminderScreen());
      }
    });
  }

  Future deleteReminder(BuildContext context, reminderID) async {
    Map<String, String> requestBody = <String, String>{
      "reminder": reminderID.toString(),
    };

    formDataBaseMethod(ApiConst.DELETE_REMINDER_URL,
            bodyCheck: true, body: requestBody, tokenCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        showToast("Reminder Deleted", AppColors.SUCCESS_COLOR);
        fetchReminderList(context);
      } else {}
    });
  }

  Future fetchPartnersList(BuildContext context) async {
    var userProvider = Provider.of<AppUserProvider>(context, listen: false);
    await getBaseMethod(ApiConst.FETCH_PARTNERS_URL,
            loading: true, tokenCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        userProvider.fetchPrayerPartners(value["data"]);
      } else {
        showToast(value["message"], AppColors.ERROR_COLOR);
        userProvider.resetPartnersList();
      }
    });
  }

  Future addPrayerPartners(BuildContext context, contact, name) async {
    Map<String, String> requestBody = <String, String>{
      "contact_no": contact,
      "name": name,
    };

    await formDataBaseMethod(ApiConst.ADD_PARTNERS_URL,
            tokenCheck: true, body: requestBody, bodyCheck: true)
        .then((value) {
      if (value["status"] == 0) {
        showToast(value["message"], AppColors.ERROR_COLOR);
        AppNavigation.navigatorPop(context);
      } else {
        showToast(value["message"], AppColors.SUCCESS_COLOR);
        AppNavigation.navigatorPop(context);
        AppNavigation.navigateReplacement(context, PrayerPartnerListScreen());
      }
    });
  }

  Future fetchGroups(BuildContext context) async {
    var groupProvider = Provider.of<GroupProvider>(context, listen: false);
    await getBaseMethod(ApiConst.FETCH_GROUP_PRAYER,
            tokenCheck: true, loading: true)
        .then((value) {
      if (value["status"] == 1) {
        groupProvider.fetchGroups(value["data"]);
      } else {
        showToast(value["message"], AppColors.ERROR_COLOR);
        groupProvider.resetGroupsList();
      }
    });
  }

  Future fetchGroupMembers(BuildContext context) async {
    var groupProvider = Provider.of<GroupProvider>(context, listen: false);

    await getBaseMethod(ApiConst.FETCH_GROUP_PRAYER,
            tokenCheck: true, loading: true)
        .then((value) {
      if (value["status"] == 1) {
        value["data"].forEach((element) {
          groupProvider.fetchGroupMembersList(element["member"]);
        });
      }
    });
  }

  Future addPrayerGroup(
    BuildContext context,
    name,
    member,
  ) async {
    Map<String, String> requestBody = <String, String>{
      "members": member,
      "name": name,
    };

    await formDataBaseMethod(ApiConst.ADD_PRAYER_GROUP_URL,
            tokenCheck: true, body: requestBody, bodyCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        showToast("Prayer Group Added", AppColors.SUCCESS_COLOR);
        AppNavigation.navigatorPop(context);
        fetchGroups(context);
        //AppNavigation.navigateTo(context, PrayerGroupListScreen());
      }
    });
  }

  Future updatePrayerGroup(BuildContext context, groupID, name, member) async {
    Map<String, String> requestBody = <String, String>{
      "members": member,
      "name": name,
      "group": groupID.toString(),
    };

    await formDataBaseMethod(ApiConst.UPDATE_PRAYER_GROUP,
            tokenCheck: true, bodyCheck: true, body: requestBody)
        .then((value) {
      if (value["status"] == 1) {
        showToast("Group Updated", AppColors.SUCCESS_COLOR);
        AppNavigation.navigatorPop(context);
        fetchGroups(context);
        // AppNavigation.navigateTo(context, PrayerGroupListScreen());
      } else {
        showToast(value["message"], AppColors.ERROR_COLOR);
      }
    });
  }

  Future deleteGroupPrayer(BuildContext context, groupID) async {
    Map<String, String> requestBody = <String, String>{
      "group": groupID.toString(),
    };

    await formDataBaseMethod(ApiConst.DELETE_PRAYER_GROUP,
            tokenCheck: true, body: requestBody, bodyCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        showToast("Group Deleted", AppColors.SUCCESS_COLOR);

        fetchGroups(context);
        //AppNavigation.navigateTo(context, PrayerGroupListScreen());
      } else {
        showToast(value["message"], AppColors.ERROR_COLOR);
      }
    });
  }

  /////======== CORE MODULE END =========///////
  void login(BuildContext context, {email, password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await postBaseMethod(ApiConst.SIGN_IN_URL, {
      "email": email ?? "",
      "password": password ?? "",
      "device_token": "testing",
      "device_type": Platform.operatingSystem ?? "ios"
    }).then((value) {
      if (value["status"] == 0) {
        showToast(value["message"], AppColors.ERROR_COLOR);
      } else {
        prefs.setInt("userID", value["data"]["id"]);
        id = prefs.getInt("userID");
        debugPrint("LocalID:" + id.toString());

        prefs.setString("token", value["bearer_token"]);
        token = prefs.getString("token");
        debugPrint(token.toString());
        showToast(value["message"], AppColors.SUCCESS_COLOR);
        AppNavigation.navigateTo(context, DrawerScreen());
      }
    });
  }
}
