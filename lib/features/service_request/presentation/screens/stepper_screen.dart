import 'package:flutter/material.dart';
import 'package:home_services_app/features/service_request/presentation/widgets/stepper_indicator.dart';

class StepperScreen extends StatelessWidget {
  const StepperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: StepperIndicator(currentStep: 3,title: "zth",listItems: 6,)
      )
    );
  }
}