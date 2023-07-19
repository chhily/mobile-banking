import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/util/helper.dart';
import 'package:ui_practice/util/ui_helper.dart';
import 'package:ui_practice/view/home/widget/summary_account.dart';
import 'package:ui_practice/view/home/widget/transaction_widget.dart';
import 'package:ui_practice/view/profile/profile_page.dart';
import 'package:ui_practice/view/qr_code/qr_code.dart';

class MyAppHomePage extends StatefulWidget {
  const MyAppHomePage({super.key});

  @override
  State<MyAppHomePage> createState() => _MyAppHomePageState();
}

class _MyAppHomePageState extends State<MyAppHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppHelper.onChangeTheme(isLightMode: isLightMode),
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    HorizontalSpace.bigSpace,
                    IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.comfortable,
                      onPressed: () {},
                      icon:
                          const Icon(CupertinoIcons.bell, color: Colors.white),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.comfortable,
                      onPressed: () {
                        showGeneralDialog(
                          context: context,
                          barrierColor: Colors.black87,
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return QrCodePage();
                          },
                        );
                      },
                      icon: const Icon(CupertinoIcons.qrcode,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                children: [
                  _buildUserProfile(),
                  VerticalSpace.regularSpace,
                  AccountSummary(isLightMode: isLightMode),
                  _transactionWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserProfile() {
    return GestureDetector(
      onTap: () {
        AppHelper.onShowPinPasscode(
            context: context, navPage: const ProfileInfoPage());
      },
      child: Row(
        children: [
          UIHelper.imageAvatarHelper(userValue?.userProfile ?? ''),
          HorizontalSpace.regularSpace,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.textHelper(
                    text: userValue?.userName ?? '',
                    fontWeight: FontWeight.bold,
                    textSize: FontSize.fontSizeBigRegular,
                    textColor: AppColor.white),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UIHelper.textHelper(
                        text: "View Profile",
                        textSize: FontSize.fontSizeMedium,
                        textColor: AppColor.white),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 10,
                      color: AppColor.white,
                    )
                  ],
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                isLightMode = !isLightMode;
                setState(() {});
              },
              icon: Icon(
                isLightMode
                    ? Icons.light_mode_rounded
                    : Icons.dark_mode_rounded,
                color: AppColor.accentYellow,
              )),
        ],
      ),
    );
  }

  Widget _headerWidget() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              UIHelper.imageAvatarHelper(userValue?.userProfile ?? ''),
              HorizontalSpace.regularSpace,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.textHelper(
                      text: userValue?.userName ?? '',
                      fontWeight: FontWeight.bold,
                      textSize: FontSize.fontSizeBigRegular,
                      textColor: AppColor.white),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UIHelper.textHelper(
                          text: "View Profile",
                          textSize: FontSize.fontSizeMedium,
                          textColor: AppColor.white),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 10,
                        color: AppColor.white,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        HorizontalSpace.bigSpace,
        const Icon(CupertinoIcons.bell, color: Colors.white),
        HorizontalSpace.bigSpace,
        const Icon(CupertinoIcons.qrcode, color: Colors.white),
      ],
    );
  }

  Widget _transactionWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UIHelper.textHelper(
                text: "Transaction",
                textSize: FontSize.fontSizeTitle,
                textColor: AppColor.white,
                fontWeight: FontWeight.bold),
            IconButton(
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward,
                  color: AppColor.white,
                )),
          ],
        ),
        UIHelper.cardHelper(
          childWidget: const TransactionWidget(),
        )
      ],
    );
  }
}
