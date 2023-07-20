class UserModel {
  // String? currencyName;
  // String? currencySymbol;
  // num? totalAmount;
  String? userName;
  String? userBankAccountName;
  String? userBankAccountNumber;
  String? userProfile;
  List<UserBankList>? userBankInfoList;
  UserDefaultAccount? userDefaultAccount;

  UserModel({
    // this.currencyName,
    // this.currencySymbol,
    // this.totalAmount,
    this.userBankAccountName,
    this.userBankAccountNumber,
    this.userName,
    this.userProfile,
    this.userBankInfoList,
    this.userDefaultAccount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userBankAccountName: json['bank_account'],
        userBankAccountNumber: json['bank_number'],
        userName: json['username'],
        userProfile: json['user_profile'],
        userBankInfoList: json["bank_info"] == null
            ? []
            : List<UserBankList>.from(
                json["bank_info"].map((x) => UserBankList.fromJson(x))),
        userDefaultAccount: json['default_bank'] == null
            ? null
            : UserDefaultAccount.fromJson(json['default_bank']));
  }

  Map<String, dynamic> toJson() => {
        "username": userName,
        'bank_account': userBankAccountName,
        'bank_number': userBankAccountNumber,
        'user_profile': userProfile,
        'bank_info': userBankInfoList,
        'default_bank': userDefaultAccount,
      };
}

class UserBankList {
  String? currencyName;
  String? currencySymbol;
  num? totalAmount;
  String? userName;
  String? accountType;
  String? userAccountNumber;
  String? dayLimited;
  String? qrCode;
  String? link;

  UserDefaultAccount? userDefaultAccount;

  UserBankList({
    this.totalAmount,
    this.currencySymbol,
    this.currencyName,
    this.userAccountNumber,
    this.accountType,
    this.userName,
    this.dayLimited,
    this.qrCode,
    this.link,
    this.userDefaultAccount,
  });

  factory UserBankList.fromJson(Map<String, dynamic> json) {
    return UserBankList(
      currencyName: json['currency_name'],
      currencySymbol: json['symbol'],
      totalAmount: json['amount'],
      accountType: json['account_type'],
      userAccountNumber: json['bank_number'],
      userName: json['username'],
      dayLimited: json['day_limited'],
      qrCode: json['qr_image'],
      link: json['link'],
      userDefaultAccount: json['default_bank'] == null
          ? null
          : UserDefaultAccount.fromJson(json['default_bank']),
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': totalAmount,
        'currency_name': currencyName,
        'symbol': currencySymbol,
        "username": userName,
        "bank_number": userAccountNumber,
        "account_type": accountType,
        "day_limited": dayLimited,
        "link": link,
        "qr_image": qrCode,
        'default_bank': userDefaultAccount,
      };
}

class UserDefaultAccount {
  String? currencyName;
  String? currencySymbol;
  num? totalAmount;
  String? userName;
  String? userBankAccountName;
  String? userBankAccountNumber;
  String? qrCode;
  String? link;

  UserDefaultAccount({
    this.totalAmount,
    this.currencySymbol,
    this.currencyName,
    this.userBankAccountName,
    this.userBankAccountNumber,
    this.userName,
    this.qrCode,
    this.link,
  });
  factory UserDefaultAccount.fromJson(Map<String, dynamic> json) {
    return UserDefaultAccount(
      currencyName: json['currency_name'],
      currencySymbol: json['symbol'],
      totalAmount: json['amount'],
      userBankAccountName: json['bank_account'],
      userBankAccountNumber: json['bank_number'],
      userName: json['username'],
      qrCode: json['qr_image'],
      link: json['link'],
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': totalAmount,
        'currency_name': currencyName,
        'symbol': currencySymbol,
        "username": userName,
        'bank_account': userBankAccountName,
        'bank_number': userBankAccountNumber,
        "link": link,
        "qr_image": qrCode
      };
}
