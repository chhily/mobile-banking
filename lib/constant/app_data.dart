import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppData {
  static const List<Map<String, dynamic>> currencies = [
    {
      'name': "US Dollar",
      "symbol": "USD",
      'amount': 10000,
    },
    {
      'name': "Khmer Riel",
      "symbol": "Riel",
      'amount': 43287400,
    },
    {
      'name': "Euro",
      "symbol": "€",
      'amount': 59.89,
    },
    {
      'name': "British Pound",
      "symbol": "£",
      'amount': 52139.89,
    },
    {
      'name': "Japanese Yen",
      "symbol": "¥",
      'amount': 9456831.55,
    },
    {
      'name': "Chinese Yuan",
      "symbol": "¥",
      'amount': 12345.55,
    },
    {
      'name': "Indian Rupee",
      "symbol": "Rs.",
      'amount': 0.55,
    },
    {
      'name': "Brazilian Real",
      "symbol": "BRL",
      'amount': 445.14,
    },
    {
      'name': "Australian Dollar",
      "symbol": "AUD",
      'amount': 456,
    },
    {
      'name': "Canadian Dollar",
      "symbol": "CUD",
      'amount': 888.123,
    },
  ];

  static List<Map<String, dynamic>> transactions = [
    {
      'date': DateTime(2023, 7, 1),
      'category': 'Spending',
      'amount': 569.00,
      'icon': Icons.payment_rounded,
      'currency': "Riel"
    },
    {
      'date': DateTime(2023, 7, 2),
      'category': 'Income',
      'amount': 800.00,
      'icon': CupertinoIcons.arrow_down_left_circle_fill,
      'currency': "USD"
    },
    {
      'date': DateTime(2023, 7, 3),
      'category': 'Bills',
      'amount': 95.55,
      'icon': Icons.request_quote_rounded,
      'currency': "Riel"
    },
    {
      'date': DateTime(2023, 7, 4),
      'category': 'Savings',
      'amount': 6545.00,
      'icon': Icons.savings_rounded,
      'currency': "USD"
    },
  ];
}
