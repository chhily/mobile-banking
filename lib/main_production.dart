import 'package:flutter/material.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/config/flavor/flavor_config.dart';
import 'package:ui_practice/constant/app_data.dart';
import 'package:ui_practice/main.dart';
import 'package:ui_practice/model/user_model.dart';

void main() async {
  initializeAppData();
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
      flavor: Flavor.production, values: FlavorValues(appName: "Production"));
  runApp(const MyApp());

}

initializeAppData() async {
  final userModel = UserModel(
      userName: AppData.userInfo['username'],
      userBankAccountNumber: AppData.userInfo['bank_number'],
      userBankAccountName: AppData.userInfo['bank_account'],
      userProfile: AppData.userInfo['user_profile'],
      userBankInfoList: AppData.bankAccountData);
  await UserPreference.setUserData(userModel);
  userValue = await UserPreference.getUserPrefs();
}
