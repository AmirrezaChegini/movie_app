import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/utils/error_handler/app_exceptions.dart';
import 'package:movie_app/core/utils/shared_pref.dart';
import 'package:movie_app/features/splash/data/datasources/splash_datasource.dart';
import 'package:movie_app/features/splash/domain/repositories/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository {
  final SplashDatasource _datasource;
  SplashRepositoryImpl(this._datasource);

  @override
  Future<Either<AppExceptions, String>> isloggedIn() async {
    try {
      //first we check current token
      await _datasource.isLoggedIn();
      return right('logged in');
    } on AppExceptions catch (_) {
      try {
        //if correct token war expire use refresh token to get new token
        Response response = await _datasource.refreshToken();

        //get token from response
        String token = response.data['access_token'];
        String refreshToken = response.data['refresh_token'];

        //save token
        SharedPref.saveString(key: 'token', value: token);
        SharedPref.saveString(key: 'refresh_token', value: refreshToken);

        return right('Logged in');
      } on AppExceptions catch (e) {
        //if refresh token and and token were expired return a exception.
        return left(e);
      }
    }
  }
}
