import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ui_practice/constant/app_data.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/model/transfer_model.dart';
import 'package:ui_practice/util/ui_helper.dart';
import 'package:ui_practice/view/transfer_page/widget/recent_transfer.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  late ScrollController _hideButtonController;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _hideButtonController = ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible == true) {
          setState(() {
            _isVisible = false;
          });
        }
      } else {
        if (_hideButtonController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (_isVisible == false) {
            setState(() {
              _isVisible = true;
            });
          }
        }
      }
    });
    onGetTransferData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _transferData.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        floatingActionButton: _isVisible
            ? FloatingActionButton.extended(
                onPressed: () {},
                label: Row(
                  children: [
                    UIHelper.textHelper(text: "Transfer"),
                    HorizontalSpace.smallSpace,
                    const Icon(CupertinoIcons.add_circled),
                  ],
                ),
              )
            : FloatingActionButton(
                onPressed: () {},
                child: const Icon(CupertinoIcons.add_circled),
              ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.textHelper(
                    text: "Choose Recipient",
                    textSize: FontSize.fontSizeTitle,
                    fontWeight: FontWeight.bold,
                  ),
                  VerticalSpace.regularSpace,
                  UIHelper.textHelper(
                    text: "Please select your recipient to send money",
                  ),
                  VerticalSpace.bigSpace,
                  UIHelper.textHelper(
                      text: "Most Recent",
                      textSize: FontSize.fontSizeBigRegular),
                ],
              ),
            ),
            VerticalSpace.regularSpace,
            Expanded(
              child: RecentTransferWidget(
                transferData: _transferData,
                controller: _hideButtonController,
              ),
            ),
            VerticalSpace.regularSpace,
          ],
        ),
      ),
    );
  }

  List<TransferModel> _transferData = [];
  Future<void> onGetTransferData() async {
    _transferData = AppData.transferData.map((transfer) {
      return TransferModel(
        receiverName: transfer["receiver_name"],
        receiverCurrencySymbol: transfer["currency"],
        receiverEmail: transfer["receiver_email"],
        receiverMoney: transfer["receiver_money"],
        receiverImage: transfer["receiver_image"],
        indicateStatus: transfer["indicate_status"],
        bankNumber: transfer["receiver_bank"],
      );
    }).toList();
  }
}
