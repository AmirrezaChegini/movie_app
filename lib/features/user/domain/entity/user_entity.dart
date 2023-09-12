class UserEntity {
  final int _id;
  final String _name;
  final String _email;
  final String _created;
  final String _updated;

  UserEntity(
    this._id,
    this._name,
    this._email,
    this._created,
    this._updated,
  );

  int get id => _id;
  String get username => _name;
  String get email => _email;
  String get created => _created;
  String get updated => _updated;
}
