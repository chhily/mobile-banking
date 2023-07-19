import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/config/app_config/app_config.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/util/helper.dart';
import 'package:ui_practice/util/ui_helper.dart';
import 'package:ui_practice/view/home/widget/usability_widget.dart';
import 'package:ui_practice/view/transfer_page/transfer_page.dart';

class AccountSummary extends StatelessWidget {
  final bool isLightMode;
  const AccountSummary({super.key, required this.isLightMode});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _accountSummary(),
        VerticalSpace.hugeSpace,
        UsabilityWidget(
          isLightMode: isLightMode,
          onFavorite: () {},
          onNavAccount: () {},
          onNavCard: () {
          },
          onNavPayment: () {},
          onScanQR: () {},
          onSendTransaction: () {
            AppHelper.onShowPinPasscode(
                context: context, navPage: const TransferPage());
          },
        ),
      ],
    );
  }

  Color? themColor(bool isLightMode) {
    if (isLightMode) {
      return AppColor.white;
    } else {
      return AppColor.white;
    }
  }

  Widget _accountSummary() {
    return UIHelper.cardHelper(
      color: isLightMode ? AppColor.midNightBlue : AppColor.darkPrimary,
      childWidget: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.currencyTextHelper(
                price: userValue?.userDefaultAccount?.totalAmount ?? 0,
                fontWeight: FontWeight.bold,
                iconColor: themColor(isLightMode),
                textSize: FontSize.fontSizeTitle,
                textColor: themColor(isLightMode),
                currencySymbol:
                    userValue?.userDefaultAccount?.currencySymbol ?? "N/A"),
            VerticalSpace.smallSpace,
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: isLightMode
                        ? AppColor.lightPrimaryColor
                        : AppColor.midNightBlue,
                    borderRadius: AppBorderRadius.circularBorderRadius,
                  ),
                  child: UIHelper.textHelper(
                      text: "Default",
                      textSize: FontSize.fontSizeMedium,
                      textColor: AppColor.white),
                ),
                HorizontalSpace.smallSpace,
                UIHelper.textHelper(
                    text: userValue?.userBankAccountNumber ?? "N/A",
                    textColor: themColor(isLightMode),
                    textSize: FontSize.fontSizeMedium)
              ],
            ),
            VerticalSpace.regularSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.arrow_down_left_circle,
                      color: AppColor.successColor,
                    ),
                    HorizontalSpace.smallSpace,
                    UIHelper.textHelper(
                      text: "Receive Money",
                      fontWeight: FontWeight.bold,
                      textColor: themColor(isLightMode),
                    )
                  ],
                ),
                HorizontalSpace.hugeSpace,
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.arrow_up_right_circle,
                      color: AppColor.errorColor,
                    ),
                    HorizontalSpace.smallSpace,
                    UIHelper.textHelper(
                      text: "Send Money",
                      fontWeight: FontWeight.bold,
                      textColor: themColor(isLightMode),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
