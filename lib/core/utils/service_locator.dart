import 'package:bmi_task/features/authentacation/data/auth_repo/auth_repo.dart';
import 'package:bmi_task/features/calculation/data/home_repo/home_repo.dart';
import 'package:get_it/get_it.dart';

import 'shared_preferences_cash_helper.dart';

final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerSingleton<CashHelperSharedPreferences>(
      CashHelperSharedPreferences());

  getIt.registerSingleton<AuthRepo>(AuthRepo());
  getIt.registerSingleton<HomeRepo>(HomeRepo());
}
