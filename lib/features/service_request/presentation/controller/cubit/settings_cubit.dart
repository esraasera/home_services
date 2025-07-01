import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/helpers/shared_prefs_helper.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/settings_states.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(BuildContext context) : super(SettingsInitial()) {
    isDark = CacheHelper.getData("isDark") ?? false;
    currentLanguage = CacheHelper.getData("lang") ?? "en".tr();

    context.setLocale(Locale(currentLanguage));
  }

  static SettingsCubit get(context) => BlocProvider.of(context);

  late bool isDark;
  late String currentLanguage;

  void toggleTheme() {
    isDark = !isDark;
    CacheHelper.putData(key: "isDark", value: isDark);
    emit(SettingsUpdated());
  }

  void changeLanguage(String langCode, BuildContext context) {
    currentLanguage = langCode;
    CacheHelper.putData(key: 'lang', value: langCode);
    context.setLocale(Locale(currentLanguage));
    emit(SettingsUpdated());
  }

  Future<void> logout() async {
    await CacheHelper.removeData("userId");
    emit(SettingsLoggedOut());
  }
}
