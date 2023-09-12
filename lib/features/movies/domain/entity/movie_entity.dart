class MovieEntity {
  final int _id;
  final String _title;
  final String _rated;
  final String _time;
  final List<String> _genres;
  final String _releasedTime;
  final String _plot;

  MovieEntity(
    this._id,
    this._title,
    this._rated,
    this._time,
    this._genres,
    this._releasedTime,
    this._plot,
  );

  int get id => _id;
  String get title => _title;
  String get rated => _rated;
  String get time => _time;
  List<String> get genre => _genres;
  String get releasedTime => _releasedTime;
  String get plot => _plot;
}
