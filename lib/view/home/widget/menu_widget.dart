import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/config/app_config/app_config.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/util/ui_helper.dart';

import '../../../constant/app_space.dart';

class MenuWidget extends StatelessWidget {
  final void Function()? onNavAccount;
  final void Function()? onNavCard;
  final void Function()? onNavPayment;
  final void Function()? onSendTransaction;
  final void Function()? onScanQR;
  final void Function()? onFavorite;
  final bool isLightMode;

  const MenuWidget(
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
          ? AppColor.lightPrimaryColor
          : AppColor.darkPrimary.withOpacity(0.5),
      childWidget: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _upperRow(
                context: context,
                onNavAccount: onNavAccount,
                onNavCard: onNavCard,
                onNavPayment: onNavPayment),
            _downRow(
                context: context,
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
      required BuildContext context,
      void Function()? onNavPayment}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _cardWidget(
            icon: Icons.account_balance_wallet_rounded,
            iconColor: AppColor.white,
            onTap: onNavAccount,
            context: context,
            text: "Accounts"),
        _cardWidget(
            icon: CupertinoIcons.creditcard_fill,
            iconColor: AppColor.white,
            onTap: onNavCard,
            context: context,
            text: "Cards"),
        _cardWidget(
            icon: Icons.monetization_on_rounded,
            iconColor: AppColor.white,
            onTap: onNavPayment,
            context: context,
            text: "Payments"),
      ],
    );
  }

  Widget _downRow(
      {void Function()? onSendTransaction,
      void Function()? onScanQR,
      void Function()? onFavorite,
      required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _cardWidget(
            icon: CupertinoIcons.qrcode_viewfinder,
            iconColor: AppColor.white,
            onTap: onScanQR,
            context: context,
            text: "Scan"),
        _cardWidget(
            icon: CupertinoIcons.square_favorites_alt_fill,
            iconColor: AppColor.white,
            onTap: onFavorite,
            context: context,
            text: "Favorites"),
        _cardWidget(
            icon: CupertinoIcons.arrow_right_arrow_left_square_fill,
            iconColor: AppColor.white,
            onTap: onSendTransaction,
            context: context,
            text: "Transfers"),
      ],
    );
  }

  Widget _cardWidget(
      {required IconData icon,
      required Color iconColor,
      void Function()? onTap,
      required String text,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: UIHelper.cardHelper(
        color: isLightMode ? AppColor.midNightBlue : AppColor.darkPrimary,
        childWidget: InkWell(
          splashFactory: InkSparkle.splashFactory,
          splashColor: AppColor.darkPrimary.withOpacity(0.5),
          onTap: onTap,
          borderRadius: AppBorderRadius.circularBorderRadius,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.28,
            height: MediaQuery.of(context).size.height * 0.13,
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
