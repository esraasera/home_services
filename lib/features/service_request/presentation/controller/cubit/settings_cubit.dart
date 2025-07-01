import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/helpers/shared_prefs_helper.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/settings_states.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial()) {
    isDark = CacheHelper.getData("isDark") ?? false;
  }

  static SettingsCubit get(context) => BlocProvider.of(context);

  late bool isDark;
  String currentLanguage = AppStrings.en;

  void toggleTheme() {
    isDark = !isDark;
    CacheHelper.putData(key: "isDark", value: isDark);
    emit(SettingsUpdated());
  }

  void changeLanguage(String lang) {
    currentLanguage = lang;
    emit(SettingsUpdated());
  }

  void logout()  async{
    await CacheHelper.removeData("userId");
    emit(SettingsLoggedOut());
  }
}
