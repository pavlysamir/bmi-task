import 'package:bmi_task/core/utils/service_locator.dart';
import 'package:bmi_task/core/utils/shared_preferences_cash_helper.dart';
import 'package:bmi_task/features/authentacation/presentation/views/auth_view.dart';
import 'package:bmi_task/features/bmi_list/presentation/views/bmi_list.dart';
import 'package:bmi_task/features/calculation/presentation/views/Calculator_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kAuthView = '/';
  static const kCalculatorView = '/CalculatorView';
  static const kBmiListView = '/BmiListView';

  static final router = GoRouter(
      initialLocation:
          getIt.get<CashHelperSharedPreferences>().getData(key: 'uId') == null
              ? kAuthView
              : kCalculatorView,
      routes: [
        GoRoute(
          path: kAuthView,
          builder: (context, state) => const AuthView(),
        ),
        GoRoute(
          path: kCalculatorView,
          builder: (context, state) => const CalculatorView(),
        ),
        GoRoute(
          path: kBmiListView,
          builder: (context, state) => const BmiListView(),
        ),
      ]);
}
