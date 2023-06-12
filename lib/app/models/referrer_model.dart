class DgReferrerModel {
  String? id;
  String? username;
  int? avatar;
  String? firstName;
  String? lastName;
  String? email;

  DgReferrerModel(
      {this.id,
        this.username,
        this.avatar,
        this.firstName,
        this.lastName,
        this.email});

  DgReferrerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    avatar = json['avatar'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    return data;
  }
}
