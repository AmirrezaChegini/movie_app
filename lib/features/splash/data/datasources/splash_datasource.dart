import 'package:dio/dio.dart';

abstract class SplashDatasource {
  Future<void> isLoggedIn();
  Future<Response> refreshToken();
}
