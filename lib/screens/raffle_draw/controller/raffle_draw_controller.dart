import 'package:casual/app/models/raffle_draw.dart';
import 'package:casual/app/providers/user_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../app/models/app_settings_model.dart';
import '../../../app/models/games.dart';
import '../../../app/providers/games_provider.dart';
import '../../../app/services/auth_service.dart';
import '../../../widgets/snackbar.dart';



class RaffleDrawController extends GetxController  {

  final DgAuthService authService = Get.find<DgAuthService>();
  Rx<double> titleOpacity = 0.0.obs;
  Rx<double> imageOpacity = 0.0.obs;
  Animation? curve;
  RxBool loading = false.obs;
  RxBool joinLoading = false.obs;
  RxBool joinLuckyLoading = false.obs;
  final UserProvider userProvider = UserProvider();
  GameProvider gameProvider = GameProvider();
  int endTime = DateTime.parse("2023-01-30").millisecondsSinceEpoch + 1000 * 6900;
  Rx<AppSettingModel> appSettings = AppSettingModel().obs;
  RxList<GameModel> topGameList = <GameModel>[].obs;
  RxList<RaffleDrawWinner> raffles = <RaffleDrawWinner>[].obs;

  final RefreshController rfCtr = RefreshController(initialRefresh: false);

  void onRefresh() async {
    loading(true);
    rfCtr.refreshCompleted();
    await fetchSystemSettings();
    loading(false);
  }
  @override
  void onReady() async{
    super.onReady();

  }

  Future<void> fetchSystemSettings() async{
    appSettings(await gameProvider.getChallengeTime());
    raffles.clear();
    raffles.addAll( await gameProvider.getRaffleWinners());
  }
  @override
  void onInit() async {
    loading(true);
    topGameList.addAll(await gameProvider.getTopGames());
    await fetchSystemSettings();
    loading(false);
  }



  @override
  void onClose() {
    super.onClose();
    loading(true);
  }


  void joinRaffle() async {
    joinLoading(true);
    var result = await userProvider.joinRaffle();
    joinLoading(false);
    if(result){
      successSnack("Updated", "Raffle draw joined");
     await userProvider.getProfile();
      rfCtr.requestRefresh();
    }
  }


  void joinLucky() async {
    joinLuckyLoading(true);
    var result = await userProvider.joinLucky();
    joinLuckyLoading(false);
    if(result){
      successSnack("Updated", "Lucky Draw Joined");
      await userProvider.getProfile();
      rfCtr.requestRefresh();
    }
  }

}
