import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../models/user.dart';

// import '../models/user.dart';

class DgAuthService extends GetxService{
  final GetStorage userData = GetStorage();

  // bool hasExpired = JwtDecoder.isExpired(yourToken);

  String get token => userData.hasData('accessToken')? userData.read('accessToken') : "";
  static final List<String> imageList =
  ["assets/img/avatars/avatar63.png",
    "assets/img/avatars/avatar64.png",
    "assets/img/avatars/avatar65.png",
    "assets/img/avatars/avatar66.png",
    "assets/img/avatars/avatar67.png",
    "assets/img/avatars/avatar68.png",
    "assets/img/avatars/avatar69.png",
    "assets/img/avatars/avatar70.png",
    "assets/img/avatars/avatar71.png",
    "assets/img/avatars/avatar72.png",
    "assets/img/avatars/avatar73.png",
    "assets/img/avatars/avatar74.png",
    "assets/img/avatars/avatar75.png",
    "assets/img/avatars/avatar76.png"];

  bool isAuthenticated(){
    try {
      if (userData.hasData("accessToken") == false) {
        return false;
      }
      return true;
    }catch(e){
      return false;
    }
  }
  void login(String accessToken){
      userData.write("accessToken", accessToken);
      userData.write("isLoggedIn", true);
  }

  bool isVerified(){
      return getAuthProfile().isVerified == true;
  }

  bool logOut(){
     userData.remove("accessToken");
     return true;
  }

 //
  UserModel getAuthUser(){
     Map<String, dynamic> decodedToken =  JwtDecoder.decode(userData.read("accessToken"));
      return UserModel.fromJson(decodedToken);
  }
 //
 UserModel getAuthProfile(){
      return UserModel.profileFromJson(userData.read("userProfile"));
  }
String getAvatar(){
    return getAuthProfile().avatar ?? "assets/img/avatars/avatar73.png";
}

  void setAuthProfile(Map<String, dynamic> json){
    userData.write("userProfile", json);
  }


}