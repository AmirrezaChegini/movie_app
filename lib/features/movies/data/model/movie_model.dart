import 'package:movie_app/features/movies/domain/entity/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel(
    int id,
    String title,
    String rated,
    String time,
    List genres,
    List? images,
    String releasedTime,
    String plot,
  ) : super(id, title, rated, time, genres, images, releasedTime, plot);

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
