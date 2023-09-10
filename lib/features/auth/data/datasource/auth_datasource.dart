import 'package:dio/dio.dart';

abstract class AuthDataSource {
  Future<void> register({
    required String name,
    required Stream email,
    required String password,
  });
  Future<Response> login({
    required String email,
    required String password,
  });
  // Future<Response> refreshToken();
}
