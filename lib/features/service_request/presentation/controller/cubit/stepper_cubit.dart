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

  void nextStepperStep() {
    if (currentStep < steps.length - 1) {
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
    if (index >= 0 && index < steps.length) {
      currentStep = index;
      emit(StepperChanged());
    }
  }

  List<Step> get steps => [
    Step(
      title: const Text('Service'),
      content: SizedBox(height: 300, child: const ServicesScreen()),
      isActive: currentStep >= 0,
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
    ),
    Step(
      title: const Text('Details'),
      content: const UserInfoScreen(),
      isActive: currentStep >= 1,
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
    ),
    Step(
      title: const Text('Address'),
      content: const LocationScreen(),
      isActive: currentStep >= 2,
      state: currentStep > 2 ? StepState.complete : StepState.indexed,
    ),
    Step(
      title: const Text('Payment'),
      content: const PaymentScreen(),
      isActive: currentStep >= 3,
      state:
      currentStep == 3 ? StepState.editing : StepState.indexed,
    ),
  ];
}