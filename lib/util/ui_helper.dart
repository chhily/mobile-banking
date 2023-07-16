import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_practice/config/app_config/app_config.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';
import 'package:ui_practice/constant/app_space.dart';

class UIHelper {
  static Text textHelper(
      {required String text,
      double? textSize,
      FontWeight? fontWeight,
      Color? textColor}) {
    return Text(
      text,
      style: GoogleFonts.quicksand(
          height: 0,
          fontSize: textSize ?? FontSize.fontSizeRegular,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: textColor),
    );
  }

  static Widget currencyTextHelper(
      {required num price,
      double? textSize,
      FontWeight? fontWeight,
      Color? textColor,
      MainAxisAlignment? mainAxisAlignment,
      Color? iconColor,
      String? currencySymbol}) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        textHelper(
          text: currencySymbol ?? "N/A",
          textColor: iconColor,
          textSize: textSize ?? FontSize.fontSizeRegular,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
        HorizontalSpace.smallSpace,
        Text(
          AppFormatter.priceFormatter(price),
          style: GoogleFonts.quicksand(
              height: 0,
              fontSize: textSize ?? FontSize.fontSizeRegular,
              fontWeight: fontWeight ?? FontWeight.normal,
              color: textColor),
        ),
      ],
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

  static Widget verticalDivider() {
    return Container(
      width: 2,
      height: 40,
      color: Colors.white,
    );
  }

  static TextFormField textFormFieldHelper({
    String? labelText,
    Widget? suffixIcon,
    Color? fillColor,
    Color? enableColor,
    Color? textColor,
  }) {
    return TextFormField(
      style: GoogleFonts.quicksand(
          color: textColor, fontSize: FontSize.fontSizeRegular),
      keyboardType: TextInputType.text,
      cursorColor: textColor ?? AppColor.white,
      decoration: InputDecoration(
        label: textHelper(text: labelText ?? '', textColor: textColor),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        filled: true,
        fillColor: fillColor ?? AppColor.backgroundPrimary.withOpacity(0.2),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 1, color: AppColor.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          borderSide:
              BorderSide(width: 0.5, color: enableColor ?? AppColor.white),
        ),
      ),
    );
  }

  static draggableBottomSheet(
      {required BuildContext context,
      required Widget Function(BuildContext, ScrollController) builder,
      double? initialChildSize,
      double? minChildSize,
      double? maxChildSize}) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: DraggableScrollableSheet(
          initialChildSize: initialChildSize ?? 0.5,
          minChildSize: minChildSize ?? 0.5,
          maxChildSize: maxChildSize ?? 0.8,
          builder: builder,
        ));
  }

  static imageAvatarHelper(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: 50,
      height: 50,
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          backgroundColor: AppColor.backgroundInfo,
          backgroundImage: imageProvider,
        );
      },
      placeholder: (context, url) {
        return const Center(
          child: SizedBox(
            height: 12,
            width: 12,
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(AppColor.primaryColor),
              strokeWidth: 1,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return CircleAvatar(
          backgroundColor: AppColor.backgroundInfo,
          child: Image.network(
            url,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                CupertinoIcons.person,
                color: AppColor.secondary,
              );
            },
          ),
        );
      },
    );
  }
}
