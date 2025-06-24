import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/service_request/data/datasource/service_request_remote_datasource.dart';
import 'package:home_services_app/features/service_request/data/repository/service_request_repository.dart';
import 'package:home_services_app/features/service_request/domain/usecases/service_request_usecase.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/service_request_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/settings_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/stepper_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/stepper_states.dart';
import 'package:home_services_app/features/service_request/presentation/widgets/settings_drawer.dart';
import 'package:home_services_app/features/service_request/presentation/widgets/stepper_indicator.dart';

class StepperScreen extends StatelessWidget {
  StepperScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => StepperCubit()),
        BlocProvider(create: (context) => SettingsCubit()),
        BlocProvider(create: (context) => ServiceRequestCubit(
            ServiceRequestUseCase(
                ServiceRequestRepositoryImpl(ServiceRequestDataSourceImpl())))),
      ],
      child: BlocConsumer<StepperCubit,StepperState>(
        listener: (context,state) {  },
        builder: (context,state) {
          final stepperCubit = StepperCubit.get(context);
          final serviceCubit = ServiceRequestCubit.get(context);
          if (!stepperCubit.isDrawerOpened) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              scaffoldKey.currentState?.openDrawer();
              stepperCubit.isDrawerOpened = true;
            });
          }
          return Scaffold(
              key: scaffoldKey,
              drawerEdgeDragWidth:screenWidth * AppSize.s0_2,
              drawer: const SettingsDrawer(),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(screenHeight * AppPadding.p0_02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      StepperIndicator(
                        currentStep:stepperCubit.displayStep,
                        title: stepperCubit.stepTitles[stepperCubit.currentStep],
                        totalSteps: stepperCubit.totalSteps,
                        nextTitle: (stepperCubit.currentStep < stepperCubit.totalSteps - AppSize.s1)
                      ? stepperCubit.stepTitles[stepperCubit.displayStep]
                      : '',
                      ),
                    SizedBox(
                      height: screenHeight * AppSize.s0_02,
                    ),
                    Expanded(child: stepperCubit.stepScreens[stepperCubit.currentStep]),
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
                             onPressed: stepperCubit.currentStep > AppSize.s0 ? stepperCubit.previousStepperStep : null,
                              child:Text(AppStrings.back)
                          ),
                          ElevatedButton(
                              style:ElevatedButton.styleFrom(
                                minimumSize: Size( screenWidth * AppSize.s0_35 , screenHeight * AppSize.s0_075),
                              ),
                              onPressed: () {
                                if (stepperCubit.currentStep == 0) {
                                  final formKey = stepperCubit.userInfoFormKey;
                                  if (formKey.currentState?.validate() ?? false) {
                                    serviceCubit.setUserData(
                                      name: stepperCubit.nameController.text,
                                      phone: stepperCubit.numberController.text,
                                      address: stepperCubit.addressController.text,
                                    );
                                    stepperCubit.nextStepperStep(context);
                                  }
                                }
                                else if (stepperCubit.currentStep == 1) {
                                  if (serviceCubit.serviceName == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(AppStrings.serviceError),
                                        backgroundColor: AppColors.error,
                                      ),
                                    );
                                  } else {
                                    stepperCubit.nextStepperStep(context);
                                  }
                                }
                                else {
                                  stepperCubit.nextStepperStep(context);
                                }
                              },
                            child: Text(
                              stepperCubit.currentStep == stepperCubit.totalSteps - 1
                                  ? AppStrings.confirm
                                  : AppStrings.next,
                            ),

                          )
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