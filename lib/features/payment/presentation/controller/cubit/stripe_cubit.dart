import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/features/payment/domain/usecases/payment_use%20case.dart';
import 'package:home_services_app/features/payment/presentation/controller/states/stripe_states.dart';

class StripeCubit extends Cubit<StripeState> {
  final PaymentUseCase makePaymentUseCase;

  StripeCubit(this.makePaymentUseCase) : super(StripeInitial());

  Future<void> makePayment({required int amount, required String currency}) async {
    emit(StripeLoading());
    try {
      await makePaymentUseCase(amount: amount, currency: currency);
      emit(StripeSuccess());
    } catch (e) {
      emit(StripeFailure(error: e.toString()));
    }
  }
}