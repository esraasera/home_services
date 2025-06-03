import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/stepper_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/stepper_states.dart';
import 'package:home_services_app/features/service_request/presentation/widgets/stepper_indicator.dart';

class StepperScreen extends StatelessWidget {
  const StepperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>StepperCubit(),
      child: BlocConsumer<StepperCubit,StepperState>(
        listener: (context,state) {  },
        builder: (context,state) {
          var cubit = StepperCubit.get(context);
          return Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      StepperIndicator(
                        currentStep:cubit.displayStep,
                        title: cubit.stepTitles[cubit.currentStep],
                        totalSteps: cubit.totalSteps,
                        nextTitle: cubit.stepTitles[cubit.displayStep],
                      ),
                      SizedBox(
                        height: AppSize.s30,
                      ),
                    Expanded(child: cubit.stepScreens[cubit.currentStep]),
                      Row(
                        children: [
                          ElevatedButton(
                            style:ElevatedButton.styleFrom(
                              backgroundColor: AppColors.lightPrimary,
                              foregroundColor: AppColors.primary,
                                minimumSize: Size(AppSize.s120, AppSize.s55),
                            ) ,
                              onPressed:cubit.previousStepperStep,
                              child:Text(AppStrings.back)
                          ),
                          Spacer(),

                          ElevatedButton(
                              style:ElevatedButton.styleFrom(
                                minimumSize: Size(AppSize.s120, AppSize.s55),
                              ),
                              onPressed:cubit.nextStepperStep,
                              child:Text(AppStrings.next))
                        ],
                      ),
                    ],
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}