import 'package:flutter/material.dart';
import 'package:ui_practice/config/flavor/flavor_config.dart';
import 'package:ui_practice/main.dart';

void main() async {
  initialBaseUrl();
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(flavor: Flavor.dev, values: FlavorValues(appName: "DEV"));
  runApp(const MyApp());

}

initialBaseUrl() {}
