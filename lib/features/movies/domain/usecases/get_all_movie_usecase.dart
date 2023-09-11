import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/usecase.dart';
import 'package:movie_app/features/movies/domain/entity/movie_eintity.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';

class GetAllMovieUsecase
    implements Usecase<Either<String, List<MovieEntity>>, int> {
  final MovieRepository _movieRepository;
  GetAllMovieUsecase(this._movieRepository);

  @override
  Future<Either<String, List<MovieEntity>>> call(int params) async {
    return await _movieRepository.getAllMovie(page: params);
  }
}
