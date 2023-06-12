class SignUpModel {
  SignUpModel(this.firstName, this.lastName, this.username, this.email, this._password, this.referrer,this.avatar,this.deviceId, this.deviceName);

  final String firstName, lastName, username, email, _password, referrer,deviceId, deviceName;
  final int? avatar;
  String get password => _password;

  @override
  String toString() {
    // TODO: implement toString
    super.toString();
    return "$firstName $lastName with $email and xxxxx password";

  }

  toJson(){
    return {
      "first_name":firstName,
      "last_name":lastName,
      "username":username,
      "email":email,
      "password":_password,
      "referrer":referrer,
      "avatar": "$avatar",
      "device_id":"$deviceId",
      "device_name": "$deviceName"
    };
  }
}
