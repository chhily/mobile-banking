// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/config/app_config/app_config.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/model/transfer_model.dart';
import 'package:ui_practice/util/helper.dart';
import 'package:ui_practice/util/ui_helper.dart';

class TransferProcessPage extends StatefulWidget {
  final TransferModel? transferValue;

  const TransferProcessPage({super.key, required this.transferValue});

  @override
  State<TransferProcessPage> createState() => _TransferProcessPageState();
}

class _TransferProcessPageState extends State<TransferProcessPage> {
  late TextEditingController amountTransferTC;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    amountTransferTC = TextEditingController(
        text: widget.transferValue?.receiverMoney.toString());
  }

  @override
  void dispose() {
    // TODO: implement dispose

    amountTransferTC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.textHelper(
                  text: 'Enter Amount',
                  fontWeight: FontWeight.bold,
                  textSize: FontSize.fontSizeTitle),
              VerticalSpace.regularSpace,
              UIHelper.textHelper(
                text: 'Select a Method for Sending Money',
              ),
              VerticalSpace.bigSpace,
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: UIHelper.cardHelper(
                  color: AppColor.white,
                  childWidget: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildReceiverProfile(),
                        buildReceiverInfo(),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: UIHelper.underlineTextField(
                                textEditingController: amountTransferTC,
                                textFieldColor: AppColor.darkPrimary,
                                autofocus: true)),
                        VerticalSpace.hugeSpace,
                        isValid
                            ? const SizedBox()
                            : UIHelper.buttonHelper(
                                onPressed: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  _showPaymentMethodDialog(
                                    () {
                                      try {
                                        onTransfer().whenComplete(() async {
                                          Navigator.pop(context);
                                          onVerifyAccount();
                                          onCompleted().whenComplete(
                                              () => _showSuccessDialog());
                                        });
                                      } catch (e) {
                                        _errorDialog();
                                      }
                                    },
                                  );
                                },
                                buttonText: "Continue",
                                textColor: AppColor.white)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildReceiverInfo() {
    return Column(
      children: [
        VerticalSpace.smallSpace,
        UIHelper.textHelper(
            text: widget.transferValue?.receiverName ?? "N/A",
            textColor: AppColor.darkPrimary,
            textSize: FontSize.fontSizeBigRegular),
        VerticalSpace.smallSpace,
        UIHelper.textHelper(
            text:
                "${widget.transferValue?.bankNumber} ${widget.transferValue?.receiverCurrencySymbol}",
            fontWeight: FontWeight.bold,
            textColor: AppColor.darkPrimary,
            textSize: FontSize.fontSizeBigRegular),
      ],
    );
  }

  Widget buildReceiverProfile() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          alignment: Alignment.center,
          width: 100,
          height: 60,
          child: UIHelper.imageAvatarHelper(
              widget.transferValue?.receiverImage ?? '',
              height: 100,
              width: 100),
        ),
        isValid
            ? const Positioned(
                bottom: 0,
                right: 10,
                child: Icon(
                  Icons.done_rounded,
                  color: AppColor.successColor,
                ),
              )
            : const SizedBox()
      ],
    );
  }

  bool isValid = false;
  void onVerifyAccount() {
    isValid = true;
    setState(() {});
  }

  _showPaymentMethodDialog(void Function()? onTap) {
    UIHelper.showDialogHelper(
      context: context,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: UIHelper.textHelper(
                  text: "Available Accounts",
                  textColor: AppColor.black,
                  fontWeight: FontWeight.bold,
                  textSize: FontSize.fontSizeTitle),
            ),
            VerticalSpace.bigSpace,
            UIHelper.textHelper(
                text: "Selected account",
                textColor: AppColor.black,
                textSize: FontSize.fontSizeBigRegular),
            VerticalSpace.regularSpace,
            Expanded(child: _selectPaymentAccount(onTap)),
          ],
        ),
      ),
    );
  }

  Widget _selectPaymentAccount(void Function()? onTap) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      separatorBuilder: (context, index) => VerticalSpace.regularSpace,
      shrinkWrap: true,
      itemCount: userValue?.userBankInfoList?.length ?? 0,
      itemBuilder: (context, index) {
        final userBankAccount = userValue?.userBankInfoList?.elementAt(index);
        return UIHelper.cardHelper(
          color: AppColor.backgroundPrimary,
          childWidget: InkWell(
            onTap: onTap,
            borderRadius: AppBorderRadius.circularBorderRadius,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColor.lightSecondary,
                    child: UIHelper.textHelper(
                      text: userBankAccount?.userName![0] ?? "N/A",
                    ),
                  ),
                  HorizontalSpace.regularSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIHelper.textHelper(
                          text: "${userBankAccount?.userAccountNumber}",
                          fontWeight: FontWeight.bold,
                          textColor: AppColor.black),
                      UIHelper.textHelper(
                          text: "${userBankAccount?.accountType}",
                          textSize: FontSize.fontSizeMedium,
                          textColor: AppColor.black),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        UIHelper.currencyTextHelper(
                            price: userBankAccount?.totalAmount ?? 0,
                            currencySymbol:
                                userBankAccount?.currencySymbol ?? "N/A",
                            fontWeight: FontWeight.bold,
                            iconColor: AppColor.black,
                            textColor: AppColor.black),
                        UIHelper.textHelper(
                            text: "${userBankAccount?.dayLimited}",
                            textSize: FontSize.fontSizeMedium,
                            textColor: AppColor.black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> onTransfer() async {
    UIHelper.loadingDialogHelper(context);
    await Future.delayed(const Duration(seconds: 2));
    AppHelper.onPopBack(context);
  }

  Future<void> onCompleted() async {
    UIHelper.loadingDialogHelper(context);
    await Future.delayed(const Duration(seconds: 2));
    AppHelper.onPopBack(context);
  }

  _showSuccessDialog() {
    UIHelper.showDialogHelper(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              VerticalSpace.hugeSpace,
              const CircleAvatar(
                minRadius: 40,
                backgroundColor: AppColor.successColor,
                child: Icon(Icons.done_rounded, size: 32),
              ),
              VerticalSpace.hugeSpace,
              UIHelper.textHelper(
                  text: "Transaction Success!",
                  fontWeight: FontWeight.bold,
                  textColor: AppColor.darkPrimary,
                  textSize: FontSize.fontSizeBigRegular),
              VerticalSpace.smallSpace,
              UIHelper.textHelper(
                text: "You have successfully transferred:",
                textColor: AppColor.contentDisable,
              ),
              VerticalSpace.bigSpace,
              UIHelper.currencyTextHelper(
                price: num.parse(amountTransferTC.text),
                fontWeight: FontWeight.bold,
                textColor: AppColor.darkPrimary,
                iconColor: AppColor.darkPrimary,
                currencySymbol: "C",
                textSize: FontSize.fontSizeHuge,
              ),
              VerticalSpace.hugeSpace,
              _successInfoWidget(),
              VerticalSpace.hugeSpace,
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: UIHelper.buttonHelper(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    buttonText: "Done",
                    textColor: AppColor.white),
              )
            ],
          ),
        ));
  }

  _errorDialog() {
    UIHelper.showDialogHelper(
        context: context,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                minRadius: 40,
                backgroundColor: AppColor.errorColor,
                child: Icon(
                  Icons.report_problem_rounded,
                ),
              ),
              VerticalSpace.hugeSpace,
              UIHelper.textHelper(
                  text: "Something Went Wrong!",
                  fontWeight: FontWeight.bold,
                  textColor: AppColor.black,
                  textSize: FontSize.fontSizeBigRegular),
              VerticalSpace.smallSpace,
              UIHelper.textHelper(
                text:
                    "Cannot process this transaction right now. Try again or contact your local branch.",
                textAlign: TextAlign.center,
                textColor: AppColor.contentDisable,
              ),
              VerticalSpace.hugeSpace,
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: UIHelper.buttonHelper(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    textColor: AppColor.white,
                    buttonText: "Try Again"),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: UIHelper.outlineButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    foregroundColor: AppColor.lightSecondary,
                    side: const BorderSide(color: AppColor.lightSecondary),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    buttonText: "Request Help"),
              ),
            ],
          ),
        ));
  }

  _successInfoWidget() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.backgroundInfo),
      ),
      child: Column(
        children: [
          _successInfoComponent(
              accountFirstLetter: userValue?.userName![0] ?? "N/A",
              whereText: "From",
              accountName: userValue?.userBankAccountName ?? "N/A",
              accountNumber: userValue?.userBankAccountNumber ?? "N/A",
              icon: CupertinoIcons.arrow_up_right_circle,
              iconColor: AppColor.errorColor),
          UIHelper.horizontalDivider(),
          _successInfoComponent(
              accountFirstLetter:
                  widget.transferValue?.receiverName[0] ?? "N/A",
              whereText: "To",
              accountName: widget.transferValue?.receiverName ?? "N/A",
              accountNumber: widget.transferValue?.bankNumber ?? "N/A",
              icon: CupertinoIcons.arrow_down_left_circle,
              iconColor: AppColor.successColor)
        ],
      ),
    );
  }

  _successInfoComponent(
      {required String accountFirstLetter,
      required String whereText,
      required String accountName,
      required String accountNumber,
      IconData? icon,
      Color? iconColor}) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColor.lightSecondary,
          child: UIHelper.textHelper(
              text: accountFirstLetter, textColor: AppColor.white),
        ),
        HorizontalSpace.regularSpace,
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.textHelper(
                        text: whereText,
                        textSize: FontSize.fontSizeSmall,
                        fontWeight: FontWeight.bold,
                        textColor: AppColor.black),
                    UIHelper.textHelper(
                        text: accountName, textColor: AppColor.black),
                    UIHelper.textHelper(
                      text: accountNumber,
                      textColor: AppColor.contentDisable,
                      textSize: FontSize.fontSizeMedium,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Icon(
                icon,
                color: iconColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
