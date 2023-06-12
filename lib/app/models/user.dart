import 'package:intl/intl.dart';
import '../services/auth_service.dart';
import './rank_model.dart';


class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? username;
  String? gamePlayed;
  String? email;
  String? country;
  String? phone;
  String? evmAddress;
  String? avatar;
  int? dgn;
  int? ngn;
  int? tickets;
  int? points;
  int? challenge;
  int? rank;
  String? referrer;
  bool? isVerified;
  int? iat;
  int? exp;
  bool? active;
  bool? luckyDraw;
  bool? raffleDraw;


  var n = NumberFormat.compact();
  var f = NumberFormat.decimalPattern("en_US");

  String? get getPoint => f.format(points ?? 0);
  String? get getTicket => f.format(tickets ?? 0);
  String? get getChallenge => f.format(challenge ?? 0);
  String? get getDgn => f.format(dgn ?? 0);
  String? get getNgnValue => f.format((dgn ?? 0) * 10);

  String? get getPointCp => f.format(points ?? 0);
  String? get getTicketCp => n.format(tickets ?? 0);
  String? get getDgnCp => n.format(dgn ?? 0);

  UserModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.username,
        this.gamePlayed,
        this.isVerified,
        this.iat,
        this.exp, this.avatar, this.active});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    gamePlayed = json['game_played'];
    email = json['email'];
    referrer = json['referrer'];
    avatar = "${json['avatar'] ?? '1'}";
    isVerified = json['is_verified'];
    iat = json['iat'];
    exp = json['exp'];

  }

  UserModel.profileFromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    avatar = "${json['avatar'] ?? '1'}";
    lastName = json['last_name'];
    username = json['username'];
    gamePlayed = json['game_played'];
    email = json['email'];
    isVerified = json['is_verified'];
    country = json['country'];
    phone = json['phone'];
    evmAddress = json['evm_address'];
    dgn = json['dgn'];
    ngn = json['ngn'];
    tickets = json['tickets'];
    challenge = json['challenge'];
    points = json['points'];
    rank = json['rank'];
    referrer = json['referrer'];
    exp = json['exp'];
    active = json['active'];
    raffleDraw = json['raffle_draw'];
    luckyDraw = json['lucky_draw'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['first_name'] = firstName;
    data['avatar'] = avatar ?? '1';
    data['last_name'] = lastName;
    data['username'] = username;
    data['email'] = email;
    data['iat'] = iat;
    data['is_verified'] = isVerified;
    data['exp'] = exp;
    data['active'] = active;
    return data;
  }

   RankModel getRank(){
    return RankModel.getRankList(points ?? 0);
  }

  double getRange(int width){
    return width - getPercentageVal(width.toDouble(), percentageOf(getRank().max, points ?? 1));
  }
String wonGame(){
    return DgAuthService().userData.read("wonGames") ?? "0";
}
  String getAvatar(){
    return "https://www.diagon.io/images/avatars/${DgAuthService().userData.read("avatar") ?? 1}.png";
    //
  }

   setAvatar(String value){
     DgAuthService().userData.write("avatar", value);
     UserModel user = DgAuthService().getAuthProfile();
     user.avatar = value;
     DgAuthService().setAuthProfile(user.toJson());

  }


  double percentageOf(int max, int needle){
    return needle * 100 / max;
  }

  double getPercentageVal(double max, double needle){
    return needle * max / 100;
  }


}
