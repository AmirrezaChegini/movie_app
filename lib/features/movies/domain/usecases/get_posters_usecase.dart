import 'package:dartz/dartz.dart';
import 'package:movie_app/core/utils/usecase.dart';
import 'package:movie_app/features/movies/domain/entity/poster_eintity.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';

class GetPostersUsecase
    implements Usecase<Either<String, List<PosterEntity>>, int> {
  final MovieRepository _movieRepository;
  GetPostersUsecase(this._movieRepository);

  @override
  Future<Either<String, List<PosterEntity>>> call(int params) async {
    return await _movieRepository.getPosters(page: params);
  }
}
