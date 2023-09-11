import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/theme.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/di.dart';
import 'package:movie_app/features/auth/ui/bloc/auth_bloc.dart';
import 'package:movie_app/features/auth/ui/cubit/pass_visible_cubit.dart';
import 'package:movie_app/features/main_wrapper/ui/cubit/main_wrapper_cubit.dart';
import 'package:movie_app/features/movies/ui/bloc/genres/genres_bloc.dart';
import 'package:movie_app/features/movies/ui/bloc/movie/movie_bloc.dart';
import 'package:movie_app/features/movies/ui/cubit/loading_cubit.dart';
import 'package:movie_app/features/splash/ui/bloc/splash_block.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator.get<SplashBloc>()),
        BlocProvider(create: (context) => locator.get<PassVisibleCubit>()),
        BlocProvider(create: (context) => locator.get<AuthBloc>()),
        BlocProvider(create: (context) => locator.get<MainWrapperCubit>()),
        BlocProvider(create: (context) => locator.get<LoadingCubit>()),
        BlocProvider(create: (context) => locator.get<GenresBloc>()),
        BlocProvider(create: (context) => locator.get<MovieBloc>()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.darktheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
