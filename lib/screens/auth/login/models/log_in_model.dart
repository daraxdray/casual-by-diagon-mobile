class LogInModel {
  LogInModel( this.email, this._password);

  final String  email, _password;

  String get password => _password;

  @override
  String toString() {
    // TODO: implement toString
    super.toString();
    return "$email and xxxxx password";

  }

  toJson(){
    return {
      "email":email,
      "password":_password
    };
  }
}
