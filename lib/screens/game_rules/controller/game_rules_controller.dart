

import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import '../../../app/models/games.dart';
import '../../../app/providers/games_provider.dart';
import '../../../app/providers/user_provider.dart';
import '../../../app/routes/routes.dart';
import '../../../widgets/snackbar.dart';


class GameDetailsController extends GetxController {
  Rx<GameModel?> gameModel = Rxn<GameModel>();
  GameProvider gameProvider = GameProvider();
  UserProvider userProvider = UserProvider();
  var score = 0.obs;
  Rx<bool> componentsLoaded = false.obs;


  Future<void> fetchGame () async{

    gameModel(await gameProvider.getGameById("${Get.arguments['gameId']}"));
  }

  @override
  void onInit() {
      fetchGame().then((value) {
          componentsLoaded(true);
      });
    super.onInit();
  }

  String getHighScore(){
    String? id = gameModel.value?.title?.replaceAll(" ", "-").toLowerCase() ?? "nothing";
    return "${gameProvider.getHighscore(id) ?? 0}";
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void gotoGame(){
  if(gameModel.value != null && gameModel.value?.url != null){
    Get.toNamed(DgRoutes.authRoute(DgRoutes.gameStart), arguments:gameModel.value);
  }else{
    successSnack("Info", "Please wait - Loading Game");
  }

  }
}
