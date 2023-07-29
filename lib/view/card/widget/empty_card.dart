import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/config/app_config/app_config.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/util/ui_helper.dart';

import '../../../constant/app_color.dart';

class UserEmptyCardWidget extends StatelessWidget {
  final void Function()? onTap;
  const UserEmptyCardWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UIHelper.cardHelper(
          color: AppColor.midNightBlue,
          childWidget: InkWell(
            onTap: onTap,
            borderRadius: AppBorderRadius.circularBorderRadius,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColor.white,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(
                      Icons.add,
                      size: 40,
                    ),
                  ),
                  VerticalSpace.regularSpace,
                  UIHelper.textHelper(text: "New Card")
                ],
              ),
            ),
          ),
        ),
        VerticalSpace.hugeSpace,
        VerticalSpace.hugeSpace,
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(
            CupertinoIcons.creditcard_fill,
            size: 40,
            color: AppColor.backgroundInfo,
          ),
        ),
        UIHelper.textHelper(
            text: "No Card",
            textColor: AppColor.backgroundInfo,
            textSize: FontSize.fontSizeBigRegular),
        UIHelper.textHelper(
          text: "Press (+) button above to order a new payment card",
          textColor: AppColor.backgroundInfo,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
