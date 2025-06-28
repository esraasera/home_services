import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/features/payment/domain/usecases/make_payment_intent_usecase.dart';
import 'package:home_services_app/features/payment/domain/usecases/show_stripe_sheet_usecase.dart';
import 'package:home_services_app/features/payment/presentation/controller/states/stripe_states.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/service_request_cubit.dart';

class StripeCubit extends Cubit<StripeState> {
  final MakePaymentUseCase makePaymentUseCase;
  final ShowStripeSheetUseCase showStripeSheetUseCase;

  StripeCubit(this.makePaymentUseCase, this.showStripeSheetUseCase)
      : super(StripeInitial());

  Future<void> makePaymentAndShowSheet({
    required int amount,
    required String currency,
    required BuildContext context,
  }) async {
    final serviceCubit = ServiceRequestCubit.get(context);

    if (serviceCubit.selectedMethod != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.methodSelected), backgroundColor: Colors.red,),
      );
      return;
    }

    if (isClosed) return;
    emit(StripeLoading());
    try {
      final clientSecret = await makePaymentUseCase.call(
        amount: amount,
        currency: currency,
      );

      await showStripeSheetUseCase.call(clientSecret: clientSecret);

      if (isClosed) return;
      emit(StripeSuccess());
      serviceCubit.selectMethod(AppStrings.card);
    } catch (e) {
      if (isClosed) return;
      emit(StripeFailure(error: e.toString()));
    }
  }

}
