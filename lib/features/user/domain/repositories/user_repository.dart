import 'package:dartz/dartz.dart';
import 'package:movie_app/features/user/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<Either<String, UserEntity>> getUserInfo();
}
