import 'package:flutter/material.dart';
import 'package:ui_practice/config/flavor/flavor_config.dart';
import 'package:ui_practice/main.dart';

void main() async {
  initialBaseUrl();
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
      flavor: Flavor.production, values: FlavorValues(appName: "Production"));
  runApp(const MyApp());

}

initialBaseUrl() {}
