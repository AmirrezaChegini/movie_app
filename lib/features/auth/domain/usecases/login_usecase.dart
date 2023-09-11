import 'package:dartz/dartz.dart';
import 'package:movie_app/core/params/login_param.dart';
import 'package:movie_app/core/utils/usecase.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase implements Usecase<Either<String, String>, LoginParam> {
  final AuthRepository _repository;

  LoginUsecase(this._repository);

  @override
  Future<Either<String, String>> call(LoginParam param) async {
    return await _repository.login(param: param);
  }
}
