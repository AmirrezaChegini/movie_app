// [1,2,3] => '1,2,3'
extension GenresId on List<int> {
  String seprateId() {
    List<int> genresId = this;

    return genresId.join(',');
  }
}
