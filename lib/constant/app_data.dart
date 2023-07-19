import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/model/user_model.dart';

class AppData {
  static Map<String, dynamic> userDefaultAccount = {
    'currency_name': "Khmer Riel",
    "symbol": "Riel",
    'amount': 43287400,
  };

  static const listOfUserBankAccount = [
    {
      'bank_info': {
        'currency_name': "Khmer Riel",
        "symbol": "Riel",
        'amount': 43287400,
      },
    },
    {
      'bank_info': {
        'currency_name': "US Dollar",
        "symbol": "USD",
        'amount': 10000,
      },
    },
    {
      'bank_info': {
        'currency_name': "Euro",
        "symbol": "€",
        'amount': 59.89,
      },
    },
    {
      'bank_info': {
        'currency_name': "British Pound",
        "symbol": "£",
        'amount': 52139.89,
      },
    },
    {
      'bank_info': {
        'currency_name': "Japanese Yen",
        "symbol": "¥",
        'amount': 9456831.55,
      },
    },
    {
      'bank_info': {
        'currency_name': "Chinese Yuan",
        "symbol": "¥",
        'amount': 12345.55,
      },
    },
    {
      'bank_info': {
        'currency_name': "Australian Dollar",
        "symbol": "AUD",
        'amount': 456,
      },
    },
  ];

  static List<UserBankInfo> bankAccountData = [
    UserBankInfo(
        currencyName: "Khmer Riel",
        currencySymbol: "Riel",
        totalAmount: 43287400,
        userName: "Lim Chhily",
        userAccountNumber: "003 001 222",
        dayLimited: "Unlimited",
        accountType: "Mobile Saving"),
    UserBankInfo(
        currencyName: "US Dollar",
        currencySymbol: "USD",
        totalAmount: 10000,
        userName: "Lim Chhily",
        dayLimited: "Unlimited",
        accountType: "Mobile Saving",
        userAccountNumber: "001 125 913"),
    UserBankInfo(
        currencyName: "Japanese Yen",
        currencySymbol: "¥",
        totalAmount: 9456831.55,
        userName: "Lim Chhily",
        accountType: "Debits",
        dayLimited: "500/Day",
        userAccountNumber: "981 913 888"),
    UserBankInfo(
        currencyName: "Chinese Yuan",
        currencySymbol: "¥",
        totalAmount: 12345.55,
        userName: "Lim Chhily",
        accountType: "Credit",
        dayLimited: "900/Day",
        userAccountNumber: "123 456 913"),
    UserBankInfo(
        currencyName: "Brazilian Real",
        currencySymbol: "BRL",
        totalAmount: 445.14,
        userName: "Lim Chhily",
        dayLimited: "Unlimited",
        accountType: "Mobile Saving",
        userAccountNumber: "666 123 897"),
  ];

  static const Map<String, dynamic> userInfo = {
    'bank_number': "001 125 913",
    'bank_account': "Chhily Lim",
    'username': "Chhily Lim",
    'user_profile':
        "https://i.pinimg.com/564x/e1/00/e2/e100e2f12c58d22a35222f136da20739.jpg",
  };

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
      'indicate_status': "Completed",
      'receiver_bank': "456 456 789",
    },
    {
      'receiver_name': 'Java isHard',
      'currency': 'Riel',
      'receiver_email': 'java@example.com',
      'receiver_money': 123663300,
      'receiver_image': "https://i.pravatar.cc/150?img=5",
      'indicate_status': "Pending",
      'receiver_bank': "412 132 355",
    },
    {
      'receiver_name': 'Hello World',
      'currency': 'CUD',
      'receiver_email': 'helloworld@example.com',
      'receiver_money': 34546,
      'receiver_image': "https://i.pravatar.cc/150?img=4",
      'indicate_status': "Failed",
      'receiver_bank': "767 322 324",
    },
    {
      'receiver_name': 'Bi yao',
      'currency': '€',
      'receiver_email': 'biyao@example.com',
      'receiver_money': 43523.4,
      'receiver_image': "https://i.pravatar.cc/150?img=43",
      'indicate_status': "Failed",
      'receiver_bank': "767 322 324",
    },
    {
      'receiver_name': 'Naruto Uzumaki',
      'currency': '¥',
      'receiver_email': 'naruto@example.com',
      'receiver_money': 234.32,
      'receiver_image': "https://i.pravatar.cc/150?img=1",
      'indicate_status': "Failed",
      'receiver_bank': "767 322 324",
    },
    {
      'receiver_name': 'Jane Doe',
      'currency': '¥',
      'receiver_email': 'janedoe@example.com',
      'receiver_money': 1321,
      'receiver_image': "https://i.pravatar.cc/150?img=55",
      'indicate_status': "Completed",
      'receiver_bank': "767 322 324",
    },
    {
      'receiver_name': 'Jona Hello',
      'currency': 'BRL',
      'receiver_email': 'jona@example.com',
      'receiver_money': 543543,
      'receiver_image': "https://i.pravatar.cc/150?img=32",
      'indicate_status': "Completed",
      'receiver_bank': "767 322 324",
    },
    {
      'receiver_name': 'Thida Kim',
      'currency': 'Riel',
      'receiver_email': 'thida@example.com',
      'receiver_money': 32445,
      'receiver_image': "https://i.pravatar.cc/150?img=44",
      'indicate_status': "Completed",
      'receiver_bank': "767 322 324",
    },
    {
      'receiver_name': 'Chan Thou',
      'currency': 'Riel',
      'receiver_email': 'chanthou@example.com',
      'receiver_money': 134242545,
      'receiver_image': "https://i.pravatar.cc/150?img=21",
      'indicate_status': "Completed",
      'receiver_bank': "324 111 221",
    },
    {
      'receiver_name': 'Kim Heng',
      'currency': 'USD',
      'receiver_email': 'kimheng1202@example.com',
      'receiver_money': 5000,
      'receiver_image': "https://i.pravatar.cc/150?img=52",
      'indicate_status': "Completed",
      'receiver_bank': "077 500 743",
    }
  ];
}
