import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/routing/app_routes.dart';
import 'package:home_services_app/core/theme/app_theme.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/settings_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/settings_states.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
     listener: (BuildContext context, state) {  },
     builder: (BuildContext context, state) {
       return MaterialApp(
         debugShowCheckedModeBanner: false,
         theme: getApplicationTheme(),
         darkTheme: getDarkTheme(),
         themeMode:  SettingsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
         initialRoute: Routes.splashRoute,
         onGenerateRoute: RouteGenerator.getRoute,
       );
     },

            );
  }
}
