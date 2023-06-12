
class RaffleDrawWinner {
  String? sId;
  String? user;
  int? avatar;
  String? username;
  String? category;
  bool? paid;
  bool? status;
  String? date;
  int? iV;

  RaffleDrawWinner({this.sId, this.user, this.avatar, this.username, this.category, this.paid, this.status, this.date, this.iV});

  RaffleDrawWinner.fromJson(Map<String, dynamic> json) {
  sId = json['_id'];
  user = json['user'];
  avatar = json['avatar'];
  username = json['username'];
  category = json['class'];
  paid = json['paid'];
  status = json['status'];
  date = json['date'];
  iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['_id'] = this.sId;
  data['user'] = this.user;
  data['avatar'] = this.avatar;
  data['username'] = username;
  data['class'] = category;
  data['paid'] = this.paid;
  data['status'] = this.status;
  data['date'] = this.date;
  data['__v'] = this.iV;
  return data;
  }
}