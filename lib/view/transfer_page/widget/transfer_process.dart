// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_data.dart';
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
                  childWidget: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
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
                        ),
                        VerticalSpace.smallSpace,
                        UIHelper.textHelper(
                            text: widget.transferValue?.receiverName ?? "N/A",
                            textSize: FontSize.fontSizeBigRegular),
                        VerticalSpace.smallSpace,
                        UIHelper.textHelper(
                            text:
                                "${widget.transferValue?.bankNumber} ${widget.transferValue?.receiverCurrencySymbol}",
                            fontWeight: FontWeight.bold,
                            textSize: FontSize.fontSizeBigRegular),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: UIHelper.underlineTextField(
                                textEditingController: amountTransferTC,
                                autofocus: true)),
                        VerticalSpace.hugeSpace,
                        UIHelper.buttonHelper(
                            onPressed: () {
                              try {
                                onTransfer()
                                    .whenComplete(() => onVerifyAccount());
                              } catch (e) {
                                _errorDialog();
                              }
                            },
                            buttonText: "Continue")
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

  bool isValid = false;
  void onVerifyAccount() {
    isValid = true;
    setState(() {});
  }

  _selectPaymentAccount() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: AppData.userBankAccount.length,
      itemBuilder: (context, index) {
        final userBankAccount = AppData.userBankAccount.elementAt(index);
        return Row(
          children: [
            Icon(Icons.credit_card_rounded),
            UIHelper.textHelper(text: "${userValue?.userBankAccountNumber}"),
          ],
        );
      },
    );
  }

  Future<void> onTransfer() async {
    UIHelper.loadingDialogHelper(context);
    await Future.delayed(const Duration(seconds: 2));
    AppHelper.onPopBack(context);
  }

  _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
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
                      buttonText: "Done"),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _errorDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12),
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
                        buttonText: "Try Again"),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: UIHelper.outlineButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        foregroundColor: AppColor.secondary,
                        side: const BorderSide(color: AppColor.secondary),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        buttonText: "Request Help"),
                  ),
                ],
              ),
            ),
          );
        });
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
              accountNumber: userValue?.userBankAccountNumber ?? "N/A"),
          UIHelper.horizontalDivider(),
          _successInfoComponent(
              accountFirstLetter:
                  widget.transferValue?.receiverName[0] ?? "N/A",
              whereText: "To",
              accountName: widget.transferValue?.receiverName ?? "N/A",
              accountNumber: widget.transferValue?.bankNumber ?? "N/A")
        ],
      ),
    );
  }

  _successInfoComponent(
      {required String accountFirstLetter,
      required String whereText,
      required String accountName,
      required String accountNumber}) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColor.secondary,
          child: UIHelper.textHelper(text: accountFirstLetter),
        ),
        HorizontalSpace.regularSpace,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIHelper.textHelper(
              text: whereText,
              textSize: FontSize.fontSizeSmall,
              fontWeight: FontWeight.bold,
            ),
            UIHelper.textHelper(
              text: accountName,
            ),
            UIHelper.textHelper(
              text: accountNumber,
              textColor: AppColor.contentDisable,
              textSize: FontSize.fontSizeMedium,
              fontWeight: FontWeight.bold,
            ),
          ],
        )
      ],
    );
  }
}
