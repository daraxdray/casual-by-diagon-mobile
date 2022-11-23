import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../../app/models/games.dart';
import '../../../app/providers/games_provider.dart';
import '../../../app/providers/user_provider.dart';

class HomeScreenController extends GetxController {

  Rx<bool> componentsLoaded = false.obs;
  RxList<GameModel> gameList = <GameModel>[].obs;
  RxList<GameModel> slideGameList = <GameModel>[].obs;
  RxList<GameModel> topGameList = <GameModel>[].obs;
  GameProvider gameProvider = GameProvider();
  final UserProvider userProvider = UserProvider();
Random random = Random();
RxInt randomInt =  0.obs;

Rx<GameModel>  randomGame (){
  return gameList[randomInt.value].obs;
}
  RxList<GameModel> dailyChallenge = <GameModel>[].obs;
void  get5DailyChallenge(){
    if(gameList.isNotEmpty){
          List<int>  uniqueRand = [];
      for(int i = 0; uniqueRand.length < 4; i++){
          int r = random.nextInt(gameList.length -1);
          if(uniqueRand.contains(r) == false){
            uniqueRand.add(r) ;
          dailyChallenge.add(gameList[r]) ;
          }
      }
    }
}



  void loadComponents() async {
    gameList.addAll(await gameProvider.getGames());
    slideGameList.addAll(gameList.where((element) => element.slide == true).toList());
    topGameList.addAll(await gameProvider.getTopGames());

    if(gameList.isNotEmpty ){
    randomInt(random.nextInt(gameList.length));
    get5DailyChallenge();
        componentsLoaded(true);
    }else{
      // Get.offNamed(DgRoutes.authRoute(DgRoutes.noInternet),arguments: DgRoutes.gameHomeScreen);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    loadComponents();
    super.onInit();
  }
  @override
  void onClose() {
  gameProvider.dispose();
    super.onClose();
  }
}
