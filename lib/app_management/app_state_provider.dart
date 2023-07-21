import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_practice/model/user_model.dart';

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

class AppAccountSelected extends ValueNotifier<UserDefaultAccount?> {
  AppAccountSelected(super.value);
  num receiveAmount = 0;
  UserDefaultAccount? receiveValue;
  UserDefaultAccount? receiveSelectValue;

  onInitializeData(UserDefaultAccount? userValue) {
    value = userValue;
    receiveValue = userValue;
    print("value of select ${receiveValue?.userName}");
  }

  onChangeReceiveValue(UserDefaultAccount? receiveSelectValue) {
    this.receiveSelectValue = receiveSelectValue;
    print("selected $receiveSelectValue");
  }
}
//
// class AppValueSelected extends ChangeNotifier {
//
//   int? selected;
//
//   onChangeSelected(int index) {
//     value = index;
//     selected = index;
//   }
// }

