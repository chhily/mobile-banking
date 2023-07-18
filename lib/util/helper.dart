import 'package:flutter/material.dart';
import 'package:ui_practice/constant/app_color.dart';

bool isLightMode = true;

class AppHelper {
  static void onPopBack(BuildContext context) {
    if (!context.mounted) return;
    Navigator.of(context).pop();
  }

  static List<Color> onChangeTheme({required bool isLightMode}) {
    if (isLightMode) {
      return [AppColor.primaryColor, AppColor.secondary];
    } else {
      return [AppColor.darkPrimary, AppColor.darkSecondary];
    }
  }

  static Color onChangeBackgroundColor({required bool isLightMode}) {
    if (isLightMode) {
      return AppColor.babyBlue;
    } else {
      return AppColor.darkPrimary;
    }
  }

  static Color onChangeCardColor ({required bool isLightMode }){
    if (isLightMode) {
      return AppColor.backgroundPrimary;
    } else {
      return AppColor.backgroundPrimary;
    }
  }

  static Color? textColor(bool isLightMode) {
    if (isLightMode) {
      return Colors.black;
    } else {
      return AppColor.white;
    }
  }
}
