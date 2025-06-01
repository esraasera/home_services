import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/stepper_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/stepper_states.dart';

class StepperScreen extends StatelessWidget {
  const StepperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StepperCubit(),
      child: Scaffold(

        body: BlocConsumer<StepperCubit, StepperState>(
          listener: (_, __) {},
          builder: (context, state) {
            final cubit = StepperCubit.get(context);

            return Row(
              children: [
                Container(
                  width: 80,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  color: Colors.grey[100],
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.totalSteps,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      bool isActive = cubit.currentStep == index;
                      bool isCompleted = cubit.currentStep > index;

                      return GestureDetector(
                        onTap: () {
                          cubit.goToStep(index);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: isActive
                                      ? Colors.blue
                                      : isCompleted
                                      ? Colors.green
                                      : Colors.grey[400],
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                cubit.stepTitles[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight:
                                  isActive ? FontWeight.bold : FontWeight.normal,
                                  color: isActive
                                      ? Colors.blue
                                      : isCompleted
                                      ? Colors.green
                                      : Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Expanded(
                          child: cubit.stepScreens[cubit.currentStep],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (cubit.currentStep > 0)
                              ElevatedButton(
                                onPressed: cubit.previousStepperStep,
                                child: const Text('Back'),
                              )
                            else
                              const SizedBox(width: 80),
                            ElevatedButton(
                              onPressed: () {
                                if (cubit.currentStep < cubit.totalSteps - 1) {
                                  cubit.nextStepperStep();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('All steps completed!')),
                                  );
                                }
                              },
                              child: Text(
                                cubit.currentStep == cubit.totalSteps - 1
                                    ? 'Finish'
                                    : 'Next',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}