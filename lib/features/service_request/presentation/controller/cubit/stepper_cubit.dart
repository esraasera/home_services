import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/features/confirmation/presentation/screens/confirmation_screen.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/stepper_states.dart';
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
    PaymentScreen(),
  ];

  final List<String> stepTitles = [
    AppStrings.customerInformation,
    AppStrings.chooseService,
    AppStrings.paymentAndConfirmation,
  ];

  int get totalSteps => stepScreens.length;

  int get displayStep => (currentStep < totalSteps) ? currentStep + 1 : totalSteps;


  void nextStepperStep(BuildContext context) {
    if (currentStep < stepScreens.length - 1) {
      currentStep++;
      emit(StepperChanged());
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ConfirmationScreen()),
      );
    }
  }
  void previousStepperStep() {
    if (currentStep > 0) {
      currentStep--;
      emit(StepperChanged());
    }
  }

}