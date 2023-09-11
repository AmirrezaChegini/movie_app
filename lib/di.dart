import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:movie_app/features/auth/data/datasources/remote/remote_auth_datasource_impl.dart';
import 'package:movie_app/features/auth/data/repositories/auth_repositoy_impl.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:movie_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:movie_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:movie_app/features/auth/ui/bloc/auth_bloc.dart';
import 'package:movie_app/features/auth/ui/cubit/pass_visible_cubit.dart';
import 'package:movie_app/features/main_wrapper/ui/cubit/main_wrapper_cubit.dart';
import 'package:movie_app/features/splash/domain/usecases/chech_token_usecase.dart';
import 'package:movie_app/features/splash/domain/usecases/check_connectivity_usecase.dart';
import 'package:movie_app/features/splash/ui/bloc/splash_block.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.I;

Future<void> initLocator() async {
  //classes
  locator.registerSingleton<Dio>(Dio(
    BaseOptions(
      baseUrl: 'https://moviesapi.ir/',
      connectTimeout: const Duration(seconds: 5),
    ),
  ));
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  locator.registerSingleton<AuthDataSource>(
      RemoteAuthDatasourceImpl(locator.get()));

  locator.registerSingleton<AuthRepository>(AuthRepositoryImple(locator.get()));

  //usecase
  locator
      .registerSingleton<CheckConnectivityUsecase>(CheckConnectivityUsecase());
  locator.registerSingleton<CheckTokenUsecase>(CheckTokenUsecase());
  locator.registerSingleton<RegisterUsecase>(RegisterUsecase(locator.get()));
  locator.registerSingleton<LoginUsecase>(LoginUsecase(locator.get()));

  //cubit
  locator.registerSingleton<PassVisibleCubit>(PassVisibleCubit());
  locator.registerSingleton<MainWrapperCubit>(MainWrapperCubit());

  //bloc
  locator
      .registerSingleton<SplashBloc>(SplashBloc(locator.get(), locator.get()));
  locator.registerSingleton<AuthBloc>(AuthBloc(locator.get(), locator.get()));
}
