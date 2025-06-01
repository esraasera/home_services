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
      child: BlocConsumer<StepperCubit, StepperState>(
        listener: (context, state) {
          // هنا تقدر تضيف أي استجابات جانبية على تغيير الحالة
        },
        builder: (context, state) {
          var cubit = StepperCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text('Stepper with Circular Steps'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Row الدوائر مع أرقام الخطوات
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      cubit.steps.length,
                          (index) {
                        bool isActive = index == cubit.currentStep;
                        bool isCompleted = index < cubit.currentStep;
                        return GestureDetector(
                          onTap: () => cubit.goToStep(index),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: isActive
                                  ? Colors.blue
                                  : isCompleted
                                  ? Colors.green
                                  : Colors.grey[300],
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: isActive || isCompleted
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 30),

                  // محتوى الخطوة الحالية
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: cubit.steps[cubit.currentStep].content,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // أزرار التحكم (Back - Next)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: cubit.currentStep > 0
                            ? cubit.previousStepperStep
                            : null,
                        child: const Text('Back'),
                      ),
                      const SizedBox(width: 30),
                      ElevatedButton(
                        onPressed: cubit.currentStep < cubit.steps.length - 1
                            ? cubit.nextStepperStep
                            : null,
                        child: const Text('Next'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
