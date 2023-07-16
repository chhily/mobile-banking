import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_data.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/model/transfer_model.dart';
import 'package:ui_practice/util/ui_helper.dart';

class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
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
              Expanded(child: _buildRecentTransfer()),
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

  Widget _buildRecentTransfer() {
    return UIHelper.cardHelper(
        color: AppColor.white,
        childWidget: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: UIHelper.textFormFieldHelper(
                    textColor: Colors.black,
                    labelText: "Search ``example@gmail.com`` ",
                    suffixIcon: const Icon(CupertinoIcons.search,
                        color: AppColor.contentDisable),
                    fillColor: AppColor.backgroundInfo.withOpacity(0.1),
                    enableColor: AppColor.secondary),
              ),
              VerticalSpace.bigSpace,
              UIHelper.textHelper(
                  text: "Most Recent", textSize: FontSize.fontSizeBigRegular),
              Expanded(child: _buildRecentTransferList()),
            ],
          ),
        ));
  }

  Widget _buildRecentTransferList() {
    return ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final transferData = _transferData.elementAt(index);
          return Row(
            children: [
              UIHelper.imageAvatarHelper(transferData.receiverImage),
              HorizontalSpace.regularSpace,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.textHelper(text: transferData.receiverName),
                    UIHelper.textHelper(
                        text: transferData.receiverEmail,
                        textSize: FontSize.fontSizeMedium),
                  ],
                ),
              ),
              UIHelper.currencyTextHelper(
                  price: transferData.receiverMoney,
                  currencySymbol: transferData.receiverCurrencySymbol,
                  iconColor: AppColor.errorColor,
                  textColor: AppColor.errorColor),
            ],
          );
        },
        separatorBuilder: (context, index) => VerticalSpace.regularSpace,
        itemCount: AppData.transferData.length);
  }
}
