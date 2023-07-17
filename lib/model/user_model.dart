class UserModel {
  String? currencyName;
  String? currencySymbol;
  num? totalAmount;
  String? userName;
  String? userBankAccountName;
  String? userBankAccountNumber;
  String? userProfile;

  UserModel({
    this.currencyName,
    this.currencySymbol,
    this.totalAmount,
    this.userBankAccountName,
    this.userBankAccountNumber,
    this.userName,
    this.userProfile,
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
    );
  }

  Map<String, dynamic> toJson() => {
        "username": userName,
        'amount': totalAmount,
        'currency_name': currencyName,
        'symbol': currencySymbol,
        'bank_account': userBankAccountName,
        'bank_number': userBankAccountNumber,
        'user_profile': userProfile,
      };
}
