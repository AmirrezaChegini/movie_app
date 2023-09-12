import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/error_handler/app_exceptions.dart';

abstract class SplashRepository {
  Future<Either<AppExceptions, String>> isloggedIn();
}
