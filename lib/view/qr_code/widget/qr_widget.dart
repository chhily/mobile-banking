import 'package:flutter/material.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/model/user_model.dart';
import 'package:ui_practice/util/ui_helper.dart';
import 'package:ui_practice/widget/dash_divider.dart';

class QRWidget extends StatelessWidget {
  final UserDefaultAccount? bankData;
  final num amountReceive;
  const QRWidget({super.key, required this.bankData, required this.amountReceive});

  @override
  Widget build(BuildContext context) {
    return UIHelper.cardHelper(
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: AppColor.errorColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
            child: UIHelper.textHelper(
              text: "KHQR",
              textSize: FontSize.fontSizeHuge,
              textColor: AppColor.white,
            ),
          ),
          VerticalSpace.bigSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.textHelper(
                  text: "${bankData?.userName}",
                  fontWeight: FontWeight.bold,
                  textColor: AppColor.white,
                ),
                UIHelper.currencyTextHelper(
                    price: amountReceive,
                    currencySymbol: bankData?.currencySymbol,
                    textSize: FontSize.fontSizeHuge,
                    textColor: AppColor.white,
                    iconColor: AppColor.white,
                    fontWeight: FontWeight.bold),
              ],
            ),
          ),
          VerticalSpace.smallSpace,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            child: DashDivider(color: AppColor.white),
          ),
          VerticalSpace.smallSpace,
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              image: DecorationImage(
                image: AssetImage("${bankData?.qrCode}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
