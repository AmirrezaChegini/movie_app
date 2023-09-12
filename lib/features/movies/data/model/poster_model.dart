import 'package:movie_app/features/movies/domain/entity/poster_eintity.dart';

class PosterModel extends PosterEntity {
  PosterModel(super.id, super.rating, super.poster);

  factory PosterModel.fromMapJson(Map<String, dynamic> jsobObject) {
    return PosterModel(
      jsobObject['id'],
      jsobObject['imdb_rating'],
      jsobObject['poster'],
    );
  }
}
