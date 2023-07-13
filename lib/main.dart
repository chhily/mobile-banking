import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_practice/bottom_nav/bottom_nav.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0,
          titleTextStyle: GoogleFonts.quicksand(
            fontSize: FontSize.fontSizeBig,
            color: Colors.black,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AppColor.white,
            secondary: AppColor.secondary,
            background: AppColor.secondary,
            surfaceTint: AppColor.white),
        actionIconTheme: ActionIconThemeData(
          closeButtonIconBuilder: (context) {
            return const Icon(Icons.close_outlined);
          },
          backButtonIconBuilder: (context) {
            return const Icon(Icons.arrow_back_ios);
          },
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColor.backgroundPrimary,
          elevation: 0,
        ),
      ),
      home: const MyBottomNavigation(),
    );
  }
}
