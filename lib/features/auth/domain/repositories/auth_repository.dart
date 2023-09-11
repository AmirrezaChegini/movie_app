import 'package:dartz/dartz.dart';
import 'package:movie_app/core/params/login_param.dart';
import 'package:movie_app/core/params/register_param.dart';

abstract class AuthRepository {
  Future<Either<String, String>> login({required LoginParam param});
  Future<Either<String, String>> register({required RegisterParam param});
}
