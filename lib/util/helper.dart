import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/view/passcode/pin_passcode.dart';

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
      return [AppColor.midNightBlue, AppColor.darkPrimary];
    }
  }

  static void onShowPinPasscode(
      {required BuildContext context, required Widget navPage}) {
    showGeneralDialog(
      context: context,
      barrierColor: AppColor.darkPrimary,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return PinPasscodePage(
          navPage: navPage,
        );
      },
    );
  }

  static Color randomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  static String assetString(String value) {
    return "assets/images/$value.JPG";
  }
}
