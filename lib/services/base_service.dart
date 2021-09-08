import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:prayer_hybrid_app/auth/screens/auth_main_screen.dart';
import 'package:prayer_hybrid_app/auth/screens/auth_verification_screen.dart';
import 'package:prayer_hybrid_app/drawer/drawer_screen.dart';
import 'package:prayer_hybrid_app/models/user_model.dart';
import 'package:prayer_hybrid_app/providers/user_provider.dart';
import 'package:prayer_hybrid_app/services/API_const.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseService {
  var id;
  String token;
  String user;
  String content;

  void showToast(message, color) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: color,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      textColor: AppColors.WHITE_COLOR,
    );
  }

  void localLocalUser() async {
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
      AppNavigation.navigateTo(context, AuthMainScreen());
    } else {
      var data = jsonDecode(user);
      userProvider.setUser(AppUser.fromJson(data));
      AppNavigation.navigateTo(context, DrawerScreen());
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
    debugPrint("Token:" + token.toString());
    prefs.setString("user", jsonEncode(AppUser.fromJson(value["data"])));
    userProvider.setUser(AppUser.fromJson(value["data"]));
  }

  Future getBaseMethod(
    url, {
    loading = true,
  }) async {
    var uri = Uri.parse(ApiConst.BASE_URL + url);
    print(uri);
    if (loading) {
      EasyLoading.show(dismissOnTap: true, status: "Loading...");
    }
    final http.Response response = await http.get(uri);

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
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future formDataBaseMethod(
    url, {
    bool tokenCheck = false,
    bodyCheck = true,
    Map<String, String> body,
  }) async {
    var uri = Uri.parse(ApiConst.BASE_URL + url);
    debugPrint(uri.toString());
    debugPrint(body.toString());
    EasyLoading.show(status: "Loading", dismissOnTap: true);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var request = http.MultipartRequest('POST', uri)
      ..headers.addAll(tokenCheck == true
          ? {
              'Accept': 'application/json',
              'Content-Type': 'multipart/form-data',
              "Authorization": "Bearer ${prefs.getString("token")}"
            }
          : {
              'Accept': 'application/json',
              'Content-Type': 'multipart/form-data',
            })
      ..fields.addAll(bodyCheck == true ? body : {});
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    try {
      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        debugPrint(respStr);
        return jsonDecode(respStr);
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

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
      } else {
        setUserData(context, value);

        showToast(value["message"], AppColors.SUCCESS_COLOR);
        AppNavigation.navigateTo(context, DrawerScreen());
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
      {attachment}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userProvider = Provider.of<AppUserProvider>(context, listen: false);
    Map<String, String> requestBody = <String, String>{
      "first_name": firstName ?? "",
      "last_name": lastName ?? "",
      "contact_no": phoneNumber ?? "",
      "attachment": attachment ?? ""
    };

    await formDataBaseMethod(ApiConst.UPDATE_PROFILE,
            bodyCheck: true, tokenCheck: true, body: requestBody)
        .then((value) {
      if (value["status"] == 1) {
        showToast(value["message"], AppColors.SUCCESS_COLOR);
        prefs.setString("user", jsonEncode(AppUser.fromJson(value["data"])));
        userProvider.setUser(AppUser.fromJson(value["data"]));
      }
    });
  }

  Future logoutUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await formDataBaseMethod(ApiConst.LOGOUT_URL,
            bodyCheck: false, tokenCheck: true)
        .then((value) {
      if (value["status"] == 1) {
        showToast(value["message"], AppColors.SUCCESS_COLOR);
        prefs.clear();
        //userProvider.restUserProvider();
        AppNavigation.navigatorPop(context);
        AppNavigation.navigateToRemovingAll(context, AuthMainScreen());
      } else {
        print(value.toString());
      }
    });
  }

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
