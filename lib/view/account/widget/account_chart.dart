import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/util/ui_helper.dart';

import '../../../constant/app_color.dart';

class AccountOverAllSumWidget extends StatefulWidget {
  const AccountOverAllSumWidget({super.key});

  @override
  State<AccountOverAllSumWidget> createState() =>
      _AccountOverAllSumWidgetState();
}

class _AccountOverAllSumWidgetState extends State<AccountOverAllSumWidget> {
  int touchedIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onGetTotalAmountInKHR();
    onGetTotalAmountInUSD();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Stack(
            alignment: Alignment.center,
            children: [
              UIHelper.textHelper(
                  text: "All Account Summary",
                  textAlign: TextAlign.center,
                  textColor: AppColor.white),
              PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ],
          ),
        ),
        HorizontalSpace.regularSpace,
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  UIHelper.textHelper(
                      text: "Total in KHR",
                      textColor: AppColor.white,
                      textSize: FontSize.fontSizeMedium),
                  UIHelper.currencyTextHelper(
                      price: totalInKHR,
                      currencySymbol: khrSymbol,
                      textColor: AppColor.white,
                      iconColor: AppColor.white,
                      fontWeight: FontWeight.bold,
                      textSize: FontSize.fontSizeTitle)
                ],
              ),
              UIHelper.horizontalDivider(
                color: AppColor.white,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  UIHelper.textHelper(
                      text: "Total in USD",
                      textColor: AppColor.white,
                      textSize: FontSize.fontSizeMedium),
                  UIHelper.currencyTextHelper(
                      price: totalInUSD,
                      currencySymbol: usdSymbol,
                      fontWeight: FontWeight.bold,
                      textColor: AppColor.white,
                      iconColor: AppColor.white,
                      textSize: FontSize.fontSizeTitle)
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  num totalInKHR = 0;
  num totalInUSD = 0;
  String usdSymbol = "";
  String khrSymbol = "";
  void onGetTotalAmountInUSD() {
    if (userValue == null) return;
    for (final i in userValue!.userBankInfoList!) {
      if (i.userDefaultAccount == null) return;
      if (i.userDefaultAccount?.currencyName == "Khmer Riel") {
        var khrPrice = i.userDefaultAccount!.totalAmount!;
        totalInKHR += khrPrice;
        khrSymbol = i.userDefaultAccount?.currencySymbol ?? '';
      }
    }
  }

  void onGetTotalAmountInKHR() {
    if (userValue == null) return;
    for (final i in userValue!.userBankInfoList!) {
      if (i.userDefaultAccount == null) return;
      if (i.userDefaultAccount?.currencyName == "US Dollar") {
        var usdPrice = i.userDefaultAccount!.totalAmount!;
        totalInUSD += usdPrice;
        usdSymbol = i.userDefaultAccount?.currencySymbol ?? '';
      }
    }
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(userValue?.userBankInfoList?.length ?? 0, (i) {
      final isTouched = i == touchedIndex;
      final fontSize =
          isTouched ? FontSize.fontSizeRegular : FontSize.fontSizeBigRegular;
      final radius = isTouched ? 16.0 : 12.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 1)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.pink,
            radius: radius,
            value: 50,
            showTitle: false,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.cyan,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.purple,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.redAccent,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.blueAccent,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
              shadows: shadows,
            ),
          );
        case 4:
          return PieChartSectionData(
            color: Colors.blueAccent,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
              shadows: shadows,
            ),
          );
        case 5:
          return PieChartSectionData(
            color: Colors.blueAccent,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
