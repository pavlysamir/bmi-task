import 'package:bmi_task/features/authentacation/presentation/views/auth_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kAuthView = '/';

  static final router = GoRouter(initialLocation: kAuthView, routes: [
    GoRoute(
      path: kAuthView,
      builder: (context, state) => const AuthView(),
    ),
  ]);
}
