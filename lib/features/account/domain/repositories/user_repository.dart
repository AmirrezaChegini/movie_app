import 'package:dartz/dartz.dart';
import 'package:movie_app/features/account/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<Either<String, UserEntity>> getUserInfo();
}
