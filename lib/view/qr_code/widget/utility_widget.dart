import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/model/user_model.dart';
import 'package:ui_practice/util/ui_helper.dart';

class UtilityWidget extends StatelessWidget {
  final UserDefaultAccount? bankData;
  const UtilityWidget({super.key, required this.bankData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIcon(
            onPressed: () {},
            iconData: CupertinoIcons.arrow_down_square,
            title: "Download"),
        _buildIcon(
            onPressed: () {},
            iconData: Icons.fit_screen_outlined,
            title: "Screenshot"),
        _buildIcon(
            onPressed: () {
              UIHelper.snackBarHelper(context: context, snackMessage: "Copies !!");
              Clipboard.setData(ClipboardData(text: "${bankData?.link}"));
              // Navigator.pop(context);
            },
            iconData: CupertinoIcons.link,
            title: "Share Link"),
      ],
    );
  }

  Widget _buildIcon(
      {IconData? iconData,
      required String title,
      required void Function()? onPressed}) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: CircleAvatar(
            backgroundColor: AppColor.backgroundPrimary.withOpacity(0.2),
            child: Icon(iconData, size: 20),
          ),
        ),
        UIHelper.textHelper(
          text: title,
          textSize: FontSize.fontSizeMedium,
          textColor: AppColor.white,
        )
      ],
    );
  }
}
