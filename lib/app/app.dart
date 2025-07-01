import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/helpers/shared_prefs_helper.dart';
import 'package:home_services_app/core/routing/app_routes.dart';
import 'package:home_services_app/core/theme/app_theme.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/settings_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/settings_states.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  String getInitialRoute() {
    final userId = CacheHelper.getData('userId');
    if (userId != null && userId is String && userId.isNotEmpty) {
      return Routes.stepperRoute;
    } else {
      return Routes.splashRoute;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getApplicationTheme(),
          darkTheme: getDarkTheme(),
          themeMode: SettingsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          initialRoute: getInitialRoute(),
          onGenerateRoute: RouteGenerator.getRoute,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
        );
      },
    );
  }
}

