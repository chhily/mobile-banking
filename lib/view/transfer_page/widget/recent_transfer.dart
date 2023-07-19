import 'package:flutter/material.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_data.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/model/transfer_model.dart';
import 'package:ui_practice/util/ui_helper.dart';
import 'package:ui_practice/view/transfer_page/widget/transfer_process.dart';

class RecentTransferWidget extends StatelessWidget {
  final ScrollController? controller;

  const RecentTransferWidget(
      {super.key, required this.transferData, this.controller});
  final List<TransferModel> transferData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
        separatorBuilder: (context, index) => VerticalSpace.smallSpace,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final transferValue = transferData.elementAt(index);
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TransferProcessPage(transferValue: transferValue),
                  ));
            },
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: Row(
                children: [
                  UIHelper.imageAvatarHelper(transferValue.receiverImage),
                  HorizontalSpace.regularSpace,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIHelper.textHelper(
                          text: transferValue.receiverName,
                        ),
                        VerticalSpace.smallSpace,
                        UIHelper.textHelper(
                            text: transferValue.bankNumber ?? 'N/A',
                            fontWeight: FontWeight.bold,
                            textSize: FontSize.fontSizeMedium),
                      ],
                    ),
                  ),
                  UIHelper.currencyTextHelper(
                      price: transferValue.receiverMoney,
                      currencySymbol: transferValue.receiverCurrencySymbol,
                      iconColor: AppColor.errorColor,
                      textColor: AppColor.errorColor),
                ],
              ),
            ),
          );
        },
        itemCount: AppData.transferData.length);
  }
}
