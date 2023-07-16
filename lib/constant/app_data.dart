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

  static List<Map<String, dynamic>> transferData = [
    {
      'receiver_name': 'HI Doe',
      'currency': 'USD',
      'receiver_email': 'janedoe@example.com',
      'receiver_money': 10000,
      'receiver_image': "https://i.pravatar.cc/150?img=3",
      'indicate_status': "Completed"
    },
    {
      'receiver_name': 'Java isHard',
      'currency': 'Riel',
      'receiver_email': 'java@example.com',
      'receiver_money': 123663300,
      'receiver_image': "https://i.pravatar.cc/150?img=5",
      'indicate_status': "Pending"
    },
    {
      'receiver_name': 'Hello World',
      'currency': 'CUD',
      'receiver_email': 'helloworld@example.com',
      'receiver_money': 34546,
      'receiver_image': "https://i.pravatar.cc/150?img=4",
      'indicate_status': "Failed"
    },
    {
      'receiver_name': 'Bi yao',
      'currency': '€',
      'receiver_email': 'biyao@example.com',
      'receiver_money': 43523.4,
      'receiver_image': "https://i.pravatar.cc/150?img=3",
      'indicate_status': "Failed"
    },
    {
      'receiver_name': 'Naruto Uzumaki',
      'currency': '¥',
      'receiver_email': 'naruto@example.com',
      'receiver_money': 234.32,
      'receiver_image': "https://i.pravatar.cc/150?img=1",
      'indicate_status': "Failed"
    },
    {
      'receiver_name': 'Jane Doe',
      'currency': '¥',
      'receiver_email': 'janedoe@example.com',
      'receiver_money': 1321,
      'receiver_image': "https://i.pravatar.cc/150?img=55",
      'indicate_status': "Completed"
    },
    {
      'receiver_name': 'Jona Hello',
      'currency': 'BRL',
      'receiver_email': 'jona@example.com',
      'receiver_money': 543543,
      'receiver_image': "https://i.pravatar.cc/150?img=32",
      'indicate_status': "Completed"
    },
    {
      'receiver_name': 'Thida Kim',
      'currency': 'Riel',
      'receiver_email': 'thida@example.com',
      'receiver_money': 32445,
      'receiver_image': "https://i.pravatar.cc/150?img=28",
      'indicate_status': "Completed"
    }
  ];
}
