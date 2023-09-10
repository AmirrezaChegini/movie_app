import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<String, String>> login({
    required String email,
    required String password,
  });
  Future<Either<String, String>> register({
    required String name,
    required Stream email,
    required String password,
  });
}
