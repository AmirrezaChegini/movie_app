import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/utils/error_handler/app_exceptions.dart';
import 'package:movie_app/features/account/data/datasource/user_datasource.dart';
import 'package:movie_app/features/account/data/models/user_model.dart';
import 'package:movie_app/features/account/domain/entity/user_entity.dart';
import 'package:movie_app/features/account/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource _datasource;
  UserRepositoryImpl(this._datasource);

  @override
  Future<Either<String, UserEntity>> getUserInfo() async {
    try {
      Response response = await _datasource.getUserInfo();

      UserEntity user = UserModel.fromMapJson(response.data);

      return right(user);
    } on AppExceptions catch (e) {
      return left(e.message);
    }
  }
}
