import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/stepper_states.dart';
import 'package:home_services_app/features/service_request/presentation/screens/location_screen.dart';
import 'package:home_services_app/features/service_request/presentation/screens/payment_screen.dart';
import 'package:home_services_app/features/service_request/presentation/screens/services_screen.dart';
import 'package:home_services_app/features/service_request/presentation/screens/user_info_screen.dart';

class StepperCubit extends Cubit <StepperState>{
  StepperCubit() : super(StepperInitial());
  static StepperCubit get(context) => BlocProvider.of(context);

  int currentStep = 0 ;


  final List<Step> steps = [
    Step(
      title: Text('Service'),
      content: ServicesScreen(),
      isActive: true,
    ),
    Step(
      title: Text('Details'),
      content: UserInfoScreen(),
      isActive: true,
    ),
    Step(
      title: Text('Address'),
      content: LocationScreen(),
      isActive: true,
    ),
    Step(
      title: Text('Payment'),
      content: PaymentScreen(),
      isActive: true,
    ),
  ];

  void nextStepperStep (){
    if (currentStep < steps.length - 1){
      currentStep ++ ;
      emit(StepperNextStep());
    }
  }

  void previousStepperStep (){
    if(currentStep > 0){
      currentStep --;
      emit(StepperPreviousStep());
    }
  }

  void goToStep(int index) {
    if (index >= 0 && index <= 4) {
      currentStep = index;
      emit(StepperChangeStep());
    }
  }

}