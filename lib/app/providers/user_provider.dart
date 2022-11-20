import 'package:get/get.dart';
import '../../screens/auth/login/models/log_in_model.dart';
import '../../screens/auth/sign_up_two_screen/models/sign_up_two_model.dart';
import '../../widgets/snackbar.dart';
import '../models/game_result_model.dart';
import '../models/pagination_filter.dart';
import '../models/user.dart';
import '../routes/api_routes.dart';
import '../services/auth_service.dart';
import '../utils/custom_exception.dart';
import '../utils/dg_mixins.dart';
import '../utils/diagon_net.dart';


class UserProvider extends GetConnect with DgMixing{
  DiagonNet  networkService = DiagonNet();
  final dgAuthService = Get.find<DgAuthService>();

  String? getEmail() => dgAuthService.userData.read('email');
  bool _response(dynamic response){
        try{
            print(response);
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
      dgAuthService.login(res['accessToken']);
      return res;
    }, callback:getProfile);

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

  Future<bool>verifyEmail(String code) async {
    var respon = await dgResponse(() async =>networkService.post(DgApiRoutes.verify, body: {"code":code,"userID":dgAuthService.getAuthUser().id})
    ,callback: getProfile);

    return respon != null? true:false;
  }
  Future<bool> sendEmailCode() async {
    var result = await networkService.post(
        DgApiRoutes.resendVerification, body: {
          "userID":dgAuthService.getAuthUser().id,
        });

      return true;
  }


  Future<UserModel> getProfile() async {
    Map<String,dynamic> result = await networkService.get(
        "${DgApiRoutes.profile}${dgAuthService.getAuthUser().id}",);
    dgAuthService.setAuthProfile(result);
    result['avatar'] = dgAuthService.userData.read("avatar") ?? "assets/img/avatars/avatar72.png";
      return UserModel.profileFromJson(result);
  }

  void updateHighScore(GameResult gameResult){
    int? highscore = dgAuthService.userData.read("${gameResult.gameID}_highscore");
    //∞∞∞∞∞∞∞UPDATE HIGHSCORE∞∞∞∞//
    int? score =  gameResult.params?.totalScore ?? gameResult.params?.levelScore ?? 0;
    if(highscore != null){
      //∞∞∞∞∞ONLY UPDATE IF THE THE SCORE IS GREATER
      if(score > highscore){
        dgAuthService.userData.write("${gameResult.gameID}_highscore", score);
      }
    }else{
      //∞∞∞UPDATE IF NO HIGH SCORE IS FOUND
      dgAuthService.userData.write("${gameResult.gameID}_highscore", score);
    }
  }

  Future<void> setGameScore  (GameResult gameResult) async{
    updateHighScore(gameResult);
    var result = await networkService.post(DgApiRoutes.activity,body: {
      "user": dgAuthService.getAuthUser().id,
      "type": "Game Play",
      "name": gameResult.gameName,
      "points": "${gameResult.params?.levelScore ?? gameResult.params?.totalScore}"
    },
    );
    print(result);
  }


  // Future<List<PastActivityItemModel>> getActivities(PaginationFilter filter) async {
  //
  //
  //   List<dynamic> result = await networkService.get(
  //     "${DgApiRoutes.activity}${dgAuthService.getAuthUser().id}?offset=${filter.page}&limit=${filter.limit}",);
  //   return  result.map((e) => PastActivityItemModel.fromJson(e)).toList();
  // }

  Future<dynamic> checkNameAvailability(String name) async {
    Map<String,dynamic>? result = await dgResponse(() async => await networkService.post(
        DgApiRoutes.checkUsername,body: {"username":name}));
    return result;
  }
}