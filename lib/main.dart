import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:home_services_app/app/app.dart';
import 'package:home_services_app/core/bloc_observer.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  Stripe.publishableKey = "pk_test_51QShebDtroaiCCAHnBR31tYssblOUDDbo3nGpJHG5CfiSnSIdB18HnYts6Qi3o0Xp3BG9LGutyDarcfsffddauWP00uI1etoFE";
  runApp(MyApp());
}

