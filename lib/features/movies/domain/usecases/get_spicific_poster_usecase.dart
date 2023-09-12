import 'package:dartz/dartz.dart';
import 'package:movie_app/core/params/movie_param.dart';
import 'package:movie_app/core/utils/usecase.dart';
import 'package:movie_app/features/movies/domain/entity/poster_eintity.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';

class GetSpecificPosterUsecase
    implements Usecase<Either<String, List<PosterEntity>>, MovieParam> {
  final MovieRepository _movieRepository;
  GetSpecificPosterUsecase(this._movieRepository);
  @override
  Future<Either<String, List<PosterEntity>>> call(MovieParam params) async {
    return await _movieRepository.getSpecificPoster(param: params);
  }
}
