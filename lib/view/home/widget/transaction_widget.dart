import 'package:flutter/material.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_data.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/util/ui_helper.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
          thickness: 1, color: AppColor.lightSecondary.withOpacity(0.1)),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      itemCount: AppData.transactions.length,
      itemBuilder: (context, index) {
        final transactionData = AppData.transactions.elementAt(index);
        return InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          AppColor.transactionColor(transactionData['category'])
                              .withOpacity(0.5),
                      child: Icon(transactionData['icon'],
                          color: AppColor.transactionColor(
                              transactionData['category'])),
                    ),
                    HorizontalSpace.regularSpace,
                    UIHelper.textHelper(
                      text: transactionData['category'],
                      textColor: AppColor.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UIHelper.currencyTextHelper(
                        price: transactionData['amount'],
                        iconColor: AppColor.transactionColor(
                            transactionData['category']),
                        textColor: AppColor.transactionColor(
                            transactionData['category']),
                        currencySymbol: transactionData['currency'],
                        fontWeight: FontWeight.bold,
                        textSize: FontSize.fontSizeBigRegular),
                    HorizontalSpace.smallSpace,
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: AppColor.white,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
