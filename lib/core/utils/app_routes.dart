import 'package:go_router/go_router.dart';
import 'package:movie_app/features/auth/ui/login_page.dart';
import 'package:movie_app/features/auth/ui/sign_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/auth/login',
  routes: [
    GoRoute(
      name: 'login page',
      path: '/auth/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: 'sign page',
      path: '/auth/sign',
      builder: (context, state) => const SignPage(),
    ),
  ],
);
