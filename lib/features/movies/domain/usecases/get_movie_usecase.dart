import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/usecase.dart';
import 'package:movie_app/features/movies/domain/entity/movie_entity.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';

class GetMovieUsecase implements Usecase<Either<String, MovieEntity>, int> {
  final MovieRepository _movieRepository;
  GetMovieUsecase(this._movieRepository);

  @override
  Future<Either<String, MovieEntity>> call(int params) async {
    return await _movieRepository.getMovie(movieId: params);
  }
}
