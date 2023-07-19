import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/config/app_config/app_config.dart';
import 'package:ui_practice/config/app_config/user_preference.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/util/ui_helper.dart';

class ProfileInfoPage extends StatelessWidget {
  const ProfileInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ClipRRect(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: _image.image, fit: BoxFit.fill)), // Background
              child: BackdropFilter(
                filter: _imageFilter,
                child: _profileWidget(), // Foreground
              ),
            ),
          ),
          VerticalSpace.bigSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              children: [
                _optionCard(
                    title: "Profile", iconData: Icons.account_circle_outlined),
                VerticalSpace.mediumSpace,
                _optionCard(
                    title: "Security", iconData: Icons.lock_outline_rounded),
                VerticalSpace.mediumSpace,
                _optionCard(
                    title: "Contact Us",
                    iconData: CupertinoIcons.phone_badge_plus),
                VerticalSpace.mediumSpace,
                _optionCard(
                    title: "Terms & Conditions",
                    iconData: Icons.description_outlined),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.copyright_outlined),
              HorizontalSpace.smallSpace,
              UIHelper.textHelper(text: "CHHILY LIM"),
            ],
          ),
          VerticalSpace.regularSpace,
        ],
      ),
    );
  }

  Image get _image => Image.network(userValue?.userProfile ?? '');

  ImageFilter get _imageFilter => ImageFilter.blur(sigmaX: 10, sigmaY: 10);

  Widget _profileWidget() {
    return Column(
      children: [
        UIHelper.imageAvatarHelper(userValue?.userProfile ?? '',
            height: 100, width: 100),
        VerticalSpace.regularSpace,
        UIHelper.textHelper(
            text: "${userValue?.userName}", textSize: FontSize.fontSizeTitle),
        UIHelper.textHelper(
            text: "App ID: 00001", textSize: FontSize.fontSizeMedium),
        VerticalSpace.bigSpace,
      ],
    );
  }

  Widget _optionCard({required String title, required IconData iconData}) {
    return UIHelper.cardHelper(
      color: AppColor.backgroundPrimary.withOpacity(0.1),
      childWidget: InkWell(
        onTap: () {},
        borderRadius: AppBorderRadius.circularBorderRadius,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(iconData),
                    HorizontalSpace.regularSpace,
                    UIHelper.textHelper(text: title)
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
