import 'package:forms_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/cubit',
      builder: (context, state) {
        return const CubitCounterScreen();
      },
    ),
    GoRoute(
      path: '/bloc',
      builder: (context, state) {
        return const BlocCounterScreen();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) {
        return const RegisterScreen();
      },
    )
  ],
);
