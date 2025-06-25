import 'package:home_services_app/features/payment/domain/repository/base_payment_repository.dart';

class PaymentUseCase {
  final PaymentRepository repository;

  PaymentUseCase(this.repository);

  Future<void> call({required int amount, required String currency}) {
    return repository.makePayment(amount: amount, currency: currency);
  }
}