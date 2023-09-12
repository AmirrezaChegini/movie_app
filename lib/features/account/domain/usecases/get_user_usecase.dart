import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/usecase.dart';
import 'package:movie_app/features/account/domain/entity/user_entity.dart';
import 'package:movie_app/features/account/domain/repositories/user_repository.dart';

class GetUserUsecase implements Usecase<Either<String, UserEntity>, dynamic> {
  final UserRepository _repository;
  GetUserUsecase(this._repository);

  @override
  Future<Either<String, UserEntity>> call(param) async {
    return await _repository.getUserInfo();
  }
}
