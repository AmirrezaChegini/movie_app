import 'package:movie_app/features/movies/domain/entity/genres_entity.dart';

class GenresModel extends GenresEntity {
  GenresModel(
    int id,
    String name,
  ) : super(id, name);

  factory GenresModel.fromMapJson(Map<String, dynamic> jsobObject) {
    return GenresModel(
      jsobObject['id'],
      jsobObject['name'],
    );
  }
}
