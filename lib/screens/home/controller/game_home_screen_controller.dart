import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../../app/models/games.dart';
import '../../../app/providers/games_provider.dart';
import '../../../app/providers/user_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreenController extends GetxController {

  Rx<bool> componentsLoaded = false.obs;
  RxList<GameModel> gameList = <GameModel>[].obs;
  RxList<GameModel> slideGameList = <GameModel>[].obs;
  RxList<GameModel> tournamentList = <GameModel>[].obs;
  RxList<GameModel> topGameList = <GameModel>[].obs;
  final GameProvider gameProvider = GameProvider();
  final UserProvider userProvider = UserProvider();
Random random = Random();
RxInt randomInt =  0.obs;
 final RefreshController refreshController =
  RefreshController(initialRefresh: false);

Rx<GameModel>  randomGame (){
  return slideGameList[randomInt.value].obs;
}
  RxList<GameModel> dailyChallenge = <GameModel>[].obs;
void  get5DailyChallenge(){
  dailyChallenge = gameList;
  dailyChallenge.shuffle(random);
    // if(gameList.isNotEmpty){
    //       List<int>  uniqueRand = [];
    //   for(int i = 0; uniqueRand.length < 4; i++){
    //       int r = random.nextInt(gameList.length -1);
    //       if(uniqueRand.contains(r) == false){
    //         uniqueRand.add(r) ;
    //       dailyChallenge.add(gameList[r]) ;
    //       }
    //   }
    // }
}

  void onRefresh() async{
    // monitor network fetch
    componentsLoaded(false);
    gameList.clear();
    slideGameList.clear();
    topGameList.clear();
    dailyChallenge.clear();
    loadComponents();
    refreshController.refreshCompleted();
  }


  void loadComponents() async {
  userProvider.getProfile();
    gameList.addAll(await gameProvider.getGames());
    slideGameList.addAll(gameList.where((element) => element.slide == true).toList());
    topGameList.addAll(await gameProvider.getTopGames());
    if(slideGameList.isNotEmpty ){
    randomInt(random.nextInt(slideGameList.length));
    get5DailyChallenge();
        componentsLoaded(true);
    tournamentList.addAll(gameList.where((element) => element.slide == true).toList());

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
  refreshController.dispose();
    super.onClose();
  }
}
