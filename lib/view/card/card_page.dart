import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_practice/app_management/app_state_provider.dart';
import 'package:ui_practice/config/app_config/app_config.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/model/user_card_model.dart';
import 'package:ui_practice/util/helper.dart';
import 'package:ui_practice/util/ui_helper.dart';
import 'package:ui_practice/view/card/widget/card_type_selection.dart';
import 'package:ui_practice/view/card/widget/empty_card.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final activateCardProvider = StateProvider.autoDispose<bool>((ref) {
    return false;
  });

  final selectedTypeProvider =
      StateProvider.autoDispose<String?>((ref) => null);
  late TextEditingController myCardNameTc;

  AppUserCardState appUserCardState = AppUserCardState(UserCardModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("${appUserCardState.value?.cardNumber}");
    myCardNameTc = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    appUserCardState.dispose();
    myCardNameTc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _createCardDialog(context: context);
        },
        child: const Icon(Icons.add_card_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
        child: ValueListenableBuilder<UserCardModel?>(
          valueListenable: appUserCardState,
          builder: (context, valueNotifier, child) {
            if (appUserCardState.userCard.isEmpty) {
              return UserEmptyCardWidget(
                onTap: () {
                  _createCardDialog(context: context);
                },
              );
            } else {
              return _cardWidget(
                  context: context,
                  cardOwnerName: valueNotifier?.cardOwnerName,
                  cardType: valueNotifier?.cardType,
                  cardNumberValue: valueNotifier?.cardNumber);
            }

            return UserEmptyCardWidget(
              onTap: () {
                _createCardDialog(context: context);
              },
            );
            return Column(
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final isActivated = ref.watch(activateCardProvider);
                    return Stack(
                      children: [
                        _cardWidget(context: context),
                        _cardFilterWidget(
                            isActivate: isActivated,
                            context: context,
                            onTap: () {
                              ref.read(activateCardProvider.notifier).state =
                                  !isActivated;
                            }),
                      ],
                    );
                  },
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UIHelper.textHelper(
                          text: "Card needs activation",
                          textSize: FontSize.fontSizeBigRegular,
                          fontWeight: FontWeight.bold,
                          textColor: AppColor.backgroundInfo),
                      UIHelper.textHelper(
                          textAlign: TextAlign.center,
                          textColor: AppColor.backgroundInfo,
                          text:
                              "Please get your plastic card on hands and tap on card image above to activate it."),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  _createCardDialog({required BuildContext context}) {
    UIHelper.showDialogHelper(
      context: context,
      child: _createCardWidget(),
    );
  }

  _createCardWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        VerticalSpace.regularSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UIHelper.textHelper(
                text: "Card Info",
                fontWeight: FontWeight.bold,
                textColor: AppColor.black,
                textSize: FontSize.fontSizeTitle),
            HorizontalSpace.regularSpace,
            const Icon(
              CupertinoIcons.creditcard_fill,
              color: AppColor.lightPrimaryColor,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              UIHelper.textHelper(
                text: "Card Name",
                textColor: AppColor.black,
                textSize: FontSize.fontSizeBigRegular,
              ),
              UIHelper.underlineTextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.start,
                textEditingController: myCardNameTc,
                textFieldColor: AppColor.black,
              ),
              VerticalSpace.regularSpace,
              UIHelper.textHelper(
                  text: "Your card type will be:", textColor: AppColor.black),
              Consumer(
                builder: (context, ref, child) {
                  final selectedValue = ref.watch(selectedTypeProvider);
                  return CardTypeSelection(
                    selectedValue: selectedValue,
                    onTap: (String? value) {
                      ref.read(selectedTypeProvider.notifier).state = value;
                      appUserCardState.value?.cardType = value;
                    },
                  );
                },
              ),
              UIHelper.textHelper(
                  text: "Your card number will be:", textColor: AppColor.black),
              UIHelper.textHelper(
                  text: AppHelper.generateRandomNumber(),
                  textColor: AppColor.lightPrimaryColor,
                  textSize: FontSize.fontSizeHuge),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(12),
          alignment: Alignment.centerRight,
          child: UIHelper.outlineButton(
              onPressed: () {
                final cardValue = UserCardModel(
                    cardType: selectedTypeProvider.name,
                    cardOwnerName: myCardNameTc.text,
                    cardNumber: AppHelper.generateRandomNumber());
                appUserCardState.onAddNewCard(cardValue);
              },
              buttonText: "Confirm",
              foregroundColor: AppColor.darkPrimary,
              buttonColor: AppColor.lightPrimaryColor.withOpacity(0.1),
              side: const BorderSide(color: AppColor.darkPrimary)),
        )
      ],
    );
  }

  Widget _cardFilterWidget(
      {required BuildContext context,
      void Function()? onTap,
      required bool isActivate}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          color: isActivate
              ? Colors.transparent
              : AppColor.contentDisable.withOpacity(0.99),
          borderRadius: AppBorderRadius.circularBorderRadius),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppBorderRadius.circularBorderRadius,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!isActivate) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColor.contentDisable,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: AppColor.white,
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  ),
                  child: const Icon(Icons.lock_outline_rounded, size: 50),
                ),
                VerticalSpace.regularSpace,
                UIHelper.textHelper(text: "Tap the icon to activate card")
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardWidget({
    required BuildContext context,
    String? cardNumberValue,
    String? cardType,
    String? cardOwnerName,
  }) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: AppColor.midNightBlue,
            borderRadius: AppBorderRadius.circularBorderRadius),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.textHelper(
                text: "CAT BANK",
                textSize: FontSize.fontSizeBigRegular,
                fontWeight: FontWeight.bold),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.copyright_outlined, size: 8),
                HorizontalSpace.smallSpace,
                UIHelper.textHelper(
                    text: "$cardOwnerName", textSize: FontSize.fontSizeSmall),
              ],
            ),
            VerticalSpace.bigSpace,
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.sd_card_rounded,
                      size: 40, color: AppColor.accentYellow),
                  UIHelper.textHelper(
                      text: "$cardNumberValue",
                      fontWeight: FontWeight.bold,
                      textSize: FontSize.fontSizeTitle),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UIHelper.textHelper(
                    text:
                        "${userValue?.userDefaultAccount?.userBankAccountName}"),
                const Icon(
                  Icons.join_right_outlined,
                  color: Colors.redAccent,
                  size: 40,
                ),
              ],
            )
          ],
        ));
  }
}
