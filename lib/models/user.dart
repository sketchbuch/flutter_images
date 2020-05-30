class User {
  final String _email;
  final String _image;
  final String _name;
  String _fName;
  String _lName;

  User(this._name, this._email, this._image) {
    this._fName = this._name.substring(0, _name.indexOf(" "));
    this._lName = this._name.substring(_name.indexOf(" ") + 1);
  }

  String get email {
    return this._email;
  }

  String get firstName {
    return this._fName;
  }

  String get image {
    return this._image;
  }

  String get lastName {
    return this._lName;
  }

  String get name {
    return this._name;
  }
}
