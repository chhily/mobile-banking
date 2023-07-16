import 'package:flutter/animation.dart';

class AppColor {
  static const Color backgroundPrimary = Color(0xFFF5F5FA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFF1A94FF);
  static const Color primaryColor = Color(0xFF304FFE);
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
}
