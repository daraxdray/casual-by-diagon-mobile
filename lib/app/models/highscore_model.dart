import 'package:intl/intl.dart';

class HighScoreModel {
  String? id;
  String? user;
  String? game;
  String? image;
  int? score;
  String? date;
  var f = NumberFormat.decimalPattern("en_US");
  String get getScore => f.format(score ?? 0);
  HighScoreModel({this.id, this.user, this.game, this.image, this.score, this.date});


  HighScoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    game = json['game'];
    image = json['image'];
    score = double.parse(json['score'].toString()).toInt() ;
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['game'] = this.game;
    data['image'] = this.image;
    data['score'] = this.score;
    data['date'] = this.date;
    return data;
  }
}
