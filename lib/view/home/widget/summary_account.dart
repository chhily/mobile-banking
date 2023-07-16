import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/config/app_config/app_config.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_data.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/model/user_model.dart';
import 'package:ui_practice/util/ui_helper.dart';

class AccountSummary extends StatefulWidget {
  const AccountSummary({super.key});

  @override
  State<AccountSummary> createState() => _AccountSummaryState();
}

class _AccountSummaryState extends State<AccountSummary> {
  UserModel? userModel;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    userModel = UserModel(
      totalAmount: AppData.currencies[0]['amount'],
      currencyValue: AppData.currencies[0]['name'],
      currencySymbol: AppData.currencies[0]['symbol'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace.hugeSpace,
        _currencyDropDown(),
        VerticalSpace.regularSpace,
        UIHelper.currencyTextHelper(
            price: userModel?.totalAmount ?? 0,
            mainAxisAlignment: MainAxisAlignment.center,
            currencySymbol: userModel?.currencySymbol,
            iconColor: AppColor.white,
            textSize: FontSize.fontSizeSuperHuge,
            fontWeight: FontWeight.bold,
            textColor: AppColor.white),
        VerticalSpace.regularSpace,
        UIHelper.textHelper(
            text: "Available Balance", textColor: AppColor.white),
        VerticalSpace.regularSpace,
        OutlinedButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  CupertinoIcons.creditcard,
                  color: AppColor.white,
                  size: 16,
                ),
                HorizontalSpace.smallSpace,
                UIHelper.textHelper(
                    text: "Add Money", textColor: AppColor.white),
              ],
            )),
      ],
    );
  }

  Widget _currencyDropDown() {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return UIHelper.draggableBottomSheet(
              minChildSize: 0.3,
              initialChildSize: 0.3,
              context: context,
              builder: (context, scrollController) {
                return Stack(
                  alignment: Alignment.topCenter,
                  fit: StackFit.loose,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: AppColor.white,
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16))),
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: AppData.currencies.length,
                        itemBuilder: (BuildContext context, int index) {
                          final currencyData =
                          AppData.currencies.elementAt(index);
                          return ListTile(
                            title:
                            UIHelper.textHelper(text: currencyData['name']),
                            onTap: () {
                              if (currencyData.isEmpty) {
                                return;
                              } else {
                                setState(() {
                                  // Update the selected currency.
                                  userModel = UserModel(
                                    totalAmount: currencyData['amount'],
                                    currencyValue: currencyData['name'],
                                    currencySymbol: currencyData['symbol'],
                                  );
                                });
                              }
                              // Close the bottom sheet.
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 12,
                      decoration: BoxDecoration(
                          color: AppColor.secondary,
                          borderRadius: AppBorderRadius.circularBorderRadius),
                    )
                  ],
                );
              },
            );
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UIHelper.textHelper(
              text: userModel?.currencyValue ?? 'N/A',
              fontWeight: FontWeight.bold,
              textColor: Colors.white,
              textSize: FontSize.fontSizeBigRegular),
          HorizontalSpace.smallSpace,
          const Icon(CupertinoIcons.arrow_2_circlepath_circle,
              size: 14, color: Colors.white),
        ],
      ),
    );
  }
}
