import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/stepper_states.dart';
import 'package:home_services_app/features/service_request/presentation/screens/location_screen.dart';
import 'package:home_services_app/features/service_request/presentation/screens/payment_screen.dart';
import 'package:home_services_app/features/service_request/presentation/screens/services_screen.dart';
import 'package:home_services_app/features/service_request/presentation/screens/user_info_screen.dart';


class StepperCubit extends Cubit<StepperState> {
  StepperCubit() : super(StepperInitial());

  static StepperCubit get(context) => BlocProvider.of(context);

  int currentStep = 0;

  void nextStep() {
    if (currentStep < steps.length - 1) {
      currentStep++;
      emit(StepperChanged());
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
      emit(StepperChanged());
    }
  }

  void goToStep(int index) {
    if (index >= 0 && index < steps.length) {
      currentStep = index;
      emit(StepperChanged());
    }
  }

  List<Widget> get steps => [
    const ServicesScreen(),
    const UserInfoScreen(),
    const LocationScreen(),
    const PaymentScreen(),
  ];

  List<String> get stepTitles => [
    'Service',
    'Details',
    'Address',
    'Payment',
  ];
}
