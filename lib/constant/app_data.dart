import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppData {
  static const List<String> currencies = [
    "US Dollar",
    "Khmer Riel",
    "Euro",
    "British Pound",
    "Japanese Yen",
    "Chinese Yuan",
    "Indian Rupee",
    "Brazilian Real",
    "Australian Dollar",
    "Canadian Dollar",
  ];

  static List<Map<String, dynamic>> transactions = [
    {
      'date': DateTime(2023, 7, 1),
      'category': 'Spending',
      'amount': 100.00,
      'icon': Icons.payment_rounded
    },
    {
      'date': DateTime(2023, 7, 2),
      'category': 'Income',
      'amount': 200.00,
      'icon': CupertinoIcons.arrow_down_left_circle_fill
    },
    {
      'date': DateTime(2023, 7, 3),
      'category': 'Bills',
      'amount': 50.00,
      'icon': Icons.request_quote_rounded
    },
    {
      'date': DateTime(2023, 7, 4),
      'category': 'Savings',
      'amount': 50.00,
      'icon': Icons.savings_rounded
    },
  ];
}
