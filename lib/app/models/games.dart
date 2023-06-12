import 'dart:math';

import 'package:casual/app/models/players.dart';
import 'package:intl/intl.dart';
import '../services/auth_service.dart';

class GameModel {
  String? sId;
  String? title;
  int? prize;
  String? image;
  String? url;
  String? no_ads_url;
  String? backgroundImage;
  int? players;
  String? rules;
  String? currency;
  String? currencySymbol;
  bool? slide;
  bool? tournament;
  Random rand = Random();
  Set<int> playersImage = {};
  var f = NumberFormat.decimalPattern("en_US");
  String get getPlayers => f.format(players ?? 0);
  String get getPrize => f.format(prize ?? 0);

  GameModel({this.sId, this.title, this.url, this.image, this.players, this.rules, this.slide, this.tournament,this.no_ads_url})
  {
    while(playersImage.length < 4){
        playersImage.add(rand.nextInt(10));
    }


  }

  GameModel.fromJson(Map<String, dynamic> json)
  {
    sId = json['_id'];
    title = json['title'];
    prize = int.parse("${json['prize']}");
    url = json['url'];
    no_ads_url = json['no_ads_url'];
    image = json['image'];
    currency = json['currency'];
    currencySymbol = json['currency_symbol'];
    slide  = json['slide'];
    tournament  = json['tournament'];
    players = json['players'];
    rules = json['rules'];
    while(playersImage.length < 4){
      playersImage.add(rand.nextInt(10));
    }
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['title'] = title;
    data['prize'] = prize;
    data['slide'] = slide;
    data['url'] = url;
    data['no_ads_url'] = no_ads_url;
    data['image'] = image;
    data['players'] = players;
    data['currency'] = currency;
    data['currency_symbol'] = currencySymbol;
    data['rules'] = rules;
    data['tournament'] = tournament;
    return data;
  }
}

class Stages
{
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

