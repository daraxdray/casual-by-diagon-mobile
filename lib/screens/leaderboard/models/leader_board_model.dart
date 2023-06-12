import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'leader_board_item_model.dart';

class LeaderBoardModel {
  String? sId;
  String? firstName;
  String? lastName;
  String? username;
  String? gamePlayed;
  String? avatar;
  int? points;
  int? challenge;
  String? date;
  var f = NumberFormat.decimalPattern("en_US");


  String get getPoint => f.format(points);
  String get getChallenge => f.format(challenge);

  String getDigit() {
    var seperPoint = getPoint.split(",");
    switch (seperPoint.length) {
      case 1:
        return seperPoint[0];
      case 2:
        return "${seperPoint[0]}K+";
      case 3:
        return "${seperPoint[0]}M+";
      default:
        return "${seperPoint[0]}T+";
    }
  }

  LeaderBoardModel(
      {this.sId,
      this.firstName,
      this.lastName,
      this.username,
      this.gamePlayed,
      this.points,
      this.challenge,
      this.date});

  LeaderBoardModel.fromJson(Map<String, dynamic> json) {
    print(json);
    sId = json['_id'];

    firstName = json['firstName'];

    lastName = json['lastName'];
    username = json['username'];
    gamePlayed = json['game_played'];
    avatar = "${json['avatar'] ?? 1}";

    points = json['points'];

    challenge = json['challenge'];

    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['username'] = username;
    data['game_played'] = gamePlayed;
    data['points'] = this.points;
    data['avatar'] = this.avatar;
    data['challenge'] = this.challenge;
    data['date'] = this.date;
    return data;
  }
}
