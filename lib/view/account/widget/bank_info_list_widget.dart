import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/config/app_config/app_config.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/util/ui_helper.dart';

class AccountInfoListWidget extends StatelessWidget {
  const AccountInfoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: userValue?.userBankInfoList?.length ?? 0,
      separatorBuilder: (context, index) => VerticalSpace.regularSpace,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      itemBuilder: (context, index) {
        final accountData = userValue?.userBankInfoList?.elementAt(index);
        final itemValue = accountData?.userDefaultAccount;
        return Stack(
          alignment: Alignment.topRight,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: UIHelper.cardHelper(
                elevation: 2,
                color: AppColor.darkPrimary,
                childWidget: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          UIHelper.textHelper(
                              text: itemValue?.accountType ?? "N/A",
                              textColor: AppColor.white),
                          UIHelper.textHelper(
                              text: itemValue?.userBankAccountNumber ?? "N/A",
                              textColor: AppColor.white),
                        ],
                      ),
                      VerticalSpace.mediumSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(CupertinoIcons.creditcard_fill),
                          UIHelper.currencyTextHelper(
                              price: itemValue?.totalAmount ?? 0,
                              currencySymbol: itemValue?.currencySymbol,
                              iconColor: AppColor.white,
                              textColor: AppColor.white)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: AppBorderRadius.circularBorderRadius,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: Icon(Icons.more_horiz_outlined),
              ),
            ),
          ],
        );
      },
    );
  }
}
