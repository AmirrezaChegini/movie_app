import 'package:dartz/dartz.dart';
import 'package:movie_app/core/params/movie_param.dart';
import 'package:movie_app/features/movies/domain/entity/genres_entity.dart';
import 'package:movie_app/features/movies/domain/entity/movie_entity.dart';
import 'package:movie_app/features/movies/domain/entity/poster_eintity.dart';

abstract class MovieRepository {
  Future<Either<String, List<PosterEntity>>> getPosters({required int page});
  Future<Either<String, List<PosterEntity>>> getSpecificPoster(
      {required MovieParam param});
  Future<Either<String, List<GenresEntity>>> getAllGenres();
  Future<Either<String, MovieEntity>> getMovie({required int movieId});
}
