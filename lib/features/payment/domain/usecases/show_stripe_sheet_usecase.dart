import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class ShowStripeSheetUseCase {
  Future<void> call({required String clientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: 'My Service App',
        style: ThemeMode.system,
        billingDetails: BillingDetails(
          address: Address(
            line1: 'Cairo, Egypt',
            line2: '',
            city: 'Cairo',
            country: 'EG',
            state: 'Cairo',
            postalCode: '11311',
          ),
        ),
      ),
    );

    await Stripe.instance.presentPaymentSheet();
  }
}
