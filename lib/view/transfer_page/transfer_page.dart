import 'package:flutter/material.dart';
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
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
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
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
              Expanded(
                  child: RecentTransferWidget(
                transferData: _transferData,
              )),
            ],
          ),
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
          indicateStatus: transfer["indicate_status"]);
    }).toList();
  }
}
