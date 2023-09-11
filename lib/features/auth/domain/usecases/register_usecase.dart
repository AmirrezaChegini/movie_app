import 'package:dartz/dartz.dart';
import 'package:movie_app/core/params/register_param.dart';
import 'package:movie_app/core/utils/usecase.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repository.dart';

class RegisterUsecase
    implements Usecase<Either<String, String>, RegisterParam> {
  final AuthRepository _repository;

  RegisterUsecase(this._repository);

  @override
  Future<Either<String, String>> call(RegisterParam param) async {
    return await _repository.register(param: param);
  }
}
