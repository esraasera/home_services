import 'package:flutter/material.dart';
import 'package:home_services_app/core/routing/app_routes.dart';
import 'package:home_services_app/core/theme/app_theme.dart';

class MyApp extends StatefulWidget {

  const MyApp._internal();

  static final _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}