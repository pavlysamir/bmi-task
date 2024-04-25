import 'package:bmi_task/Bmi_calculator.dart';
import 'package:bmi_task/core/utils/service_locator.dart';
import 'package:bmi_task/core/utils/shared_preferences_cash_helper.dart';
import 'package:bmi_task/core/utils/simple_bloc_observer.dart';
import 'package:bmi_task/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUpServiceLocator();
  await getIt.get<CashHelperSharedPreferences>().init();
  Bloc.observer = SimpleBlocObserver();

  runApp(const BmiCalculator());
}
