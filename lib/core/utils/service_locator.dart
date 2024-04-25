import 'package:bmi_task/features/authentacation/data/auth_repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

import 'shared_preferences_cash_helper.dart';

final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerSingleton<CashHelperSharedPreferences>(
      CashHelperSharedPreferences());

  getIt.registerSingleton<AuthRepo>(AuthRepo());
}
