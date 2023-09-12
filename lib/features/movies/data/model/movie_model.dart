import 'package:movie_app/features/movies/domain/entity/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel(
    super.id,
    super.title,
    super.rated,
    super.time,
    super.genres,
    super.images,
    super.releasedTime,
    super.plot,
  );

  factory MovieModel.fromMapJson(Map<String, dynamic> jsonObject) {
    return MovieModel(
      jsonObject['id'],
      jsonObject['title'],
      jsonObject['rated'],
      jsonObject['runtime'],
      jsonObject['genres'],
      jsonObject['images'],
      jsonObject['released'],
      jsonObject['plot'],
    );
  }
}
