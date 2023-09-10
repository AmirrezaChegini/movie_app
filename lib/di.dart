import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/auth/ui/cubit/pass_visible_cubit.dart';

var locator = GetIt.I;

Future<void> initLocator() async {
  //classes
  locator.registerSingleton<Dio>(Dio(
    BaseOptions(
      baseUrl: 'https://moviesapi.ir/',
      connectTimeout: const Duration(seconds: 5),
    ),
  ));

  //cubit
  locator.registerSingleton<PassVisibleCubit>(PassVisibleCubit());
}
