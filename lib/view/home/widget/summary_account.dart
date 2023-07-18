import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/config/app_config/app_config.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/constant/app_color.dart';
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
  ValueNotifier<UserModel?> userModelNotifier = ValueNotifier(UserModel());
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    onInitValue();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    userModelNotifier.dispose();
    super.dispose();
  }

  onInitValue() async {
    userModelNotifier.value = userValue;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: userModelNotifier,
      builder: (context, userValue, child) {
        return Column(
          children: [
            VerticalSpace.hugeSpace,
            _currencyDropDown(userValue: userValue),
            VerticalSpace.regularSpace,
            UIHelper.currencyTextHelper(
                price: userValue?.userDefaultAccount?.totalAmount ?? 0,
                mainAxisAlignment: MainAxisAlignment.center,
                currencySymbol:
                    userValue?.userDefaultAccount?.currencySymbol ?? "N/A",
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
      },
    );
  }

  Widget _currencyDropDown({UserModel? userValue}) {
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
                        itemCount: userValue?.userBankInfoList?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          final accountData =
                              userValue?.userBankInfoList?.elementAt(index);
                          return ListTile(
                            title: UIHelper.textHelper(
                                text: accountData?.currencyName ?? "N/A"),
                            onTap: () {
                              if (accountData == null) {
                                return;
                              } else {
                                userModelNotifier.value = UserModel(

                                    // totalAmount: accountData?.totalAmount,
                                    // currencyName: accountData?.currencyName,
                                    // currencySymbol: accountData?.currencySymbol,
                                    );
                                // Update the selected currency.
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
                      margin: const EdgeInsets.all(10),
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
              text: 'N/A',
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
