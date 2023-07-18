import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/config/app_config/app_config.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/model/user_model.dart';
import 'package:ui_practice/util/ui_helper.dart';
import 'package:ui_practice/view/transfer_page/transfer_page.dart';

class AccountSummary extends StatefulWidget {
  const AccountSummary({super.key});

  @override
  State<AccountSummary> createState() => _AccountSummaryState();
}

class _AccountSummaryState extends State<AccountSummary> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace.hugeSpace,
        _accountSummary(),
        VerticalSpace.hugeSpace,
        _usabilityWidget(
          onSendTransaction: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const TransferPage();
              },
            ));
          },
        ),
      ],
    );
  }

  Widget _usabilityWidget(
      {void Function()? onNavAccount,
      void Function()? onNavCard,
      void Function()? onNavPayment,
      void Function()? onSendTransaction,
      void Function()? onScanQR,
      void Function()? onFavorite}) {
    return UIHelper.cardHelper(
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
      color: AppColor.secondary,
      childWidget: InkWell(
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
                                //
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
              text: userValue?.userDefaultAccount?.currencyName ?? "N/A",
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

  Widget _accountSummary() {
    return UIHelper.cardHelper(
      childWidget: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.currencyTextHelper(
                price: userValue?.userDefaultAccount?.totalAmount ?? 0,
                fontWeight: FontWeight.bold,
                textSize: FontSize.fontSizeTitle,
                currencySymbol:
                    userValue?.userDefaultAccount?.currencySymbol ?? "N/A"),
            VerticalSpace.smallSpace,
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColor.secondary,
                    borderRadius: AppBorderRadius.circularBorderRadius,
                  ),
                  child: UIHelper.textHelper(
                      text: "Default",
                      textSize: FontSize.fontSizeMedium,
                      textColor: AppColor.white),
                ),
                HorizontalSpace.smallSpace,
                UIHelper.textHelper(
                    text: userValue?.userBankAccountName ?? "N/A",
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
                        text: "Receive Money", fontWeight: FontWeight.bold)
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
                        text: "Send Money", fontWeight: FontWeight.bold)
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
