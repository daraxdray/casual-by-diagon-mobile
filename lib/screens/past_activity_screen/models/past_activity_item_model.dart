class PastActivityItemModel {

  String? id;
  String? user;
  String? type;
  String? name;
  String? image;
  int? points;
  String? date;

  PastActivityItemModel(
  {this.id, this.user, this.type, this.name, this.points, this.date, this.image});

  PastActivityItemModel.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  user = json['user'];
  type = json['type'];
  name = json['name'];
  points = json['points'];
  image = json['image'];
  date = json['date'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['user'] = this.user;
  data['type'] = this.type;
  data['name'] = this.name;
  data['points'] = this.points;
  data['image'] = this.image;
  data['date'] = this.date;
  return data;
  }
  }

