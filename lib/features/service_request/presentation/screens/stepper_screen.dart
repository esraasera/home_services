import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/stepper_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/stepper_states.dart';

class StepperScreen extends StatelessWidget{
  const StepperScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StepperCubit(),
      child: BlocConsumer<StepperCubit,StepperState>(
        listener: (context, state) {  },
        builder: (context,state) {
          var cubit = StepperCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body:Stepper(
              currentStep: cubit.currentStep,
              onStepContinue: () {
                cubit.nextStepperStep();
              },
              onStepCancel:(){
                cubit.previousStepperStep();
                },
              steps:cubit.steps,
              controlsBuilder: (context, details) {
                return Row(
                  children: [
                    ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: const Text("Next"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: details.onStepCancel,
                      child: const Text("Back"),
                    ),
                  ],
                );
              },),
          );
        },
      ),
    );
  }

}