import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/error_handler/app_exceptions.dart';
import 'package:movie_app/core/utils/shared_pref.dart';
import 'package:movie_app/core/utils/usecase.dart';
import 'package:movie_app/features/splash/domain/repositories/splash_repository.dart';

class CheckLogginUsecase
    extends Usecase<Either<AppExceptions, String>, dynamic> {
  final SplashRepository _repository;
  CheckLogginUsecase(this._repository);

  @override
  Future<Either<AppExceptions, String>> call(params) async {
    //first check is token exist
    String token = SharedPref.getString(key: 'token');

    if (token.isNotEmpty) {
      //if token exist check token expire
      return await _repository.isloggedIn();
    } else {
      return left(BadReqEx(message: 'token does not exist'));
    }
  }
}
