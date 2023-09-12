import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api.dart';
import 'package:movie_app/core/utils/error_handler/app_exceptions.dart';
import 'package:movie_app/core/utils/error_handler/check_exceptions.dart';
import 'package:movie_app/core/utils/shared_pref.dart';
import 'package:movie_app/features/splash/data/datasources/splash_datasource.dart';

class RemoteSplashDatasource implements SplashDatasource {
  final Dio _dio;
  RemoteSplashDatasource(this._dio);

  @override
  Future<void> isLoggedIn() async {
    String token = SharedPref.getString(key: 'token');

    try {
      await _dio.get(
        Api.userInfo,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );
    } on DioException catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }

  @override
  Future<Response> refreshToken() async {
    String refreshToken = SharedPref.getString(key: 'refresh_token');

    try {
      Response response = await _dio.post(
        Api.refreshToken,
        data: {
          'grant_type': 'refresh_token',
          'refresh_token': refreshToken,
        },
      );

      return response;
    } on DioException catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }
}
