import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ui_practice/config/flavor/flavor_config.dart';
import 'package:ui_practice/main.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  initialBaseUrl();
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(flavor: Flavor.dev, values: FlavorValues(appName: "DEV"));
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

initialBaseUrl() {}
