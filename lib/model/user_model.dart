class UserModel {
  String currencyValue;
  String currencySymbol;
  num totalAmount;

  UserModel({
    required this.currencyValue,
    required this.currencySymbol,
    required this.totalAmount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      currencyValue: json['name'],
      currencySymbol: json['symbol'],
      totalAmount: json['amount'],
    );
  }
}
