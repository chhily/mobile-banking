import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';

class UIHelper {
  static textHelper(
      {required String text, double? textSize, FontWeight? fontWeight}) {
    return Text(
      text,
      style: GoogleFonts.quicksand(
          fontSize: textSize ?? FontSize.fontSizeRegular,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
  }

  static Widget outlineButton({
    required void Function()? onPressed,
    required String buttonText,
    Widget? childWidget,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      child: childWidget ??
          Container(
            child: textHelper(text: buttonText),
          ),
    );
  }

  static Widget cardHelper({Color? color, Widget? childWidget}) {
    return Card(
      elevation: 0,
      color: color ?? AppColor.white,
      margin: EdgeInsets.zero,
      child: childWidget ?? const Placeholder(),
    );
  }
}
