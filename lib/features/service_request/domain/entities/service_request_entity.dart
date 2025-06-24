class ServiceRequestEntity {
  final String userId;
  final String name;
  final String phone;
  final String address;
  final String serviceName;
  final String servicePrice;
  final String paymentMethod;

  const ServiceRequestEntity({
    required this.userId,
    required this.name,
    required this.phone,
    required this.address,
    required this.serviceName,
    required this.servicePrice,
    required this.paymentMethod,
  });
}