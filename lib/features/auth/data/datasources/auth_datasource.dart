import 'package:dio/dio.dart';
import 'package:movie_app/core/params/login_param.dart';
import 'package:movie_app/core/params/register_param.dart';

abstract class AuthDataSource {
  Future<void> register({required RegisterParam param});
  Future<Response> login({required LoginParam param});
}
