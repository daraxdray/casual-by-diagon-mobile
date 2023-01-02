
import 'package:casual/app/providers/user_provider.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import '../../../app/models/game_result_model.dart';
import '../../../app/routes/routes.dart';
import '../models/game_play_screen_game_over_model.dart';

class GamePlayScreenGameOverController extends GetxController {
  Rx<GamePlayScreenGameOverModel> gamePlayScreenGameOverModelObj =
      GamePlayScreenGameOverModel().obs;
   RxDouble currentMargin = 0.0.obs;
  GameResult get getGameResult => Get.arguments;
  UserProvider userProvider = UserProvider();

  @override
  void onInit() {
    super.onInit();
    userProvider.getProfile();
    Future.delayed(Duration(seconds:5),()=>Get.toNamed(DgRoutes.authRoute(DgRoutes.gameHomeScreen)));
    }

  @override
  void onReady() {
    super.onReady();

  }

  @override
  void onClose() {
    super.onClose();
  }

  void goToGame(){
    Get.back();
  }
}
