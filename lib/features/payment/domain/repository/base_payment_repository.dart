abstract class PaymentRepository {
  Future<String> makePayment({required int amount, required String currency});
}