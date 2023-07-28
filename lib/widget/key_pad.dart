import 'package:flutter/material.dart';
import 'package:passcode_screen/circle.dart';
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

  List<Widget> _buildCirclesWidget() {
    var list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(
        Container(
          margin: const EdgeInsets.all(8),
          child: CircleWidget(
            filled: i < 4,
            circleUIConfig: const CircleUIConfig(),
          ),
        ),
      );
    }
    return list;
  }
}

class CircleWidget extends StatelessWidget {
  final bool filled;
  final CircleUIConfig circleUIConfig;
  final double extraSize;

  const CircleWidget({
    Key? key,
    this.filled = false,
    required this.circleUIConfig,
    this.extraSize = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: extraSize),
      width: circleUIConfig.circleSize,
      height: circleUIConfig.circleSize,
      decoration: BoxDecoration(
        color: filled ? circleUIConfig.fillColor : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: circleUIConfig.borderColor,
          width: circleUIConfig.borderWidth,
        ),
      ),
    );
  }
}

@immutable
class CircleUIConfig {
  final Color borderColor;
  final Color fillColor;
  final double borderWidth;
  final double circleSize;

  const CircleUIConfig({
    this.borderColor = Colors.white,
    this.borderWidth = 1,
    this.fillColor = Colors.white,
    this.circleSize = 20,
  });
}
