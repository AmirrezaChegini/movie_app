import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api.dart';
import 'package:movie_app/core/utils/error_handler/app_exceptions.dart';
import 'package:movie_app/core/utils/error_handler/check_exceptions.dart';
import 'package:movie_app/features/movies/data/datasources/movie_datasource.dart';

class RemoteMovieDatasoure implements MovieDatasource {
  final Dio _dio;
  RemoteMovieDatasoure(this._dio);

  // fetch all movies
  @override
  Future<Response> getAllMovie({int page = 1}) async {
    try {
      Response response = await _dio.get(
        Api.allMovie,
        queryParameters: {
          'page': page,
        },
      );

      return response;
    } on DioException catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }

  // fetch all genres
  @override
  Future<Response> getAllGenres() async {
    try {
      Response response = await _dio.get(Api.allGenres);

      return response;
    } on DioException catch (e) {
      e.response == null
          ? throw FetchDataEx()
          : throw CheckExceptions.validate(e.response!);
    }
  }
}
