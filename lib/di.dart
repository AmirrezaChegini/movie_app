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
import 'package:movie_app/features/movies/data/datasources/movie_datasource.dart';
import 'package:movie_app/features/movies/data/datasources/remote/remote_movie_datasource.dart';
import 'package:movie_app/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';
import 'package:movie_app/features/movies/domain/usecases/get_genres_usecase.dart';
import 'package:movie_app/features/movies/domain/usecases/get_posters_usecase.dart';
import 'package:movie_app/features/movies/domain/usecases/get_movie_usecase.dart';
import 'package:movie_app/features/movies/domain/usecases/get_spicific_poster_usecase.dart';
import 'package:movie_app/features/movies/ui/bloc/genres/genres_bloc.dart';
import 'package:movie_app/features/movies/ui/bloc/movie/movie_bloc.dart';
import 'package:movie_app/features/movies/ui/bloc/posters/posters_bloc.dart';
import 'package:movie_app/features/movies/ui/cubit/chips_cubit.dart';
import 'package:movie_app/features/splash/domain/usecases/check_token_usecase.dart';
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

  //datasource
  locator.registerSingleton<AuthDataSource>(
      RemoteAuthDatasourceImpl(locator.get()));
  locator
      .registerSingleton<MovieDatasource>(RemoteMovieDatasoure(locator.get()));

  //repositories
  locator.registerSingleton<AuthRepository>(AuthRepositoryImple(locator.get()));
  locator
      .registerSingleton<MovieRepository>(MovieRepositoryImpl(locator.get()));

  //usecase
  locator
      .registerSingleton<CheckConnectivityUsecase>(CheckConnectivityUsecase());
  locator.registerSingleton<CheckTokenUsecase>(CheckTokenUsecase());
  locator.registerSingleton<RegisterUsecase>(RegisterUsecase(locator.get()));
  locator.registerSingleton<LoginUsecase>(LoginUsecase(locator.get()));
  locator
      .registerSingleton<GetPostersUsecase>(GetPostersUsecase(locator.get()));
  locator.registerSingleton<GetGenresUsecase>(GetGenresUsecase(locator.get()));
  locator.registerSingleton<GetSpecificPosterUsecase>(
      GetSpecificPosterUsecase(locator.get()));
  locator.registerSingleton<GetMovieUsecase>(GetMovieUsecase(locator.get()));

  //cubit
  locator.registerSingleton<PassVisibleCubit>(PassVisibleCubit());
  locator.registerSingleton<MainWrapperCubit>(MainWrapperCubit());
  locator.registerSingleton<ChipsCubit>(ChipsCubit());

  //bloc
  locator
      .registerSingleton<SplashBloc>(SplashBloc(locator.get(), locator.get()));
  locator.registerSingleton<AuthBloc>(AuthBloc(locator.get(), locator.get()));
  locator.registerSingleton<GenresBloc>(GenresBloc(locator.get()));
  locator.registerSingleton<PostersBloc>(
      PostersBloc(locator.get(), locator.get()));
  locator.registerSingleton<MovieBloc>(MovieBloc(locator.get()));
}
