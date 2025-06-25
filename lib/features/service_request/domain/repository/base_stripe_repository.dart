import 'package:home_services_app/features/service_request/data/models/stripe_model.dart';

abstract class PaymentRepository {
  Future<StripeInitModel> initializePayment(String serviceId);
}