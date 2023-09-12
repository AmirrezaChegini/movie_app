import 'package:movie_app/features/movies/domain/entity/genres_entity.dart';

class GenresModel extends GenresEntity {
  GenresModel(super.id, super.name);

  factory GenresModel.fromMapJson(Map<String, dynamic> jsobObject) {
    return GenresModel(
      jsobObject['id'],
      jsobObject['name'],
    );
  }
}
