import 'package:flutter/material.dart';
import 'package:ui_practice/model/user_card_model.dart';
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
  }

  onChangeReceiveValue(UserDefaultAccount? receiveSelectValue) {
    this.receiveSelectValue = receiveSelectValue;
  }
}

class AppUserCardState extends ValueNotifier<UserCardModel?> {
  AppUserCardState(super.value);

  final List<UserCardModel> _userCard = [];

  List<UserCardModel> get userCard => _userCard;

  onAddNewCard(UserCardModel? cardValue) {
    if (cardValue == null) return;
    value = cardValue;
    _userCard.add(cardValue);
  }
}
