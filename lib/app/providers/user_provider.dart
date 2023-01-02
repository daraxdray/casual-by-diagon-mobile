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


class UserProvider extends GetConnect with DgMixing{
  DiagonNet  networkService = DiagonNet();
  final dgAuthService = Get.find<DgAuthService>();

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
    }
      return response != null;
  }

  Future<bool> addReferrer(Map<String,String> data) async {
    var response = await dgResponse(() async {
      return networkService.post(DgApiRoutes.addReferrer, body: {...data});
    });
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

  Future<bool> getAppInfo() async {
    Map<String,dynamic>? result =  await networkService.get(DgApiRoutes.appInfo,);
    return result != null;
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
        "${DgApiRoutes.transaction}${dgAuthService.getAuthUser().id}?offset=${filter.page}&limit=${filter.limit}");
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
    await networkService.post(DgApiRoutes.activity,body: {
      "user": dgAuthService.getAuthUser().id,
      "type": "Game Play",
      "secret_code":"372979",
      "image": gameResult.image,
      "name": gameResult.title,
      "points": "${gameResult.params?.levelScore ?? gameResult.params?.totalScore}"
    },
    );
  }

  Future<List<PastActivityItemModel>> getActivities(PaginationFilter filter) async {
    List<dynamic> result = await networkService.get(
      "${DgApiRoutes.activity}${dgAuthService.getAuthUser().id}?offset=${filter.page}&limit=${filter.limit}",);
    return  result.map((e) => PastActivityItemModel.fromJson(e)).toList();
  }

  Future<dynamic> checkNameAvailability(String name) async {
    Map<String,dynamic>? result = await dgResponse(() async => await networkService.post(
        DgApiRoutes.checkUsername,body: {"username":name}));
    return result;
  }

  Future<dynamic> sendResetLink(String email) async {
    Map<String,dynamic>? result = await dgResponse(() async => await networkService.post(
        DgApiRoutes.forgotPassword,body: {"email":email}));
    return result;
  }

  Future<Map<String,dynamic>?> changePassword(code,newPassword,confirmPassword, userId) async {
print("$code ----$newPassword  --- $confirmPassword  -----$userId");
    print({"user_id":userId,"password_code":"$code","new_password":"$newPassword","confirm_password":"$confirmPassword"});
    Map<String,dynamic>? result = await dgResponse(() async => await networkService.post(
        DgApiRoutes.resetPassword,body: {"user_id":userId,"password_code":"$code","new_password":"$newPassword","confirm_password":"$confirmPassword"}));
    return result;
  }
}