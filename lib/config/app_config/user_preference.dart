import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_practice/model/user_model.dart';

UserModel? userValue;

class UserPreference {
  static Future<UserModel?> setUserData(UserModel? userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(userModel);
    prefs.setString('user_prefs', json);
    return userModel;
  }

  static Future<UserModel?> getUserPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = prefs.getString('user_prefs');
    return user == null ? null : UserModel.fromJson(jsonDecode(user));
  }
}
