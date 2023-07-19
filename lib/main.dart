import 'package:flutter/material.dart';
import 'package:ui_practice/bottom_nav/bottom_nav.dart';
import 'package:ui_practice/constant/app_color.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routes: {'home': (context) => const MyBottomNavigation()},
      home: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: const MyBottomNavigation()),
    );
  }
}
