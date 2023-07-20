import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/notifier/app_state_provider.dart';
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

class _MyAppHomePageState extends State<MyAppHomePage>
    with WidgetsBindingObserver {
  AppStateNotifier appStateNotifier = AppStateNotifier(false);
  bool isVisible = true;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final systemBrightness = MediaQuery.of(context).platformBrightness;
    if (!mounted) return;
    if (systemBrightness.name == "dark") {
      appStateNotifier.onChangeValue(false);
    } else {
      appStateNotifier.onChangeValue(true);
    }
    super.didChangeDependencies();
  }

  // @override
  // void didChangePlatformBrightness() {
  //   final systemBrightness = MediaQuery.of(context).platformBrightness;
  //   if (!mounted) return;
  //   if (systemBrightness.name == "dark") {
  //     appStateNotifier.onChangeValue(true);
  //   } else {
  //     appStateNotifier.onChangeValue(false);
  //   }
  //   super.didChangePlatformBrightness();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<bool>(
        valueListenable: appStateNotifier,
        builder: (context, bool valueNotifier, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppHelper.onChangeTheme(isLightMode: valueNotifier),
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
                          icon: const Icon(CupertinoIcons.bell,
                              color: Colors.white),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.comfortable,
                          onPressed: () {
                            // Navigator.of(context).push(PageRouteBuilder(
                            //     opaque: false,
                            //     pageBuilder: (BuildContext context, _, __) =>
                            //         const QrCodePage()));
                            showGeneralDialog(
                              context: context,
                              barrierColor: Colors.black87,
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return const QrCodePage();
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
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    children: [
                      AnimatedSwitcher(
                          duration: const Duration(seconds: 2),
                          child: _buildUserProfile()),
                      VerticalSpace.regularSpace,
                      AccountSummary(isLightMode: isLightMode),
                      _transactionWidget(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
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
        ],
      ),
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
