import 'package:flutter/material.dart';

class AppHelper {
  static void onPopBack(BuildContext context) {
    if (!context.mounted) return;
    Navigator.of(context).pop();
  }
}
