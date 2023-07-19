import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/util/helper.dart';
import 'package:ui_practice/util/ui_helper.dart';

class PinPasscodePage extends StatefulWidget {
  final Widget navPage;
  const PinPasscodePage({super.key, required this.navPage});

  @override
  State<PinPasscodePage> createState() => _PinPasscodePageState();
}

class _PinPasscodePageState extends State<PinPasscodePage> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();
  _onPasscodeEntered(String enteredPasscode) async {
    bool isValid = '1111' == enteredPasscode;
    UIHelper.loadingDialogHelper(context);
    await Future.delayed(const Duration(seconds: 1)).whenComplete(() {
      _verificationNotifier.add(isValid);
      AppHelper.onPopBack(context);
    });
  }

  _onPasscodeCancelled() {
    Navigator.maybePop(context);
  }

  _isValidCallback() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return widget.navPage;
      },
    ));
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.darkPrimary,
      appBar: AppBar(
        leadingWidth: 80,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: UIHelper.textHelper(
              text: "Cancel",
              textSize: FontSize.fontSizeBigRegular,
              textColor: AppColor.white),
        ),
      ),
      body: PasscodeScreen(
          backgroundColor: AppColor.darkPrimary,
          cancelCallback: _onPasscodeCancelled,
          isValidCallback: _isValidCallback,
          title: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: AppColor.backgroundPrimary.withOpacity(0.2),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.lock_fill),
                    Icon(Icons.password_rounded),
                  ],
                ),
              ),
              VerticalSpace.regularSpace,
              UIHelper.textHelper(
                  text: "Enter PIN to login",
                  textColor: AppColor.white,
                  textSize: FontSize.fontSizeBigRegular),
            ],
          ),
          passwordDigits: 4,
          passwordEnteredCallback: _onPasscodeEntered,
          circleUIConfig: const CircleUIConfig(
              fillColor: AppColor.backgroundInfo,
              borderColor: AppColor.white,
              circleSize: 30),
          cancelButton: IconButton(
            icon: const Icon(CupertinoIcons.clear_circled_solid,
                color: AppColor.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          deleteButton:
              UIHelper.textHelper(text: 'Delete', textColor: AppColor.white),
          shouldTriggerVerification: _verificationNotifier.stream),
    );
  }
}
