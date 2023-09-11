import 'package:dio/dio.dart';

abstract class MovieDatasource {
  Future<Response> getAllMovie({int page});
  Future<Response> getAllGenres();
}
