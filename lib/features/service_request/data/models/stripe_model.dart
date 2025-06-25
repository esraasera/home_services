class StripeInitModel {
  final String clientSecret;
  final String customerId;
  final String ephemeralKey;

  StripeInitModel({
    required this.clientSecret,
    required this.customerId,
    required this.ephemeralKey,
  });

  factory StripeInitModel.fromJson(Map<String, dynamic> json) {
    return StripeInitModel(
      clientSecret: json['clientSecret'],
      customerId: json['customerId'],
      ephemeralKey: json['ephemeralKey'],
    );
  }
}