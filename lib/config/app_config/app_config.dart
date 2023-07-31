import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppBorderRadius {
  static BorderRadius circularBorderRadius = BorderRadius.circular(12);
  static BorderRadius bigCircularBorderRadius = BorderRadius.circular(16);
  static BorderRadius verticalBorderRadius = const BorderRadius.vertical(
    top: Radius.circular(12),
  );
  static BorderRadius horizontalBorderRadius = const BorderRadius.horizontal(
    left: Radius.circular(12),
    right: Radius.circular(12),
  );
}

class AppFormatter {
  static priceFormatter(num price) {
    final numberFormat = NumberFormat('#,###,###.##');
    return numberFormat.format(price);
  }
}
