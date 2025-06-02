import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/stepper_states.dart';
import 'package:home_services_app/features/service_request/presentation/screens/location_screen.dart';
import 'package:home_services_app/features/service_request/presentation/screens/payment_screen.dart';
import 'package:home_services_app/features/service_request/presentation/screens/services_screen.dart';
import 'package:home_services_app/features/service_request/presentation/screens/user_info_screen.dart';

class StepperCubit extends Cubit<StepperState> {
  StepperCubit() : super(StepperInitial());

  static StepperCubit get(context) => BlocProvider.of(context);

  int currentStep = 0;

  final List<Widget> stepScreens = [
    UserInfoScreen(),
    ServicesScreen(),
    LocationScreen(),
    PaymentScreen(),
  ];

  final List<String> stepTitles = [
    'Customer Information',
    'Choose Service',
    'Address Details',
    'Payment & Confirmation',
  ];

  int get totalSteps => stepScreens.length;

  void nextStepperStep() {
    if (currentStep < stepScreens.length - 1) {
      currentStep++;
      emit(StepperChanged());
    }
  }

  void previousStepperStep() {
    if (currentStep > 0) {
      currentStep--;
      emit(StepperChanged());
    }
  }

  void goToStep(int index) {
    if (index >= 0 && index < stepScreens.length) {
      currentStep = index;
      emit(StepperChanged());
    }
  }
}