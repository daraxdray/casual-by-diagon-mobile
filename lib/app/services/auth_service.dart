import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:platform_device_id/platform_device_id.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';

// import '../models/user.dart';

class DgAuthService extends GetxService{
  final GetStorage userData = GetStorage();
  // bool hasExpired = JwtDecoder.isExpired(yourToken);
  UserModel get userModel => getAuthProfile();
  set setUserModel(der) => setAuthProfile;
   String get challengeMessage => userData.read("challenge_message") ?? "CHALLENGE STARTS IN ";
   String get challengeDate => userData.read("challenge_end_time") ?? DateTime.now().toIso8601String();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

   start()async{
    var auth = DgAuthService();
    auth.userData.write("gameSound", true);
    auth.userData.write("notification", true);

  }
  String get token => userData.hasData('access_token')? userData.read('access_token') : "";
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
      if (userData.hasData("access_token") == false || getAuthProfile().id  == null) {
        return false;
      }
      return true;
    }catch(e){
      return false;
    }
  }

  bool hasUsername(){
    try {
      if (userData.hasData("access_token") == false || getAuthProfile().username  == null || getAuthProfile().username  == "") {
        return false;
      }
      return true;
    }catch(e){
      return false;
    }
  }

  void login(String access_token){
      userData.write("access_token", access_token);
      userData.write("isLoggedIn", true);
  }

  bool isVerified(){
      return getAuthProfile().isVerified == true;
  }

  bool logOut(){
     userData.remove("access_token");
     userData.remove("userProfile");
     return true;
  }

 //
  UserModel getAuthUser(){
     Map<String, dynamic> decodedToken =  JwtDecoder.decode(userData.read("access_token"));
      return UserModel.fromJson(decodedToken);
  }
 //
 UserModel getAuthProfile(){
      return UserModel.profileFromJson(userData.read("userProfile") ?? {});
  }

String getAvatar(){
    return "https://www.diagon.io/images/avatars/${getAuthProfile().avatar ?? 1}.png" ;
    //
}

Future<String> refetchAvatar() async {
    return "https://www.diagon.io/images/avatars/${getAuthProfile().avatar ?? 1}.png" ;
    //
}



  void setAuthProfile(Map<String, dynamic> json){
    userData.write("userProfile", json);
  }

  static launchURL(String url, { LaunchMode? launchMode}) async {

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url),mode: launchMode ??  LaunchMode.inAppWebView);
    } else {
      throw 'Could not launch $url';
    }
  }

  static launchFile(String url) async {

      await launchUrl(Uri.file(url));
  }

  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }


  static launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{
        'subject': 'Example Subject & Symbols are allowed!',
      }),
    );
      await launchUrl(emailLaunchUri);

  }


  static Future<String?> getId({bool model = false}) async {
    var deviceInfo = DeviceInfoPlugin();
      String? deviceId = await PlatformDeviceId.getDeviceId;
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return model? iosDeviceInfo.model : deviceId; // unique ID on iOS
    } else if(Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return model? androidDeviceInfo.model : deviceId; // unique ID on Android
    }
  }



}