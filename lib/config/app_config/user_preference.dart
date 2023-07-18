import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_practice/model/user_model.dart';

UserModel? userValue;

class UserPreference {
  static Future<void> setUserData(UserModel userPref) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_prefs', jsonEncode(userPref));
  }

  static Future<UserModel?> getUserPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userObj = await prefs.getString('user_prefs');
    UserModel? userModelFromStorage;
    if (userObj != null) {
      userModelFromStorage = UserModel.fromJson(jsonDecode(userObj));
    }
    return userModelFromStorage;
  }
}
