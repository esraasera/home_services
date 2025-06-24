import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/confirmation/presentation/screens/confirmation_screen.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/stepper_states.dart';
import 'package:home_services_app/features/service_request/presentation/screens/payment_screen.dart';
import 'package:home_services_app/features/service_request/presentation/screens/services_screen.dart';
import 'package:home_services_app/features/service_request/presentation/screens/user_info_screen.dart';

class StepperCubit extends Cubit<StepperState> {
  StepperCubit() : super(StepperInitial());

  static StepperCubit get(context) => BlocProvider.of(context);

  int currentStep = 0;
  static bool isLast = true ;
  bool isDrawerOpened = false;
  final GlobalKey<FormState> userInfoFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();



  List<Widget> get stepScreens => [
    UserInfoScreen(
      formKey: userInfoFormKey,
      nameController: nameController,
      numberController: numberController,
      addressController: addressController,
    ),
    ServicesScreen(),
    PaymentScreen(),
  ];


  final List<String> stepTitles = [
    AppStrings.customerInformation,
    AppStrings.chooseService,
    AppStrings.payment,
  ];

  int get totalSteps => stepScreens.length;

  int get displayStep => (currentStep < totalSteps) ? currentStep + 1 : totalSteps;



  void isLastStep(){
  if (currentStep < totalSteps - AppSize.s1) {
    isLast = true;
    emit(StepperChanged());
  }
  }

  void nextStepperStep(BuildContext context) {
    if (currentStep < stepScreens.length - 1) {
      currentStep++;
      emit(StepperChanged());
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ConfirmationScreen()),
      );
    }
  }
  void previousStepperStep() {
    if (currentStep > 0) {
      currentStep--;
      emit(StepperChanged());
    }
  }

  bool isDarkMode = false;
  String currentLanguage = AppStrings.en;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    emit(SettingsUpdated());
  }

  void changeLanguage(String lang) {
    currentLanguage = lang;
    emit(SettingsUpdated());
  }

  void logout() {
    emit(SettingsLoggedOut());
  }

}