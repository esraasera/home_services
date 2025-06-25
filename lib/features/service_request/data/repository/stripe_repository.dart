import 'package:home_services_app/features/service_request/data/datasource/payment_data_source.dart';
import 'package:home_services_app/features/service_request/domain/repository/base_stripe_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource remote;

  PaymentRepositoryImpl(this.remote);

  @override
  Future<StripeInitModel> initializePayment(String serviceId) {
    return remote.initStripe(serviceId);
  }
}