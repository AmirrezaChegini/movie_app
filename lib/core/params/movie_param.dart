class MovieParam {
  final int _page;
  final int _genreId;

  MovieParam(this._page, this._genreId);

  int get page => _page;
  int get genreId => _genreId;
}
