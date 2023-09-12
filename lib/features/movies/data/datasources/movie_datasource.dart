import 'package:dio/dio.dart';
import 'package:movie_app/core/params/movie_param.dart';

abstract class MovieDatasource {
  Future<Response> getPosters({int page});
  Future<Response> getSpecificPoster({required MovieParam param});
  Future<Response> getAllGenres();
  Future<Response> getMovie({required int movieId});
}
