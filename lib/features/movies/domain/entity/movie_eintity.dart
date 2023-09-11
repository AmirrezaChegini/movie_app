class MovieEntity {
  final int _id;
  final String _rating;
  final String _poster;

  MovieEntity(this._id, this._rating, this._poster);

  int get id => _id;
  String get rating => _rating;
  String get poster => _poster;
}
