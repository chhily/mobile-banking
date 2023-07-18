class UserModel {
  // String? currencyName;
  // String? currencySymbol;
  // num? totalAmount;
  String? userName;
  String? userBankAccountName;
  String? userBankAccountNumber;
  String? userProfile;
  List<UserBankInfo>? userBankInfoList;
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
            : List<UserBankInfo>.from(
                json["bank_info"].map((x) => UserBankInfo.fromJson(x))),
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

class UserBankInfo {
  String? currencyName;
  String? currencySymbol;
  num? totalAmount;

  UserBankInfo({this.totalAmount, this.currencySymbol, this.currencyName});

  factory UserBankInfo.fromJson(Map<String, dynamic> json) {
    return UserBankInfo(
      currencyName: json['currency_name'],
      currencySymbol: json['symbol'],
      totalAmount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': totalAmount,
        'currency_name': currencyName,
        'symbol': currencySymbol,
      };
}

class UserDefaultAccount {
  String? currencyName;
  String? currencySymbol;
  num? totalAmount;
  UserDefaultAccount(
      {this.totalAmount, this.currencySymbol, this.currencyName});
  factory UserDefaultAccount.fromJson(Map<String, dynamic> json) {
    return UserDefaultAccount(
      currencyName: json['currency_name'],
      currencySymbol: json['symbol'],
      totalAmount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': totalAmount,
        'currency_name': currencyName,
        'symbol': currencySymbol,
      };
}
