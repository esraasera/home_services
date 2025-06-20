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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context)=>StepperCubit(),
      child: BlocConsumer<StepperCubit,StepperState>(
        listener: (context,state) {  },
        builder: (context,state) {
          var cubit = StepperCubit.get(context);
          return Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(screenHeight * AppPadding.p0_02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      StepperIndicator(
                        currentStep:cubit.displayStep,
                        title: cubit.stepTitles[cubit.currentStep],
                        totalSteps: cubit.totalSteps,
                        nextTitle: (cubit.currentStep < cubit.totalSteps - AppSize.s1)
                      ? cubit.stepTitles[cubit.displayStep]
                      : '',
                      ),
                    SizedBox(
                      height: screenHeight * AppSize.s0_02,
                    ),
                    Expanded(child: cubit.stepScreens[cubit.currentStep]),
                      SizedBox(
                        height: screenHeight * AppSize.s0_02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style:ElevatedButton.styleFrom(
                              backgroundColor: AppColors.white,
                              foregroundColor: AppColors.primary,
                                minimumSize: Size( screenWidth * AppSize.s0_35 , screenHeight * AppSize.s0_075),
                            ) ,
                             onPressed: cubit.currentStep > AppSize.s0 ? cubit.previousStepperStep : null,
                              child:Text(AppStrings.back)
                          ),
                          ElevatedButton(
                              style:ElevatedButton.styleFrom(
                                minimumSize: Size( screenWidth * AppSize.s0_35 , screenHeight * AppSize.s0_075),
                              ),
                              onPressed: () {
                                final formKey = cubit.userInfoFormKey;

                                if (cubit.currentStep != 0 || (formKey.currentState?.validate() ?? false)) {
                                  cubit.nextStepperStep(context);
                                }
                              },

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