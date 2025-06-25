abstract class PaymentRepository {
  Future<void> makePayment({required int amount, required String currency});
}