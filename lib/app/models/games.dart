import 'dart:math';

import 'package:casual/app/models/players.dart';
import '../services/auth_service.dart';

class GameModel {
  String? sId;
  String? title;
  String? url;
  String? image;
  String? backgroundImage;
  int? players;
  String? rules;
  bool? slide;
  Random rand = Random();
  Set<int> playersImage = {};
  // DgAuthService dgAuth = DgAuthService();
  GameModel({this.sId, this.title, this.url, this.image, this.players, this.rules, this.slide})
  {
    while(playersImage.length < 4){
        playersImage.add(rand.nextInt(10));
    }


  }

  GameModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    url = json['url'];
    image = json['image'];
    slide  = json['slide'];
    players = json['players'];
    rules = json['rules'];
    while(playersImage.length < 4){

      playersImage.add(rand.nextInt(10));
    }
    print(playersImage);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['slide'] = this.slide;
    data['url'] = this.url;
    data['image'] = this.image;
    data['players'] = this.players;
    data['rules'] = this.rules;
    return data;
  }
}

class Stages {
  String? title;
  int? score;

  Stages({this.title, this.score});

  Stages.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['score'] = this.score;
    return data;
  }
}

