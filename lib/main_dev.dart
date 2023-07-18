import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/config/flavor/flavor_config.dart';
import 'package:ui_practice/constant/app_data.dart';
import 'package:ui_practice/main.dart';
import 'package:ui_practice/model/user_model.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initializeAppData();
  FlavorConfig(flavor: Flavor.dev, values: FlavorValues(appName: "DEV"));
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

initializeAppData() async {
  final userModel = UserModel(
      userName: AppData.userInfo['username'],
      userBankAccountNumber: AppData.userInfo['bank_number'],
      userBankAccountName: AppData.userInfo['bank_account'],
      userProfile: AppData.userInfo['user_profile'],
      userDefaultAccount: UserDefaultAccount(
        totalAmount: AppData.userDefaultAccount['amount'],
        currencyName: AppData.userDefaultAccount['currency_name'],
        currencySymbol: AppData.userDefaultAccount['symbol'],
      ),
      userBankInfoList: AppData.bankAccountData);

  await UserPreference.setUserData(userModel);
  userValue = await UserPreference.getUserPrefs();

}
