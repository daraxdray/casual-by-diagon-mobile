class Player {
  String name;
  String image;
  int coinBalance;
  int fiatBalance;

  Player({required this.fiatBalance, required this.coinBalance, required this.name, required this.image});


  factory Player.fromJson(Map<String, dynamic> json) => Player(name : json['name'],image : json['image'],coinBalance : json['coinBalance'],
      fiatBalance : json['fiatBalance']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}