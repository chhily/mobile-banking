import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/config/flavor/flavor_config.dart';
import 'package:ui_practice/constant/app_data.dart';
import 'package:ui_practice/main.dart';
import 'package:ui_practice/model/user_model.dart';
import 'package:ui_practice/util/helper.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await onCheckSystemTheme();
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
        userName: AppData.userDefaultAccount['username'],
        qrCode: AppData.userDefaultAccount['qr_image'],
        userBankAccountNumber: AppData.userDefaultAccount['bank_number'],
        link: AppData.userDefaultAccount['link'],
        userBankAccountName: AppData.userDefaultAccount['bank_account'],
      ),
      userBankInfoList: AppData.bankAccountData);
  await UserPreference.setUserData(userModel);
  userValue = await UserPreference.getUserPrefs();
}

onCheckSystemTheme() async {
  Brightness brightness = Brightness.light;
  if (brightness == Brightness.dark) {
    await UserPreference.setBrightnessInSharedPrefs(false);
    isLightMode = await UserPreference.getBrightnessFromSharedPrefs();
  } else if (brightness == Brightness.light) {
    await UserPreference.setBrightnessInSharedPrefs(true);
    isLightMode = await UserPreference.getBrightnessFromSharedPrefs();
  }
}
