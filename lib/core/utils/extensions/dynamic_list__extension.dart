//[drama, action] => 'drama, action'
extension DynamicList on List {
  String seperateGenres() {
    List genresId = this;

    return genresId.join(', ');
  }
}
