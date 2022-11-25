import 'package:intl/intl.dart';
import '../services/auth_service.dart';
import './rank_model.dart';


class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? country;
  String? phone;
  String? evmAddress;
  String? avatar;
  int? dgn;
  int? ngn;
  int? tickets;
  int? points;
  int? rank;
  String? referrer;
  bool? isVerified;
  int? iat;
  int? exp;

  var f = NumberFormat.decimalPattern("en_US");
  String get getPoint => f.format(points);
  String get getTicket => f.format(tickets);
  String get getDgn => f.format(dgn);

  UserModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.username,
        this.isVerified,
        this.iat,
        this.exp, this.avatar});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    isVerified = json['isVerified'];
    iat = json['iat'];
    exp = json['exp'];
  }

  UserModel.profileFromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    avatar = json['avatar'];
    lastName = json['lastName'];
    username = json['username'];
    email = json['email'];
    isVerified = json['isVerified'];
    country = json['country'];
    phone = json['phone'];
    evmAddress = json['evmAddress'];
    dgn = json['dgn'];
    ngn = json['ngn'];
    tickets = json['tickets'];
    points = json['points'];
    rank = json['rank'];
    referrer = json['refferer'];
    exp = json['exp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['firstName'] = firstName;
    data['avatar'] = avatar;
    data['lastName'] = lastName;
    data['username'] = username;
    data['email'] = email;
    data['iat'] = iat;
    data['isVerified'] = isVerified;
    data['isVerified'] = isVerified;
    data['exp'] = exp;
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
    return DgAuthService().getAuthProfile().avatar ?? "assets/img/avatars/avatar73.png";
  }
  double percentageOf(int max, int needle){
    return needle * 100 / max;
  }

  double getPercentageVal(double max, double needle){
    return needle * max / 100;
  }


}
