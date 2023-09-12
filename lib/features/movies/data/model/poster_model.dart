import 'package:movie_app/features/movies/domain/entity/poster_eintity.dart';

class PosterModel extends PosterEntity {
  PosterModel(
    int id,
    String rating,
    String poster,
  ) : super(id, rating, poster);

  factory PosterModel.fromMapJson(Map<String, dynamic> jsobObject) {
    return PosterModel(
      jsobObject['id'],
      jsobObject['imdb_rating'],
      jsobObject['poster'],
    );
  }
}
