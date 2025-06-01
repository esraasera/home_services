import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/stepper_states.dart';

class StepperCubit extends Cubit<StepperState> {
  StepperCubit() : super(StepperInitial());

  static StepperCubit get(context) => BlocProvider.of(context);

  int currentStep = 0;

  final List<Widget> stepScreens = [
    // استبدل هنا بشاشاتك الحقيقية
    Center(child: Text('Step 1')),
    Center(child: Text('Step 2')),
    Center(child: Text('Step 3')),
  ];

  final List<String> stepTitles = [
    'Step 1',
    'Step 2',
    'Step 3',
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