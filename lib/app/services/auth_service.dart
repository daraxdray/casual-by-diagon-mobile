import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../models/user.dart';

// import '../models/user.dart';

class DgAuthService extends GetxService{
  final GetStorage userData = GetStorage();

  // bool hasExpired = JwtDecoder.isExpired(yourToken);

  String get token => userData.hasData('accessToken')? userData.read('accessToken') : "";

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