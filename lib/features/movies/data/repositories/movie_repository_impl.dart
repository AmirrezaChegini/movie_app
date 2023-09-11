import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/params/movie_param.dart';
import 'package:movie_app/core/utils/error_handler/app_exceptions.dart';
import 'package:movie_app/features/movies/data/datasources/movie_datasource.dart';
import 'package:movie_app/features/movies/data/model/genres_model.dart';
import 'package:movie_app/features/movies/data/model/movie_model.dart';
import 'package:movie_app/features/movies/domain/entity/genres_entity.dart';
import 'package:movie_app/features/movies/domain/entity/movie_eintity.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDatasource _datasource;
  MovieRepositoryImpl(this._datasource);

  @override
  Future<Either<String, List<MovieEntity>>> getAllMovie(
      {required int page}) async {
    try {
      Response response = await _datasource.getAllMovie(page: page);

      //conevrt json object to dart model
      List<MovieEntity> allMovieList = response.data['data']
          .map<MovieEntity>((e) => MovieModel.fromMapJson(e))
          .toList();

      return right(allMovieList);
    } on AppExceptions catch (e) {
      return left(e.message);
    }
  }

  @override
  Future<Either<String, List<GenresEntity>>> getAllGenres() async {
    try {
      Response response = await _datasource.getAllGenres();

      //conevrt json object to dart model
      List<GenresEntity> allGenresieList = response.data
          .map<GenresEntity>((e) => GenresModel.fromMapJson(e))
          .toList();

      return right(allGenresieList);
    } on AppExceptions catch (e) {
      return left(e.message);
    }
  }

  @override
  Future<Either<String, List<MovieEntity>>> getSpecificMovies(
      {required MovieParam param}) async {
    try {
      Response response = await _datasource.getSpecificMovie(param: param);
      //conevrt json object to dart model

      List<MovieEntity> allMovieList = response.data['data']
          .map<MovieEntity>((e) => MovieModel.fromMapJson(e))
          .toList();

      return right(allMovieList);
    } on AppExceptions catch (e) {
      return left(e.message);
    }
  }
}
