import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/config/app_config/app_config.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/util/ui_helper.dart';

import '../../../constant/app_space.dart';

class UsabilityWidget extends StatelessWidget {
  final void Function()? onNavAccount;
  final void Function()? onNavCard;
  final void Function()? onNavPayment;
  final void Function()? onSendTransaction;
  final void Function()? onScanQR;
  final void Function()? onFavorite;
  final bool isLightMode;

  const UsabilityWidget(
      {super.key,
      this.onNavAccount,
      this.onNavCard,
      this.onNavPayment,
      this.onSendTransaction,
      this.onScanQR,
      this.onFavorite,
      required this.isLightMode});

  @override
  Widget build(BuildContext context) {
    return UIHelper.cardHelper(
      color: isLightMode
          ? AppColor.primaryColor
          : AppColor.darkPrimary.withOpacity(0.5),
      childWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _upperRow(
                onNavAccount: onNavAccount,
                onNavCard: onNavCard,
                onNavPayment: onNavPayment),
            VerticalSpace.regularSpace,
            _downRow(
                onSendTransaction: onSendTransaction,
                onFavorite: onFavorite,
                onScanQR: onScanQR),
          ],
        ),
      ),
    );
  }

  Widget _upperRow(
      {void Function()? onNavAccount,
      void Function()? onNavCard,
      void Function()? onNavPayment}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _cardWidget(
            icon: Icons.account_balance_wallet_rounded,
            iconColor: AppColor.white,
            onTap: onNavAccount,
            text: "Accounts"),
        _cardWidget(
            icon: CupertinoIcons.creditcard_fill,
            iconColor: AppColor.white,
            onTap: onNavCard,
            text: "Cards"),
        _cardWidget(
            icon: Icons.monetization_on_rounded,
            iconColor: AppColor.white,
            onTap: onNavPayment,
            text: "Payments"),
      ],
    );
  }

  Widget _downRow(
      {void Function()? onSendTransaction,
      void Function()? onScanQR,
      void Function()? onFavorite}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _cardWidget(
            icon: CupertinoIcons.qrcode_viewfinder,
            iconColor: AppColor.white,
            onTap: onScanQR,
            text: "Scan"),
        _cardWidget(
            icon: CupertinoIcons.square_favorites_alt_fill,
            iconColor: AppColor.white,
            onTap: onFavorite,
            text: "Favorites"),
        _cardWidget(
            icon: CupertinoIcons.arrow_right_arrow_left_square_fill,
            iconColor: AppColor.white,
            onTap: onSendTransaction,
            text: "Transfers"),
      ],
    );
  }

  Widget _cardWidget(
      {required IconData icon,
      required Color iconColor,
      void Function()? onTap,
      required String text}) {
    return UIHelper.cardHelper(
      color: isLightMode ? AppColor.midNightBlue : AppColor.darkPrimary,
      childWidget: Material(
        color: Colors.transparent,
        child: InkWell(
          splashFactory: InkSparkle.splashFactory,
          splashColor: AppColor.darkPrimary.withOpacity(0.5),
          onTap: onTap,
          borderRadius: AppBorderRadius.circularBorderRadius,
          child: Container(
            width: 100,
            height: 80,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, color: iconColor),
                VerticalSpace.smallSpace,
                UIHelper.textHelper(text: text, textColor: AppColor.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
