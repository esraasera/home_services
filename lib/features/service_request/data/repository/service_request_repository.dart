import 'package:home_services_app/features/service_request/data/datasource/service_request_remote_datasource.dart';
import 'package:home_services_app/features/service_request/data/models/service_request_model.dart';
import 'package:home_services_app/features/service_request/domain/entities/service_request_entity.dart';
import 'package:home_services_app/features/service_request/domain/repository/base_service_request_repository.dart';

class ServiceRequestRepositoryImpl implements ServiceRequestRepository {
  final ServiceRequestDataSource dataSource;

  ServiceRequestRepositoryImpl(this.dataSource);

  @override
  Future<void> submitRequest(ServiceRequestEntity request) {
    final model = ServiceRequestModel.fromEntity(request);
    return dataSource.submitRequest(model);
  }
}