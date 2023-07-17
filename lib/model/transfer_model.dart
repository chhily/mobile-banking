class TransferModel {
  String receiverName;
  String receiverEmail;
  num receiverMoney;
  String receiverCurrencySymbol;
  String receiverImage;
  String indicateStatus;
  String? bankNumber;

  TransferModel({
    required this.receiverName,
    required this.receiverCurrencySymbol,
    required this.receiverEmail,
    required this.receiverMoney,
    required this.receiverImage,
    required this.indicateStatus,
    this.bankNumber,
  });

  factory TransferModel.fromJson(Map<String, dynamic> json) {
    return TransferModel(
      receiverName: json["receiver_name"],
      receiverCurrencySymbol: json["currency"],
      receiverEmail: json["receiver_email"],
      receiverMoney: json["receiver_money"],
      receiverImage: json["receiver_image"],
      indicateStatus: json["indicate_status"],
      bankNumber: json["receiver_bank"],
    );
  }
}
