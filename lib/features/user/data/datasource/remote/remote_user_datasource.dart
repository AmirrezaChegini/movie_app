import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api.dart';
import 'package:movie_app/core/utils/error_handler/app_exceptions.dart';
import 'package:movie_app/core/utils/error_handler/check_exceptions.dart';
import 'package:movie_app/core/utils/shared_pref.dart';
import 'package:movie_app/features/user/data/datasource/user_datasource.dart';

class RemoteUserDatasource implements UserDatasource {
  final Dio _dio;
  RemoteUserDatasource(this._dio);

  @override
  Future<Response> getUserInfo() async {
    String token = SharedPref.getString(key: 'token');

    try {
      Response response = await _dio.get(
        Api.userInfo,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }
}
