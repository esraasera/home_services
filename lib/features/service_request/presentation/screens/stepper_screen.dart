import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_app/core/routing/app_routes.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/features/service_request/data/datasource/service_request_remote_datasource.dart';
import 'package:home_services_app/features/service_request/data/repository/service_request_repository.dart';
import 'package:home_services_app/features/service_request/domain/usecases/service_request_usecase.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/service_request_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/stepper_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/service_request_state.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/stepper_states.dart';
import 'package:home_services_app/features/service_request/presentation/widgets/settings_drawer.dart';
import 'package:home_services_app/features/service_request/presentation/widgets/stepper_indicator.dart';

class StepperScreen extends StatelessWidget {
  StepperScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => StepperCubit()),
        BlocProvider(
          create: (context) => ServiceRequestCubit(
            ServiceRequestUseCase(
              ServiceRequestRepositoryImpl(ServiceRequestDataSourceImpl()),
            ),
          ),
        ),
      ],
      child: BlocListener<ServiceRequestCubit, ServiceRequestState>(
        listener: (context, state) {
          if (state is ServiceRequestSuccess) {
            Navigator.pushReplacementNamed(context, Routes.confirmationRoute);
          } else if (state is ServiceRequestFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${"errorOccurred".tr()} ${state.error}"),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
        child: BlocConsumer<StepperCubit, StepperState>(
          listener: (context, state) {},
          builder: (context, state) {
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
              drawerEdgeDragWidth: 0.2.sw,
              drawer: const SettingsDrawer(),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      StepperIndicator(
                        currentStep: stepperCubit.displayStep,
                        title: stepperCubit.stepTitles[stepperCubit.currentStep],
                        totalSteps: stepperCubit.totalSteps,
                        nextTitle: (stepperCubit.currentStep < stepperCubit.totalSteps - 1)
                            ? stepperCubit.stepTitles[stepperCubit.displayStep]
                            : '',
                      ),
                      SizedBox(height: 16.h),
                      Expanded(
                        child: stepperCubit.stepScreens[stepperCubit.currentStep],
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<ServiceRequestCubit, ServiceRequestState>(
                            builder: (context, state) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.white,
                                  foregroundColor: AppColors.primary,
                                  disabledBackgroundColor: AppColors.disableColor,
                                  disabledForegroundColor: AppColors.darkGrey,
                                  minimumSize: Size(140.w, 60.h),
                                ),
                                onPressed: (stepperCubit.currentStep == 0 ||
                                    stepperCubit.currentStep == stepperCubit.totalSteps - 1 &&
                                        serviceCubit.selectedMethod != null)
                                    ? null
                                    : stepperCubit.previousStepperStep,
                                child: Text("back".tr()),
                              );
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(140.w, 60.h),
                            ),
                            onPressed: () async {
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
                              } else if (stepperCubit.currentStep == 1) {
                                if (serviceCubit.serviceName == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("serviceError".tr()),
                                      duration: const Duration(seconds: 3),
                                      backgroundColor: AppColors.error,
                                    ),
                                  );
                                } else {
                                  stepperCubit.nextStepperStep(context);
                                }
                              } else {
                                if (serviceCubit.selectedMethod == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("selectedMethodError".tr()),
                                      duration: const Duration(seconds: 3),
                                      backgroundColor: AppColors.error,
                                    ),
                                  );
                                } else {
                                  await serviceCubit.submitRequest();
                                }
                              }
                            },
                            child: Text(
                              stepperCubit.currentStep == stepperCubit.totalSteps - 1
                                  ? "confirm".tr()
                                  : "next".tr(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
