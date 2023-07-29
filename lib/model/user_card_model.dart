class UserCardModel {
  String? cardType;
  String? cardNumber;
  String? cardOwnerName;
  UserCardModel({this.cardNumber, this.cardOwnerName, this.cardType});




  factory UserCardModel.fromJson(Map<String, dynamic> json) {
    return UserCardModel(
      cardNumber: json['card_number'],
      cardOwnerName: json['owner_name'],
      cardType: json['card_type']
    );
  }

  Map<String, dynamic> toJson() => {
    'card_type': cardType,
    'card_number': cardNumber,
    'owner_name': cardOwnerName,
  };


  }