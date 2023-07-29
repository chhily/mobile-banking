import 'package:flutter/material.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_data.dart';
import 'package:ui_practice/util/ui_helper.dart';

class CardTypeSelection extends StatelessWidget {
  final void Function(String? value)? onTap;
  final String? selectedValue;
  const CardTypeSelection({super.key, this.onTap, required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: selectedValue,
      icon: const Icon(Icons.arrow_downward, size: 16),
      elevation: 16,
      style: UIHelper.appTextStyle(textColor: AppColor.black),
      padding: EdgeInsets.zero,
      selectedItemBuilder: (context) {
        return AppData.cardType.map((String value) {
          return Align(
            alignment: Alignment.center,
            child: UIHelper.textHelper(
                text: selectedValue ?? value, textColor: AppColor.black),
          );
        }).toList();
      },
      underline: Container(
        height: 1.5,
        color: AppColor.lightPrimaryColor,
      ),
      dropdownColor: AppColor.darkPrimary,
      onChanged: (value) {},
      items: AppData.cardType.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          onTap: () {
            onTap!(value);
          },
          value: value,
          child: UIHelper.textHelper(text: value, textColor: AppColor.white),
        );
      }).toList(),
    );
  }
}
