import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_practice/config/app_config/app_config.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/util/ui_helper.dart';

final activateCardProvider = StateProvider<bool>((ref) {
  return false;
});

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_card_rounded),
      ),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              return Stack(
                children: [
                  _cardWidget(context),
                  _cardFilterWidget(context),
                ],
              );
            },
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UIHelper.textHelper(
                    text: "Card needs activation",
                    textSize: FontSize.fontSizeBigRegular,
                    textColor: AppColor.backgroundInfo),
                UIHelper.textHelper(
                    textAlign: TextAlign.center,
                    text:
                        "Please get your plastic card on hands and tap on card image above to activate it."),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardFilterWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          color: AppColor.contentDisable.withOpacity(0.99),
          borderRadius: AppBorderRadius.circularBorderRadius),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.contentDisable,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: AppColor.white,
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            child: const Icon(Icons.lock_outline_rounded, size: 50),
          ),
          VerticalSpace.regularSpace,
          UIHelper.textHelper(text: "Tap the icon to activate card")
        ],
      ),
    );
  }

  Widget _cardWidget(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: AppColor.midNightBlue,
            borderRadius: AppBorderRadius.circularBorderRadius),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.textHelper(
                text: "CAT BANK",
                textSize: FontSize.fontSizeBigRegular,
                fontWeight: FontWeight.bold),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.copyright_outlined, size: 8),
                HorizontalSpace.smallSpace,
                UIHelper.textHelper(
                    text: "CHHILY LIM", textSize: FontSize.fontSizeSmall),
              ],
            ),
            VerticalSpace.bigSpace,
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.sd_card_rounded,
                      size: 40, color: AppColor.accentYellow),
                  UIHelper.textHelper(
                      text: "XXX XXX XXX XXX",
                      fontWeight: FontWeight.bold,
                      textSize: FontSize.fontSizeTitle),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UIHelper.textHelper(
                    text:
                        "${userValue?.userDefaultAccount?.userBankAccountName}"),
                const Icon(
                  Icons.join_right_outlined,
                  color: Colors.redAccent,
                  size: 40,
                ),
              ],
            )
          ],
        ));
  }
}
