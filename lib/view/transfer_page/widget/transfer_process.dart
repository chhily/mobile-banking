import 'package:flutter/material.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/util/ui_helper.dart';

class TransferProcessPage extends StatelessWidget {
  const TransferProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.textHelper(
                  text: 'Enter Amount',
                  fontWeight: FontWeight.bold,
                  textSize: FontSize.fontSizeTitle),
              VerticalSpace.regularSpace,
              UIHelper.textHelper(
                text: 'Select a Method for Sending Money',
              ),
              VerticalSpace.bigSpace,
              UIHelper.cardHelper(
                childWidget: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UIHelper.imageAvatarHelper('imageUrl',
                          height: 100, width: 100),
                      UIHelper.textHelper(
                          text: 'Receiver name',
                          textSize: FontSize.fontSizeBigRegular),
                      UIHelper.textHelper(
                          text: 'Receiver email',
                          textSize: FontSize.fontSizeMedium),
                      TextField()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
