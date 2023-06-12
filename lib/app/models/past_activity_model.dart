class PastActivityModel {
  String? id;
  String? user;
  String? type;
  String? name;
  int? points;
  String? date;

  PastActivityModel(
      {this.id, this.user, this.type, this.name, this.points, this.date});

  PastActivityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    type = json['type'];
    name = json['name'];
    points = json['points'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['type'] = this.type;
    data['name'] = this.name;
    data['points'] = this.points;
    data['date'] = this.date;
    return data;
  }
}