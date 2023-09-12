import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/params/movie_param.dart';
import 'package:movie_app/core/utils/error_handler/app_exceptions.dart';
import 'package:movie_app/features/movies/data/datasources/movie_datasource.dart';
import 'package:movie_app/features/movies/data/model/genres_model.dart';
import 'package:movie_app/features/movies/data/model/movie_model.dart';
import 'package:movie_app/features/movies/data/model/poster_model.dart';
import 'package:movie_app/features/movies/domain/entity/genres_entity.dart';
import 'package:movie_app/features/movies/domain/entity/movie_entity.dart';
import 'package:movie_app/features/movies/domain/entity/poster_eintity.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDatasource _datasource;
  MovieRepositoryImpl(this._datasource);

  @override
  Future<Either<String, List<PosterEntity>>> getPosters(
      {required int page}) async {
    try {
      Response response = await _datasource.getPosters(page: page);

      //conevrt json object to dart model
      List<PosterEntity> postersList = response.data['data']
          .map<PosterEntity>((e) => PosterModel.fromMapJson(e))
          .toList();

      return right(postersList);
    } on AppExceptions catch (e) {
      return left(e.message);
    }
  }

  @override
  Future<Either<String, List<GenresEntity>>> getAllGenres() async {
    try {
      Response response = await _datasource.getAllGenres();

      //conevrt json object to dart model
      List<GenresEntity> genresList = response.data
          .map<GenresEntity>((e) => GenresModel.fromMapJson(e))
          .toList();

      return right(genresList);
    } on AppExceptions catch (e) {
      return left(e.message);
    }
  }

  @override
  Future<Either<String, List<PosterEntity>>> getSpecificPoster(
      {required MovieParam param}) async {
    try {
      Response response = await _datasource.getSpecificPoster(param: param);

      //conevrt json object to dart model
      List<PosterEntity> postersList = response.data['data']
          .map<PosterEntity>((e) => PosterModel.fromMapJson(e))
          .toList();

      return right(postersList);
    } on AppExceptions catch (e) {
      return left(e.message);
    }
  }

  @override
  Future<Either<String, MovieEntity>> getMovie({required int movieId}) async {
    try {
      Response response = await _datasource.getMovie(movieId: movieId);

      //conevrt json object to dart model
      MovieEntity movie = MovieModel.fromMapJson(response.data);

      return right(movie);
    } on AppExceptions catch (e) {
      return left(e.message);
    }
  }
}
