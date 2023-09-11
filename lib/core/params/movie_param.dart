class MovieParam {
  final int _page;
  final List<int> _genresId;

  MovieParam(this._page, this._genresId);

  int get page => _page;
  List<int> get genresId => _genresId;
}
