import 'package:flutter/material.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/model/transfer_model.dart';
import 'package:ui_practice/util/ui_helper.dart';

class TransferProcessPage extends StatefulWidget {
  final TransferModel? transferValue;

  const TransferProcessPage({super.key, required this.transferValue});

  @override
  State<TransferProcessPage> createState() => _TransferProcessPageState();
}

class _TransferProcessPageState extends State<TransferProcessPage> {
  TextEditingController amountTransferTC = TextEditingController();

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
                        UIHelper.imageAvatarHelper(
                            widget.transferValue?.receiverImage ?? '',
                            height: 100,
                            width: 100),
                        VerticalSpace.regularSpace,
                        UIHelper.textHelper(
                            text: widget.transferValue?.receiverName ?? "N/A",
                            textSize: FontSize.fontSizeBigRegular),
                        UIHelper.textHelper(
                            text: widget.transferValue?.receiverEmail ?? "N/A",
                            textSize: FontSize.fontSizeMedium),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: UIHelper.underlineTextField(
                                textEditingController: amountTransferTC,
                                autofocus: true)),
                        VerticalSpace.hugeSpace,
                        UIHelper.buttonHelper(
                            onPressed: () {}, buttonText: "Continue")
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
}
