import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/utils/error_handler/app_exceptions.dart';
import 'package:movie_app/core/utils/shared_pref.dart';
import 'package:movie_app/features/auth/data/datasource/auth_datasource.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImple extends AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImple(this._dataSource);

  @override
  Future<Either<String, String>> login(
      {required String email, required String password}) async {
    try {
      Response response =
          await _dataSource.login(email: email, password: password);

      //get token from response
      String token = response.data['access_token'];
      String refreshToken = response.data['refresh_token'];

      //save token
      SharedPref.saveString(key: 'token', value: token);
      SharedPref.saveString(key: 'refresh_token', value: refreshToken);

      return right('logged in');
    } on AppExceptions catch (e) {
      return left(e.message);
    }
  }

  @override
  Future<Either<String, String>> register(
      {required String name,
      required Stream email,
      required String password}) async {
    try {
      await _dataSource.register(name: name, email: email, password: password);

      return right('signed up');
    } on AppExceptions catch (e) {
      return left(e.message);
    }
  }
}
