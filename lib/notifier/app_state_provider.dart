import 'package:flutter/material.dart';

import '../util/helper.dart';

class AppStateNotifier extends ValueNotifier<bool> {
  AppStateNotifier(super.value);
  void onChangeValue(bool newValue) {
    value = newValue;
    isLightMode = newValue;
  }
}

class AppScrollState extends ValueNotifier<bool> {
  AppScrollState(super.value);
  bool isVisible = true;

  void onChangeValue(bool newValue) {
    value = newValue;
  }
}
