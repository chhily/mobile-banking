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
      return [AppColor.lightPrimaryColor, AppColor.lightSecondary];
    } else {
      return [AppColor.darkPrimary, AppColor.darkSecondary];
    }
  }
}
