import 'package:home_services_app/features/service_request/domain/entities/service_request_entity.dart';
import 'package:home_services_app/features/service_request/domain/repository/base_service_request_repository.dart';

class ServiceRequestUseCase{
  ServiceRequestRepository repository;
  ServiceRequestUseCase({required this.repository});

  Future<void> call(ServiceRequestEntity request) {
    return repository.submitRequest(request);
  }
}