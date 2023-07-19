import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_practice/constant/app_font_size.dart';

class AppColor {
  static const Color backgroundPrimary = Color(0xFFF5F5FA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightSecondary = Color(0xFF145DA0);
  static const Color lightPrimaryColor = Color(0xFF2E8BC0);
  static const Color warnColor = Color(0xFFF57A01);
  static const Color successColor = Color(0xFF388E3D);
  static const Color purpleAccent = Color(0xFF1D2869);
  static const Color contentDisable = Color(0xFF717171);
  static const Color backgroundInfo = Color(0xFFB8B8B8);
  static const Color errorColor = Color(0xFFEF5350);
  static const Color accentYellow = Color(0xFFFBC02D);
  static const Color black = Color(0xFF000000);

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
        return lightSecondary;
    }
  }

  static const Color darkPrimary = Color(0xFF0C2D48);
  static const Color darkSecondary = Color(0xFF0074B7);
  static const Color midNightBlue = Color(0xFF145DA0);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 0,
      titleTextStyle: GoogleFonts.quicksand(
        fontSize: FontSize.fontSizeTitle,
        color: Colors.black,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light,
      ),
    ),
    splashFactory: InkSparkle.splashFactory,
    splashColor: AppColor.lightPrimaryColor.withOpacity(0.5),
    actionIconTheme: ActionIconThemeData(
      closeButtonIconBuilder: (context) {
        return const Icon(Icons.close_outlined);
      },
      // backButtonIconBuilder: (context) {
      //   return Icon(
      //     Icons.arrow_back
      //   );
      // },
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColor.white,
        iconTheme: MaterialStateProperty.resolveWith((states) {
          // If the button is pressed, return size 40, otherwise 20
          if (states.contains(MaterialState.pressed)) {
            return const IconThemeData(size: 32);
          }
          return const IconThemeData(size: 24);
        }),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        indicatorColor: AppColor.lightSecondary,
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          // If the button is pressed, return size 40, otherwise 20
          if (states.contains(MaterialState.pressed)) {
            return GoogleFonts.quicksand(fontSize: FontSize.fontSizeTitle);
          }
          return GoogleFonts.quicksand(fontSize: FontSize.fontSizeRegular);
        })),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.backgroundPrimary,
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
            primary: AppColor.white,
            secondary: AppColor.lightSecondary,
            background: AppColor.lightSecondary,
            surfaceTint: AppColor.white)
        .copyWith(background: AppColor.backgroundPrimary),
    dialogBackgroundColor: AppColor.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColor.midNightBlue,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 0,
      titleTextStyle: GoogleFonts.quicksand(
        fontSize: FontSize.fontSizeTitle,
        color: Colors.white,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // For Android (light icons)
        statusBarBrightness: Brightness.dark,
      ),
    ),
    splashFactory: InkSparkle.splashFactory,
    splashColor: AppColor.lightPrimaryColor.withOpacity(0.5),
    actionIconTheme: ActionIconThemeData(
      closeButtonIconBuilder: (context) {
        return const Icon(Icons.close_outlined);
      },
      backButtonIconBuilder: (context) {
        return const Icon(
          Icons.arrow_back,
          color: AppColor.white,
        );
      },
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColor.darkPrimary,
        iconTheme: MaterialStateProperty.resolveWith((states) {
          // If the button is pressed, return size 40, otherwise 20
          if (states.contains(MaterialState.pressed)) {
            return const IconThemeData(size: 32);
          }
          return const IconThemeData(size: 24);
        }),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        indicatorColor: AppColor.lightSecondary,
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          // If the button is pressed, return size 40, otherwise 20
          if (states.contains(MaterialState.pressed)) {
            return GoogleFonts.quicksand(fontSize: FontSize.fontSizeTitle);
          }
          return GoogleFonts.quicksand(fontSize: FontSize.fontSizeRegular);
        })),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      elevation: 0,
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: GoogleFonts.quicksand(
            color: AppColor.white,
          ),
          bodyMedium: GoogleFonts.quicksand(
            color: AppColor.white,
          ),
          bodySmall: GoogleFonts.quicksand(
            color: AppColor.white,
          ),
        ),
    iconTheme: const IconThemeData(
      color: AppColor.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColor.midNightBlue,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.darkSecondary,
    ),
    dialogBackgroundColor: AppColor.white,
    cardTheme: const CardTheme(color: AppColor.darkPrimary),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
            primary: AppColor.darkPrimary,
            secondary: AppColor.lightSecondary,
            background: AppColor.darkPrimary,
            surfaceTint: Colors.black)
        .copyWith(background: AppColor.darkPrimary),
  );
}
