import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/constant/app_data.dart';
import 'package:ui_practice/model/user_model.dart';

import '../../constant/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserModel? userModel;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    initialization();
  }

  void initialization() async {
    // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    userModel = UserModel(
        // totalAmount: AppData.userBankAccount[0]['amount'],
        // currencyName: AppData.userBankAccount[0]['currency_name'],
        // currencySymbol: AppData.userBankAccount[0]['symbol'],
        userName: AppData.userInfo['username'],
        userBankAccountNumber: AppData.userInfo['bank_number'],
        userBankAccountName: AppData.userInfo['bank_account'],
        userProfile: AppData.userInfo['user_profile'],
        userBankInfoList: AppData.bankAccountData);
    print("userBank ${userModel?.userBankInfoList?.length}");
    await Future.delayed(const Duration(seconds: 3));
    // UserPreference.setUserData(userModel);
    userValue = await UserPreference.getUserPrefs();
    // FlutterNativeSplash.remove();
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.backgroundPrimary,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(40),
      child: Image.asset(
        "assets/images/splash_screen.png",
      ),
    );
  }
}
