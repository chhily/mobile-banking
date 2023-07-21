import 'package:flutter/material.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';
import 'package:ui_practice/util/ui_helper.dart';

class CustomNumPadPage extends StatelessWidget {
  final TextEditingController amountTC;
  final void Function(int) onInputNumber;
  final void Function() onClearLastInput;
  final void Function() onClearAll;
  const CustomNumPadPage(
      {super.key,
      required this.amountTC,
      required this.onInputNumber,
      required this.onClearLastInput,
      required this.onClearAll});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        UIHelper.textHelper(
            text: "Enter amount", textSize: FontSize.fontSizeTitle),
        VerticalSpace.regularSpace,
        UIHelper.underlineTextField(
          textEditingController: amountTC,
          readOnly: false,
          decoration: const InputDecoration.collapsed(hintText: ''),
        ),
        // VerticalSpace.regularSpace,
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.35,
        //   child: NumericKeyPad(
        //     onInputNumber: onInputNumber,
        //     onClearLastInput: onClearLastInput,
        //     onClearAll: onClearAll,
        //   ),
        // ),
        // VerticalSpace.regularSpace,
      ],
    );
  }
}
