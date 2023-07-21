import 'package:flutter/material.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/util/ui_helper.dart';

import '../constant/app_color.dart';

/// A widget that builds a numeric keypad which
/// mimics the Os numeric keypad on Android and IOS devices
/// or other touch-enabled devices.
class NumericKeyPad extends StatelessWidget {
  /// Creates a widget that builds the numeric keypad.
  const NumericKeyPad({
    super.key,
    required this.onInputNumber,
    required this.onClearLastInput,
    required this.onClearAll,
  });

  final ValueSetter<int> onInputNumber;
  final VoidCallback onClearLastInput;
  final VoidCallback onClearAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 1; i < 4; i++)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int j = 1; j < 4; j++)
                  Numeral(
                    number: (i - 1) * 3 + j,
                    onKeyPress: () => onInputNumber((i - 1) * 3 + j),
                  ),
              ],
            ),
          ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: DecimalButton(
                  onDecimal: () {},
                ),
              ),
              Numeral(
                number: 0,
                onKeyPress: () => onInputNumber(0),
              ),
              Expanded(
                child: ClearButton(
                  onClearLastInput: onClearLastInput,
                  onClearAll: onClearAll,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Represents a button on the numeric keypad that contains a number.
class Numeral extends StatelessWidget {
  /// Creates a button on the numeric keypad that contains a number.
  const Numeral({
    super.key,
    required this.number,
    required this.onKeyPress,
  });

  final int number;
  final VoidCallback onKeyPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: UIHelper.outlineButton(
        shape: const CircleBorder(),
        foregroundColor: AppColor.white,
        onPressed: onKeyPress,
        childWidget: UIHelper.textHelper(
            text: "$number",
            fontWeight: FontWeight.bold,
            textSize: FontSize.fontSizeBigRegular),
        buttonText: '',
      ),
    );
  }
}

class DecimalButton extends StatelessWidget {
  final VoidCallback onDecimal;
  const DecimalButton({super.key, required this.onDecimal});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      onPressed: onDecimal,
      icon: const Icon(
        Icons.fiber_manual_record,
        size: 12,
        color: Color(0xFFF1F4FE),
      ),
    );
  }
}

class ClearButton extends StatelessWidget {
  const ClearButton({
    super.key,
    required this.onClearLastInput,
    required this.onClearAll,
  });

  final VoidCallback onClearLastInput;
  final VoidCallback onClearAll;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onClearLastInput,
      icon: const Icon(
        Icons.backspace,
        color: Color(0xFFF1F4FE),
      ),
    );
  }
}
