import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_practice/config/app_config/app_config.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/notifier/app_state_provider.dart';
import 'package:ui_practice/util/helper.dart';
import 'package:ui_practice/util/ui_helper.dart';
import 'package:ui_practice/widget/dash_divider.dart';

import '../../model/user_model.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({super.key});

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  AppAccountSelected appAccountSelected =
      AppAccountSelected(userValue?.userDefaultAccount);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appAccountSelected.onInitializeData(userValue?.userDefaultAccount);

    print("useralue ${userValue?.userDefaultAccount?.qrCode}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ValueListenableBuilder<UserDefaultAccount?>(
          valueListenable: appAccountSelected,
          builder: (context, valueNotifier, child) {
            return SafeArea(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _headerWidget(),
                      _qrWidget(valueNotifier),
                      VerticalSpace.regularSpace,
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: AppColor.backgroundPrimary.withOpacity(0.2),
                            borderRadius: AppBorderRadius.circularBorderRadius),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(CupertinoIcons.add_circled,
                                color: AppColor.lightPrimaryColor),
                            HorizontalSpace.smallSpace,
                            UIHelper.textHelper(
                                text: "ADD AMOUNT",
                                textColor: AppColor.lightPrimaryColor,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _selectionSheet(
                            onTap: (selectValue) {
                              Navigator.of(context).pop();
                              appAccountSelected.value = selectValue;
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              UIHelper.textHelper(
                                  text: "Receive to:",
                                  textColor: AppColor.white,
                                  textSize: FontSize.fontSizeMedium),
                              HorizontalSpace.smallSpace,
                              UIHelper.textHelper(
                                  text:
                                      "${valueNotifier?.userBankAccountNumber}",
                                  textSize: FontSize.fontSizeMedium,
                                  textColor: AppColor.lightPrimaryColor,
                                  fontWeight: FontWeight.bold),
                              HorizontalSpace.smallSpace,
                              UIHelper.verticalDivider(
                                  height: 10,
                                  color: AppColor.lightPrimaryColor),
                              HorizontalSpace.smallSpace,
                              UIHelper.textHelper(
                                  text:
                                      "${userValue?.userDefaultAccount?.currencySymbol}",
                                  textSize: FontSize.fontSizeMedium,
                                  textColor: AppColor.lightPrimaryColor,
                                  fontWeight: FontWeight.bold),
                              const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 16,
                                color: AppColor.lightPrimaryColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      VerticalSpace.regularSpace,
                      _utilityWidget(valueNotifier),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Column(
      children: [
        UIHelper.textHelper(
            text: "MY QR",
            textSize: FontSize.fontSizeSuperHuge,
            textColor: AppColor.white,
            fontWeight: FontWeight.bold),
        VerticalSpace.regularSpace,
        SizedBox(
          width: 200,
          child: UIHelper.textHelper(
              textAlign: TextAlign.center,
              textColor: AppColor.white,
              text: "Show this QR to receive money from others"),
        ),
        VerticalSpace.bigSpace,
      ],
    );
  }

  Widget _utilityWidget(UserDefaultAccount? bankData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIcon(
            onPressed: () {},
            iconData: CupertinoIcons.arrow_down_square,
            title: "Download"),
        _buildIcon(
            onPressed: () {},
            iconData: Icons.fit_screen_outlined,
            title: "Screenshot"),
        _buildIcon(
            onPressed: () {
              UIHelper.snackBarHelper(context: context);
              Clipboard.setData(ClipboardData(text: "${bankData?.link}"));
              // Navigator.pop(context);
            },
            iconData: CupertinoIcons.link,
            title: "Share Link"),
      ],
    );
  }

  Widget _buildIcon(
      {IconData? iconData,
      required String title,
      required void Function()? onPressed}) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: CircleAvatar(
            backgroundColor: AppColor.backgroundPrimary.withOpacity(0.2),
            child: Icon(iconData, size: 20),
          ),
        ),
        UIHelper.textHelper(
          text: title,
          textSize: FontSize.fontSizeMedium,
          textColor: AppColor.white,
        )
      ],
    );
  }

  Widget _qrWidget(UserDefaultAccount? bankData) {
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
                  text: "${userValue?.userName}",
                  fontWeight: FontWeight.bold,
                  textColor: AppColor.white,
                ),
                UIHelper.currencyTextHelper(
                    price: bankData?.totalAmount ?? 0,
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
                image: AssetImage(
                  bankData?.qrCode ?? '',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _selectionSheet(
      {required void Function(UserDefaultAccount? bankData)? onTap}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return UIHelper.draggableBottomSheet(
          initialChildSize: 0.7,
          minChildSize: 0.7,
          maxChildSize: 1,
          context: context,
          builder: (context, scrollController) {
            return UIHelper.cardHelper(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              childWidget: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                            borderRadius: AppBorderRadius.circularBorderRadius,
                            color: AppColor.backgroundPrimary),
                        width: 40,
                        height: 8,
                      ),
                    ),
                    VerticalSpace.hugeSpace,
                    UIHelper.textHelper(
                        text: "Select source account:",
                        fontWeight: FontWeight.bold,
                        textSize: FontSize.fontSizeBigRegular),
                    VerticalSpace.smallSpace,
                    Expanded(
                      child:
                          _buildSelectedOption(scrollController, onTap: onTap),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSelectedOption(ScrollController? controller,
      {required void Function(UserDefaultAccount? bankData)? onTap}) {
    return ListView.separated(
      separatorBuilder: (context, index) => VerticalSpace.mediumSpace,
      controller: controller,
      itemCount: userValue?.userBankInfoList?.length ?? 0,
      itemBuilder: (context, index) {
        final itemValue = userValue?.userBankInfoList?.elementAt(index);
        final bankData = itemValue?.userDefaultAccount;
        return UIHelper.cardHelper(
          color: AppColor.backgroundPrimary.withOpacity(0.2),
          childWidget: InkWell(
            onTap: () {
              onTap!(bankData);
            },
            borderRadius: AppBorderRadius.circularBorderRadius,
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12)),
                      color: AppHelper.randomColor()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIHelper.textHelper(text: "${itemValue?.accountType}"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UIHelper.textHelper(
                              text: "${bankData?.userBankAccountNumber}"),
                          HorizontalSpace.smallSpace,
                          UIHelper.verticalDivider(
                              height: 10, color: AppColor.lightPrimaryColor),
                          HorizontalSpace.smallSpace,
                          UIHelper.textHelper(
                              text: "${bankData?.currencySymbol}",
                              textSize: FontSize.fontSizeMedium,
                              textColor: AppColor.lightPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
