class SignUpModel {
  SignUpModel(this.firstName, this.lastName, this.username, this.email, this._password);

  final String firstName, lastName, username, email, _password;

  String get password => _password;

  @override
  String toString() {
    // TODO: implement toString
    super.toString();
    return "$firstName $lastName with $email and xxxxx password";

  }

  toJson(){
    return {
      "firstName":firstName,
      "lastName":lastName,
      "username":username,
      "email":email,
      "password":_password
    };
  }
}
