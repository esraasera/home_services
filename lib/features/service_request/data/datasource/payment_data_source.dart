import 'package:dio/dio.dart';
import 'package:home_services_app/features/service_request/data/models/stripe_model.dart';

class PaymentRemoteDataSource {
  final Dio dio;

  PaymentRemoteDataSource(this.dio);

  Future<StripeInitModel> initStripe(String serviceId) async {
    final response = await dio.post("https://your-api/init-payment", data: {"service_id": serviceId});
    return StripeInitModel.fromJson(response.data);
  }
}