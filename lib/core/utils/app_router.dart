import 'package:bmi_task/core/utils/service_locator.dart';
import 'package:bmi_task/core/utils/shared_preferences_cash_helper.dart';
import 'package:bmi_task/features/authentacation/presentation/views/auth_view.dart';
import 'package:bmi_task/features/home/presentation/views/Home_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kAuthView = '/';
  static const kHomeView = '/HomeView';

  static final router = GoRouter(
      initialLocation:
          getIt.get<CashHelperSharedPreferences>().getData(key: 'uId') == null
              ? kAuthView
              : kHomeView,
      routes: [
        GoRoute(
          path: kAuthView,
          builder: (context, state) => const AuthView(),
        ),
        GoRoute(
          path: kHomeView,
          builder: (context, state) => const HomeView(),
        )
      ]);
}
