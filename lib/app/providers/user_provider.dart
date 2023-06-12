import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../screens/auth/login/models/log_in_model.dart';
import '../../screens/auth/sign_up_two_screen/models/sign_up_two_model.dart';
import '../../screens/past_activity_screen/models/past_activity_item_model.dart';
import '../../widgets/snackbar.dart';
import '../models/game_result_model.dart';
import '../models/highscore_model.dart';
import '../models/pagination_filter.dart';
import '../models/user.dart';
import '../routes/api_routes.dart';
import '../services/auth_service.dart';
import '../utils/custom_exception.dart';
import '../utils/dg_mixins.dart';
import '../utils/diagon_net.dart';
import '../../../app/models/transaction_model.dart';
import '../../../app/models/referrer_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class UserProvider extends GetConnect with DgMixing{
  DiagonNet  networkService = DiagonNet();
  final dgAuthService = Get.find<DgAuthService>();
  final int localVersion = Platform.isIOS? int.parse(dotenv.env['IOS_VERSION'] ?? '0')
      : int.parse(dotenv.env['ANDROID_VERSION'] ?? '0') ; // ensure to increment anytime you upload to appstore
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();


  Future<Map<String,dynamic>> getSystemSettings() async {
    Map<String,dynamic>? result =  await networkService.get(DgApiRoutes.appInfo,);
    return {"primary_currency":result!['primary_currency'],
      "primary_currency_symbol": result['primary_currency_symbol'],
      "primary_currency_rate": result['primary_currency_rate'],
      "default_currency": result['default_currency'],
      "default_currency_symbol": result['default_currency_symbol'],
      "default_currency_rate": result['default_currency_rate'],
      "raffle_draw_amount": result['raffle_draw_amount'],
      "raffle_draw_currency": result['raffle_draw_currency'],
      "raffle_draw_currency_symbol": result['raffle_draw_currency_symbol'],
      "weekly_draw_tickets": result['weekly_draw_tickets'],
      "lucky_draw_tickets": result['lucky_draw_tickets'],
    };
  }


  String? getEmail() => dgAuthService.userData.read('email');
  bool _response(dynamic response){
        try{
            successSnack("Success", "Done");
            return true;
        }on BadRequestException catch(resp, cust) {
          failedSnack("Error",resp.response['message'],);
          return false;
        }
        on CustomException catch (resp,initial){
          failedSnack("Error",resp.response['message'],);
          return false;
        }
  }

  Future<bool> login(LogInModel logInModelObj) async {
    ;
    var result = await dgResponse(() async {
      var res = await networkService.post(DgApiRoutes.signin, body: logInModelObj.toJson());
      dgAuthService.login(res['access_token']);

      return res;
    }, callback:getProfile);
    if(result != null){
      return true;
    }
    return false;
  }

  Future<bool> deleteAccount(String userId) async {
    var result = await dgResponse(() async {
      var res = await networkService.delete("${DgApiRoutes.deleteAccount}$userId");
      return res;
    });

    if(result != null){
      return true;
    }
    return false;
  }

  Future<bool> signup(SignUpModel signUpModelObj) async {
    var response = await dgResponse(() async {
      dgAuthService.userData.write('email', signUpModelObj.email);
      return networkService.post(
        DgApiRoutes.signup, body: signUpModelObj.toJson());
    });
      return response != null;
  }

  Future<bool> updateProfile(Map<String,String> data) async {
    var response = await dgResponse(() async {
      UserModel user = dgAuthService.getAuthUser();
      return networkService.patch(
        "${DgApiRoutes.profile}${user.id}", body: {...data, "user":user.id});
    });
    if(response != null){
    dgAuthService.userData.write('avatar', response['avatar']);
    dgAuthService.setAuthProfile(response);
    print(response);
    }
      return response != null;
  }

  Future<bool> addReferrer(Map<String,String> data) async {
    var response = await dgResponse(() async {
      return networkService.post(DgApiRoutes.addReferrer, body: {...data});
    });
      return response != null;
  }

  Future<bool> joinRaffle() async {
    var response = await dgResponse(() async {
      return networkService.post(DgApiRoutes.joinRaffleDraw, body: {"user_id":dgAuthService.getAuthUser().id});
    });
    print(response);
      return response != null;
  }

  Future<bool> joinLucky() async {
    var response = await dgResponse(() async {
      return networkService.post(DgApiRoutes.joinLuckyDraw, body: {"user_id":dgAuthService.getAuthUser().id});
    });
    print(response);
      return response != null;
  }

  Future<bool>verifyEmail(String code) async {
    var respon = await dgResponse(() async =>networkService.post(DgApiRoutes.verify, body: {"code":code,"user_id":dgAuthService.getAuthUser().id})
    ,callback: getProfile);
    return respon != null? true:false;
  }
  Future<bool> sendEmailCode() async {
    var result = await dgResponse(() async =>  networkService.post(
        DgApiRoutes.resendVerification, body: {
          "user_id":dgAuthService.getAuthUser().id,
        }));
      return result != null;
  }


  Future<UserModel?> getProfile() async {
    Map<String,dynamic>? result1 = await  dgResponse(() async {
      Map<String,dynamic> result = await networkService.get("${DgApiRoutes.profile}${dgAuthService.getAuthUser().id}",);
      result['avatar'] = dgAuthService.userData.read("avatar") ?? 1;
      dgAuthService.setAuthProfile(result);
      return result;
    });
    if(result1 != null) {
      return UserModel.profileFromJson(result1);
    } else {
      return null;
    }
  }

  Future<List<DgReferrerModel?>> getUserReferrers() async {
    List<DgReferrerModel?>? result1 = await  dgResponse(() async {
      List<dynamic> result = await networkService.get("${DgApiRoutes.referrals}${dgAuthService.getAuthUser().id}",);
      return result.map((e) => DgReferrerModel.fromJson(e)).toList();
    });
    if(result1 != null) {
      return result1;
    } else {
      return [];
    }
  }

  Future<int> getUserReferrersCount() async {
    int? result1 = await  dgResponse(() async {
      List<dynamic> result = await networkService.get("${DgApiRoutes.referrals}${dgAuthService.getAuthUser().id}",);
      return result.length;
    });
    if(result1 != null) {
      return result1;
    } else {
      return 0;
    }
  }

  Future<List<DgReferrerModel?>> getUserReferrersByPage(PaginationFilter filter) async {
    List<DgReferrerModel?>? result1 = await  dgResponse(() async {
      List<dynamic> result = await networkService.get("${DgApiRoutes.referrals}${dgAuthService.getAuthUser().id}?${filter.page != 1?'offset=${filter.page}&' : ''}limit=${filter.limit}",);
      return result.map((e) => DgReferrerModel.fromJson(e)).toList();
    });
    if(result1 != null) {
      return result1;
    } else {
      return [];
    }
  }

   Future<bool> getAppInfo() async {
    Map<String,dynamic>? result =  await networkService.get(DgApiRoutes.appInfo,);
    bool isNewVersion = false;
    if(result != null && result['live_version'] != null){
      //check if the api version is lesser than the stored version.
      if(Platform.isIOS){
      isNewVersion = localVersion  < int.parse("${result['ios_version'] ?? 0}");
      }else{
      isNewVersion = localVersion  < int.parse("${result['android_version'] ?? 0}");
      }
      dgAuthService.userData.write("adr_download_link", result['adr_download_link']);
      dgAuthService.userData.write("ios_download_link", result['ios_download_link']);

    }
    return isNewVersion;
  }


  Future<List<HighScoreModel>> getHighScore() async {
    List<dynamic>  result = await networkService.get(
        "${DgApiRoutes.highscore}${dgAuthService.getAuthUser().id}",);
      return  result.map((e) => HighScoreModel.fromJson(e)).toList();
  }

  Future<List<TransactionModel>> getTransactions() async {
    List<dynamic>  result = await networkService.get(
        "${DgApiRoutes.transaction}${dgAuthService.getAuthUser().id}?limit=10",);
      return  result.map((e) => TransactionModel.fromJson(e)).toList();
  }
  Future<List<TransactionModel>> getTransactionsByPage(PaginationFilter filter) async {
    List<dynamic>  result = await networkService.get(
        "${DgApiRoutes.transaction}${dgAuthService.getAuthUser().id}?${filter.page != 1?'offset=${filter.page}&' : ''}limit=${filter.limit}");
      return  result.map((e) => TransactionModel.fromJson(e)).toList();
  }

  void updateHighScore(GameResult gameResult){
    int? highscore = dgAuthService.userData.read("${gameResult.title?.toLowerCase().replaceAll(" ", "_")}_highscore");
    //∞∞∞∞∞∞∞UPDATE HIGHS-CORE∞∞∞∞//
    int? score =  gameResult.params?.totalScore ?? gameResult.params?.levelScore ?? 0;
    if(highscore != null){
      //∞∞∞∞∞ONLY UPDATE IF THE THE SCORE IS GREATER
      if(score > highscore){
        dgAuthService.userData.write("${gameResult.title?.toLowerCase().replaceAll(" ", "_")}_highscore", score);
      }
    }else{
      //∞∞∞UPDATE IF NO HIGH SCORE IS FOUND
      dgAuthService.userData.write("${gameResult.title?.toLowerCase().replaceAll(" ", "_")}_highscore", score);
    }
  }

  Future<void> setGameScore  (GameResult gameResult) async{
    updateHighScore(gameResult);
    //check if game is biliard
    String? deviceInfo = await DgAuthService.getId(model:true);
    String? deviceId = await DgAuthService.getId();
    await networkService.post(DgApiRoutes.activity,body: {
      "user": dgAuthService.getAuthUser().id,
      "type": "Game Play",
      "secret_code":"372979",
      "code":"545454",
      "event":gameResult.event,
      "app_version":"${dotenv.env['LINK_VERSION']}",
      "image": gameResult.image,
      "name": gameResult.title,
      "device_id": deviceId,
      "device_name":deviceInfo,
      "points": "${gameResult.params?.levelScore ?? gameResult.params?.totalScore}"
    },);
  }

  Future<List<PastActivityItemModel>> getActivities(PaginationFilter filter) async {
    List<dynamic> result = await networkService.get(
      "${DgApiRoutes.activity}${dgAuthService.getAuthUser().id}?${filter.page != 1?'offset=${filter.page}&' : ''}limit=${filter.limit}",);
    return  result.map((e) => PastActivityItemModel.fromJson(e)).toList();
  }

  Future<dynamic> checkNameAvailability(String name) async {
    Map<String,dynamic>? result = await dgResponse(() async => await networkService.post(
        DgApiRoutes.checkUsername,body: {"username":name}));

    return result!['taken'] == true;
  }

  Future<dynamic> sendResetLink(String email) async {
    Map<String,dynamic>? result = await dgResponse(() async => await networkService.post(
        DgApiRoutes.forgotPassword,body: {"email":email}));
    return result;
  }

  Future<Map<String,dynamic>?> changePassword(code,newPassword,confirmPassword, userId) async {
    userId = userId == ""? dgAuthService.userData.read("fuserId") : userId;
    Map<String,dynamic>? result = await dgResponse(() async => await networkService.post(
        DgApiRoutes.resetPassword,body: {"user_id":userId,"password_code":"$code","new_password":"$newPassword","confirm_password":"$confirmPassword"}));

    return result;
  }
}