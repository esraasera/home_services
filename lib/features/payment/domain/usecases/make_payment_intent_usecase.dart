import 'package:home_services_app/features/payment/domain/repository/base_payment_repository.dart';

class MakePaymentUseCase {
  final PaymentRepository repository;

  MakePaymentUseCase(this.repository);

  Future<String> call({required int amount, required String currency}) {
    return repository.makePayment(amount: amount, currency: currency);
  }
}
