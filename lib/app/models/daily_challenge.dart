

import 'package:casual/app/models/players.dart';

class DailyChallenge {
  String title;
  String image;
  List<Player> players;
  DailyChallenge({required this.title, required this.image, required this.players});


  //use only for small list
  List<String>  getPlayersImage(){
    List<String> imageList = [];
     for (var element in players) {
      imageList.add(element.image);
    }
    return imageList;
  }
}