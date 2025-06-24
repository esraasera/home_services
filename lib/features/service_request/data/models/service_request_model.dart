class ServiceRequest {
  final String name;
  final String phone;
  final String address;
  final String serviceName;
  final double servicePrice;
  final String paymentMethod;

  ServiceRequest({
    required this.name,
    required this.phone,
    required this.address,
    required this.serviceName,
    required this.servicePrice,
    required this.paymentMethod,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'serviceName': serviceName,
      'servicePrice': servicePrice,
      'paymentMethod': paymentMethod,
    };
  }
}
