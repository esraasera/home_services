import 'package:home_services_app/features/service_request/domain/entities/service_request_entity.dart';

abstract class ServiceRequestRepository {
  Future<void> submitRequest(ServiceRequestEntity request);
}
