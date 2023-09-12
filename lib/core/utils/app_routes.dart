import 'package:go_router/go_router.dart';
import 'package:movie_app/features/main_wrapper/main_wrapper_page.dart';
import 'package:movie_app/features/auth/ui/login_page.dart';
import 'package:movie_app/features/auth/ui/sign_page.dart';
import 'package:movie_app/features/movies/ui/movie_page.dart';
import 'package:movie_app/features/splash/ui/splash_page.dart';

//for navigating between pages and sending data
final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'splash page',
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
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
    GoRoute(
      name: 'main wrapper page',
      path: '/',
      builder: (context, state) => const MainWrapperPage(),
    ),
    GoRoute(
      name: 'movie page',
      path: '/movie',
      builder: (context, state) => const MoviePage(),
    ),
  ],
);
