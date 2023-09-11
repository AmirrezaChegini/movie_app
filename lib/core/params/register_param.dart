class RegisterParam {
  final String _name;
  final String _email;
  final String _password;

  RegisterParam(this._name, this._email, this._password);

  String get name => _name;
  String get email => _email;
  String get password => _password;
}
