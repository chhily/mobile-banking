class UserModel {
  String? currencyName;
  String? currencySymbol;
  num? totalAmount;
  String? userName;
  String? userBankAccountName;
  String? userBankAccountNumber;
  String? userProfile;

  List<UserBankInfo>? userBankInfoList;

  UserModel({
    this.currencyName,
    this.currencySymbol,
    this.totalAmount,
    this.userBankAccountName,
    this.userBankAccountNumber,
    this.userName,
    this.userProfile,
    this.userBankInfoList,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      currencyName: json['currency_name'],
      currencySymbol: json['symbol'],
      totalAmount: json['amount'],
      userBankAccountName: json['bank_account'],
      userBankAccountNumber: json['bank_number'],
      userName: json['username'],
      userProfile: json['user_profile'],
      // userBankInfo: json["bank_info"] != null
      //     ? UserBankInfo.fromJson(json["bank_info"])
      //     : null,
      userBankInfoList: json["bank_info"] == null
          ? []
          : List<UserBankInfo>.from(
              json["bank_info"].map((x) => UserBankInfo.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "username": userName,
        // 'amount': totalAmount,
        // 'currency_name': currencyName,
        // 'symbol': currencySymbol,
        'bank_account': userBankAccountName,
        'bank_number': userBankAccountNumber,
        'user_profile': userProfile,
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
