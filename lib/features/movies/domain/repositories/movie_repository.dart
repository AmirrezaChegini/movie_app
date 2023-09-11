import 'package:dartz/dartz.dart';
import 'package:movie_app/features/movies/domain/entity/genres_entity.dart';
import 'package:movie_app/features/movies/domain/entity/movie_eintity.dart';

abstract class MovieRepository {
  Future<Either<String, List<MovieEntity>>> getAllMovie({required int page});
  Future<Either<String, List<GenresEntity>>> getAllGenres();
}