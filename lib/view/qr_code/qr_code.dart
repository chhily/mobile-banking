import 'package:flutter/material.dart';
import 'package:ui_practice/config/app_config/app_config.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/util/ui_helper.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UIHelper.textHelper(
                      text: "MY QR",
                      textSize: FontSize.fontSizeSuperHuge,
                      fontWeight: FontWeight.bold),
                  VerticalSpace.regularSpace,
                  SizedBox(
                    width: 200,
                    child: UIHelper.textHelper(
                        textAlign: TextAlign.center,
                        text: "Show this QR to receive money from others"),
                  ),
                  VerticalSpace.bigSpace,
                  UIHelper.cardHelper(
                    color: Colors.red,
                    childWidget: Container(
                      decoration: const BoxDecoration(
                        color: AppColor.darkPrimary,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.elliptical(120, 80),
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12)),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: UIHelper.textHelper(
                                text: "KHQR", textSize: FontSize.fontSizeHuge),
                          ),
                          VerticalSpace.bigSpace,
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UIHelper.textHelper(
                                    text: "${userValue?.userName}",
                                    fontWeight: FontWeight.bold),
                                UIHelper.textHelper(
                                    text: "0",
                                    textSize: FontSize.fontSizeHuge,
                                    fontWeight: FontWeight.bold),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(16),
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/qr_code.png'))),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
