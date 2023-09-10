import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/auth/data/datasource/auth_datasource.dart';
import 'package:movie_app/features/auth/data/datasource/remote/remote_datasource_impl.dart';
import 'package:movie_app/features/auth/data/repositories/auth_repositoy_impl.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:movie_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:movie_app/features/auth/ui/cubit/pass_visible_cubit.dart';
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

  //datasource
  locator
      .registerSingleton<AuthDataSource>(RemoteDatasourceImpl(locator.get()));

  //repositories
  locator.registerSingleton<AuthRepository>(AuthRepositoryImple(locator.get()));

  //usecase
  locator.registerSingleton<RegisterUsecase>(RegisterUsecase(locator.get()));

  //cubit
  locator.registerSingleton<PassVisibleCubit>(PassVisibleCubit());
}
