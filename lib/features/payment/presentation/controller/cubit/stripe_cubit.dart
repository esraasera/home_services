import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/features/payment/domain/usecases/make_payment_intent_usecase.dart';
import 'package:home_services_app/features/payment/domain/usecases/show_stripe_sheet_usecase.dart';
import 'package:home_services_app/features/payment/presentation/controller/states/stripe_states.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/service_request_cubit.dart';

class StripeCubit extends Cubit<StripeState> {
  final MakePaymentUseCase makePaymentUseCase;
  final ShowStripeSheetUseCase showStripeSheetUseCase;

  StripeCubit(this.makePaymentUseCase, this.showStripeSheetUseCase)
      : super(StripeInitial());

  bool _isProcessing = false;

  Future<void> makePaymentAndShowSheet({
    required int amount,
    required String currency,
    required BuildContext context,
  }) async {
    if (_isProcessing || isClosed) return;
    _isProcessing = true;

    final serviceCubit = ServiceRequestCubit.get(context);
    emit(StripeLoading());

    try {
      final clientSecret = await makePaymentUseCase.call(
        amount: amount,
        currency: currency,
      );

      await showStripeSheetUseCase.call(clientSecret: clientSecret);

      if (isClosed) return;
      emit(StripeSuccess());
      serviceCubit.selectMethod("card".tr());
      _isProcessing = false;
    } catch (e) {
      if (isClosed) return;
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "paymentError".tr(),
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: AppColors.error,
          ),
        );
        emit(StripeFailure(error: e.toString()));
        print(e.toString());
        _isProcessing = false;
      }
    }
  }
}
