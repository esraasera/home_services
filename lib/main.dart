import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:home_services_app/app/app.dart';
import 'package:home_services_app/core/bloc_observer.dart';
import 'package:home_services_app/core/helpers/shared_prefs_helper.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/settings_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await dotenv.load(fileName: ".env");
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
  await CacheHelper.init();
  await Stripe.instance.applySettings();

  runApp(
    EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: Locale(CacheHelper.getData('lang') ?? 'en'),
      child: BlocProvider(
        create: (context) => SettingsCubit(context),
        child: const MyApp(),
      ),
    ),
  );
}
