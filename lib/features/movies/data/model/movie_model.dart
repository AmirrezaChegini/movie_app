import 'package:movie_app/features/movies/domain/entity/movie_eintity.dart';

class MovieModel extends MovieEntity {
  MovieModel(
    int id,
    String rating,
    String poster,
  ) : super(id, rating, poster);

  factory MovieModel.fromMapJson(Map<String, dynamic> jsobObject) {
    return MovieModel(
      jsobObject['id'],
      jsobObject['imdb_rating'],
      jsobObject['poster'],
    );
  }
}
