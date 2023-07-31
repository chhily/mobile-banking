import 'package:flutter/material.dart';
import 'package:ui_practice/view/account/widget/account_chart.dart';
import 'package:ui_practice/view/account/widget/bank_info_list_widget.dart';

import '../../constant/app_color.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkPrimary,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColor.white,
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
            child: AccountOverAllSumWidget(),
          ),
          Expanded(
            child: Container(
              color: AppColor.midNightBlue.withOpacity(0.2),
              child: const AccountInfoListWidget(),
            ),
          )
        ],
      ),
    );
  }
}
