import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/shared_pref.dart';
import 'package:movie_app/core/utils/usecase.dart';

class CheckTokenUsecase extends Usecase<Either<String, String>, dynamic> {
  @override
  Future<Either<String, String>> call(params) async {
    bool token = SharedPref.isLoggedIn();

    return token ? right('authorized') : left('not authorized');
  }
}
