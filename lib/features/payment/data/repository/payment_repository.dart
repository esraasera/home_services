import 'package:home_services_app/features/payment/data/datasource/payment_remote_datasource.dart';
import 'package:home_services_app/features/payment/domain/repository/base_payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource dataSource;

  PaymentRepositoryImpl(this.dataSource);

  @override
  Future<String> makePayment({required int amount, required String currency}) {
    return dataSource.makePayment(amount: amount, currency: currency);
  }
}