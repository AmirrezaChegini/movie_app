import 'package:dartz/dartz.dart';
import 'package:movie_app/core/params/movie_param.dart';
import 'package:movie_app/core/utils/usecase.dart';
import 'package:movie_app/features/movies/domain/entity/movie_eintity.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';

class GetSpecificMovieUsecase
    implements Usecase<Either<String, List<MovieEntity>>, MovieParam> {
  final MovieRepository _movieRepository;
  GetSpecificMovieUsecase(this._movieRepository);
  @override
  Future<Either<String, List<MovieEntity>>> call(MovieParam params) async {
    return await _movieRepository.getSpecificMovies(param: params);
  }
}
