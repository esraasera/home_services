import 'package:home_services_app/features/service_request/domain/entities/service_request_entity.dart';

class ServiceRequestModel extends ServiceRequestEntity {
  ServiceRequestModel({
    required super.userId,
    required super.name,
    required super.phone,
    required super.address,
    required super.serviceName,
    required super.servicePrice,
    required super.paymentMethod,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'phone': phone,
      'address': address,
      'serviceName': serviceName,
      'servicePrice': servicePrice,
      'paymentMethod': paymentMethod,
    };
  }
  factory ServiceRequestModel.fromEntity(ServiceRequestEntity entity) {
    return ServiceRequestModel(
      userId: entity.userId,
      name: entity.name,
      phone: entity.phone,
      address: entity.address,
      serviceName: entity.serviceName,
      servicePrice: entity.servicePrice,
      paymentMethod: entity.paymentMethod,
    );
  }
}
