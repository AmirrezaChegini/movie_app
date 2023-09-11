import 'package:dio/dio.dart';
import 'package:movie_app/core/params/movie_param.dart';

abstract class MovieDatasource {
  Future<Response> getAllMovie({int page});
  Future<Response> getSpecificMovie({required MovieParam param});
  Future<Response> getAllGenres();
}
