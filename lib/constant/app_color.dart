import 'package:flutter/animation.dart';

class AppColor {
  static const Color backgroundPrimary = Color(0xFFF5F5FA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFF145DA0);
  static const Color primaryColor = Color(0xFF2E8BC0);
  static const Color warnColor = Color(0xFFF57A01);
  static const Color successColor = Color(0xFF388E3D);
  static const Color purpleAccent = Color(0xFF1D2869);
  static const Color contentDisable = Color(0xFF717171);
  static const Color backgroundInfo = Color(0xFFB8B8B8);
  static const Color errorColor = Color(0xFFEF5350);
  static const Color accentYellow = Color(0xFFFBC02D);

  static Color transactionColor(String transactionType) {
    switch (transactionType) {
      case "Spending":
        return const Color(0xFFFFA525);
      case "Income":
        return successColor;
      case "Bills":
        return errorColor;
      case "Savings":
        return accentYellow;
      default:
        return secondary;
    }
  }

  static const Color darkPrimary = Color(0xFF0C2D48);
  static const Color darkSecondary = Color(0xFF0074B7);
  static const Color darkBackgroundPrimary = Color(0xFF2E8BC0);
  static const Color midNightBlue = Color(0xFF145DA0);

  static const Color babyBlue = Color(0xFFBFD7ED);
}
