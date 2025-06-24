import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/settings_states.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  static SettingsCubit get(context) => BlocProvider.of(context);

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
