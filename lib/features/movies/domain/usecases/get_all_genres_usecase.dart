import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/usecase.dart';
import 'package:movie_app/features/movies/domain/entity/genres_entity.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';

class GetAllGenresUsecase
    implements Usecase<Either<String, List<GenresEntity>>, dynamic> {
  final MovieRepository _movieRepository;
  GetAllGenresUsecase(this._movieRepository);

  @override
  Future<Either<String, List<GenresEntity>>> call(params) async {
    return await _movieRepository.getAllGenres();
  }
}
