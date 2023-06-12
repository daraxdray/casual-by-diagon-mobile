import 'package:intl/intl.dart';

class Player {
  String name;
  String image;
  int coinBalance;
  int fiatBalance;

  Player({required this.fiatBalance, required this.coinBalance, required this.name, required this.image});
  var f = NumberFormat.decimalPattern("en_US");
  String get getCoin => f.format(coinBalance);
  String get getFiat => f.format(fiatBalance);


  factory Player.fromJson(Map<String, dynamic> json) => Player(name : json['name'],image : json['image'],coinBalance : json['coinBalance'],
      fiatBalance : json['fiatBalance']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}