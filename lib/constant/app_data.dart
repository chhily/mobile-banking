import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_practice/model/user_model.dart';
import 'package:ui_practice/util/helper.dart';

class AppData {
  static Map<String, dynamic> userDefaultAccount = {
    'currency_name': "Khmer Riel",
    "symbol": "Riel",
    'amount': 43287400,
    'username': "Chhily Lim",
    'link': "https://pay.ababank.com/ViBqrBUCDk7QZ69J8",
    'bank_account': "Lim Chhily",
    'bank_number': "003 001 222",
    'account_type': "Mobile Saving",
    'qr_image': AppHelper.assetString('qr_1'),
  };

  static List<UserBankList> bankAccountData = [
    UserBankList(
      // currencyName: "Khmer Riel",
      // currencySymbol: "Riel",
      // totalAmount: 43287400,
      link: "https://pay.ababank.com/ViBqrBUCDk7QZ69J8",
      qrCode: AppHelper.assetString('qr_1'),
      userName: "Lim Chhily",
      // userAccountNumber: "003 001 222",
      dayLimited: "Unlimited",
      // accountType: "Mobile Saving",
      userDefaultAccount: UserDefaultAccount(
        userBankAccountName: "Lim Chhily",
        link: "https://pay.ababank.com/ViBqrBUCDk7QZ69J8",
        userBankAccountNumber: "003 001 222",
        userName: "Lim Chhily",
        currencyName: "Khmer Riel",
        currencySymbol: "Riel",
        totalAmount: 43287400,
        accountType: "Mobile Saving",
        qrCode: AppHelper.assetString('qr_2'),
      ),
    ),
    UserBankList(
      // currencyName: "US Dollar",
      // currencySymbol: "USD",
      // totalAmount: 10000,
      userName: "Lim Chhily",
      dayLimited: "Unlimited",
      // accountType: "Mobile Saving",
      // userAccountNumber: "001 125 913",
      userDefaultAccount: UserDefaultAccount(
        currencyName: "US Dollar",
        currencySymbol: "USD",
        totalAmount: 10000,
        userBankAccountNumber: "001 125 913",
        userBankAccountName: "Lim Chhily",
        userName: "Lim Chhily",
        accountType: "Mobile Saving",
        link: "https://pay.ababank.com/txkAc9iBzoqw8XR77",
        qrCode: AppHelper.assetString('qr_3'),
      ),
    ),
    UserBankList(
      // currencyName: "Japanese Yen",
      // currencySymbol: "¥",
      // totalAmount: 9456831.55,
      userName: "Lim Chhily",
      // accountType: "Debits",
      dayLimited: "500/Day",
      // userAccountNumber: "981 913 888",
      userDefaultAccount: UserDefaultAccount(
        link: "https://pay.ababank.com/sC9PxKFWtGYipNCn6",
        userBankAccountName: "Lim Chhily",
        qrCode: AppHelper.assetString('qr_1'),
        userBankAccountNumber: "981 913 888",
        currencyName: "Japanese Yen",
        currencySymbol: "¥",
        accountType: "Credit",
        totalAmount: 9456831.55,
        userName: "Lim Chhily",
      ),
    ),
    UserBankList(
      // currencyName: "Chinese Yuan",
      // currencySymbol: "¥",
      // totalAmount: 12345.55,
      userName: "Lim Chhily",
      // accountType: "Credit",
      dayLimited: "900/Day",
      // userAccountNumber: "123 456 913",
      userDefaultAccount: UserDefaultAccount(
        currencyName: "Chinese Yuan",
        currencySymbol: "¥",
        totalAmount: 12345.55,
        userName: "Lim Chhily",
        userBankAccountNumber: "123 456 913",
        accountType: "Debit",
        link: "https://pay.ababank.com/sC9PxKFWtGYipNCn6",
        userBankAccountName: "Lim Chhily",
        qrCode: AppHelper.assetString('qr_1'),
      ),
    ),
    UserBankList(
      // currencyName: "Brazilian Real",
      // currencySymbol: "BRL",
      // totalAmount: 445.14,
      userName: "Lim Chhily",
      dayLimited: "Unlimited",
      // accountType: "Mobile Saving",
      // userAccountNumber: "666 123 897",
      userDefaultAccount: UserDefaultAccount(
          currencyName: "Brazilian Real",
          currencySymbol: "BRL",
          totalAmount: 445.14,
          userName: "Lim Chhily",
          accountType: "Mobile Saving",
          userBankAccountName: "Lim Chhily",
          link: "https://pay.ababank.com/txkAc9iBzoqw8XR77",
          userBankAccountNumber: "666 123 897",
          qrCode: AppHelper.assetString('qr_3')),
    ),
  ];

  static const Map<String, dynamic> userInfo = {
    'bank_number': "001 125 913",
    'bank_account': "Chhily Lim",
    'username': "Chhily Lim",
    'user_profile':
        "https://i.pinimg.com/564x/02/d8/83/02d8832ff1d4f84656b81ad224a38ae3.jpg",
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
