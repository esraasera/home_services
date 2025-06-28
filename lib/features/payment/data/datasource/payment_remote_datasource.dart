import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class PaymentRemoteDataSource {
  Future<String> makePayment({required int amount, required String currency});
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  @override
  Future<String> makePayment({required int amount, required String currency}) async {
    final url = Uri.parse('https://api.stripe.com/v1/payment_intents');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET_KEY']}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'amount': amount.toString(),
        'currency': currency,
        'payment_method_types[]': 'card',
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return body['client_secret'];
    } else {
      throw Exception('Stripe Payment Failed: ${response.body}');
    }
  }
  }
