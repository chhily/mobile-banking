import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_practice/app_management/app_state_provider.dart';
import 'package:ui_practice/config/app_config/app_config.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/util/ui_helper.dart';
import 'package:ui_practice/view/qr_code/widget/bottom_sheet_widget.dart';
import 'package:ui_practice/view/qr_code/widget/qr_widget.dart';
import 'package:ui_practice/view/qr_code/widget/utility_widget.dart';

import '../../model/user_model.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({super.key});

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  AppAccountSelected appAccountSelected =
      AppAccountSelected(userValue?.userDefaultAccount);

  final selectedProvider = StateProvider<int>((ref) {
    return 0;
  });

  final amountProvider = StateProvider.autoDispose<String>((ref) => "0");

  String? displayCode;

  late TextEditingController amountTC;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appAccountSelected.onInitializeData(userValue?.userDefaultAccount);
    amountTC = TextEditingController(text: "0");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    appAccountSelected.dispose();
    amountTC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
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
                      Consumer(
                        builder: (context, ref, child) {
                          final amountValue = ref.watch(amountProvider);
                          return Column(
                            children: [
                              QRWidget(
                                bankData: valueNotifier,
                                amountReceive: num.parse(amountValue),
                              ),
                              VerticalSpace.regularSpace,
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: AppColor.darkPrimary,
                                    builder: (context) {
                                      return Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12),
                                              decoration: BoxDecoration(
                                                  borderRadius: AppBorderRadius
                                                      .circularBorderRadius,
                                                  color: AppColor
                                                      .backgroundPrimary),
                                              width: 40,
                                              height: 8,
                                            ),
                                          ),
                                          UIHelper.textHelper(
                                              text: "Enter amount",
                                              textSize: FontSize.fontSizeTitle),
                                          VerticalSpace.regularSpace,
                                          UIHelper.underlineTextField(
                                            cursorColor: AppColor.white,
                                            textEditingController: amountTC,
                                            onFieldSubmitted: (value) {
                                              Navigator.of(context).pop();
                                              ref
                                                  .read(amountProvider.notifier)
                                                  .state = value;
                                            },
                                            autofocus: true,
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                                borderRadius:
                                    AppBorderRadius.circularBorderRadius,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: AppColor.backgroundPrimary
                                          .withOpacity(0.2),
                                      borderRadius:
                                          AppBorderRadius.circularBorderRadius),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                              ),
                            ],
                          );
                        },
                      ),
                      GestureDetector(
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
                      UtilityWidget(bankData: valueNotifier),
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

  _selectionSheet(
      {required void Function(UserDefaultAccount? bankData)? onTap}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return UIHelper.draggableBottomSheet(
          context: context,
          builder: (BuildContext context, ScrollController scrollController) {
            return SourceAccountBottomSheet(
              selectedProvider: selectedProvider,
              onTap: onTap,
              scrollController: scrollController,
            );
          },
        );
      },
    );
  }

}
