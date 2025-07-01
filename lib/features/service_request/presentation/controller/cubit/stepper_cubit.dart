import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/features/confirmation/presentation/screens/confirmation_screen.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/stepper_states.dart';
import 'package:home_services_app/features/service_request/presentation/screens/payment_screen.dart';
import 'package:home_services_app/features/service_request/presentation/screens/services_screen.dart';
import 'package:home_services_app/features/service_request/presentation/screens/user_info_screen.dart';

class StepperCubit extends Cubit<StepperState> {
  StepperCubit() : super(StepperInitial());

  static StepperCubit get(context) => BlocProvider.of(context);

  int currentStep = 0;
  bool isDrawerOpened = false;
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  final GlobalKey<FormState> userInfoFormKey = GlobalKey<FormState>();




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


  List<String> get stepTitles => [
    "customerInformation".tr(),
    "chooseService".tr(),
    "payment".tr(),
  ];

  int get totalSteps => stepScreens.length;

  int get displayStep => (currentStep < totalSteps) ? currentStep + 1 : totalSteps;


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
  String currentLanguage = "en".tr();

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