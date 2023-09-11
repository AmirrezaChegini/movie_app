import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api.dart';
import 'package:movie_app/core/params/login_param.dart';
import 'package:movie_app/core/params/register_param.dart';
import 'package:movie_app/core/utils/error_handler/app_exceptions.dart';
import 'package:movie_app/core/utils/error_handler/check_exceptions.dart';
import 'package:movie_app/features/auth/data/datasource/auth_datasource.dart';

class RemoteDatasourceImpl extends AuthDataSource {
  final Dio _dio;

  RemoteDatasourceImpl(this._dio);

  @override
  Future<Response> login({required LoginParam param}) async {
    try {
      Response response = await _dio.post(
        Api.login,
        data: {
          'grant_type': 'password',
          'username': param.email,
          'password': param.password,
        },
      );

      return response;
    } on DioException catch (e) {
      //if response was null that means no internet connection or server is down
      // if response wasn't null check status code.

      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }

  @override
  Future<void> register({required RegisterParam param}) async {
    try {
      await _dio.post(
        Api.register,
        data: {
          'name': param.name,
          'email': param.email,
          'password': param.password,
        },
      );
    } on DioException catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }
}
