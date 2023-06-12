class LogInModel {
  LogInModel( this.email, this._password, this.deviceId, this.deviceName);

  final String  email, _password, deviceId, deviceName;

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
      "password":_password,
      "device_id":deviceId,
      "device_name":deviceName
    };
  }
}
