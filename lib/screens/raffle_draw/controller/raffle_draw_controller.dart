import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../app/models/games.dart';
import '../../../app/providers/games_provider.dart';
import '../../../app/routes/routes.dart';
import '../../../app/services/auth_service.dart';


class RaffleDrawController extends GetxController  {

  final DgAuthService authService = Get.find<DgAuthService>();
  Rx<double> titleOpacity = 0.0.obs;
  Rx<double> imageOpacity = 0.0.obs;
  Animation? curve;
  RxBool loading = false.obs;
  GameProvider gameProvider = GameProvider();
  int endTime = DateTime.parse("2023-01-30").millisecondsSinceEpoch + 1000 * 6900;
  final RefreshController refreshController =
  RefreshController(initialRefresh: false);
  RxList<GameModel> topGameList = <GameModel>[].obs;

  void onRefresh() async{
    loading(true);
    refreshController.refreshCompleted();
    Future.delayed(const Duration(seconds: 1,), ()=> loading(false));
  }

  @override
  void onReady() {
    super.onReady();
    // topGameList.addAll(await gameProvider.getTopGames());

  }

  @override
  void onInit() async {
    loading(true);
    topGameList.addAll(await gameProvider.getTopGames());
    loading(false);
  }



  @override
  void onClose() {
    super.onClose();
    loading(true);
    Future.delayed(const Duration(seconds: 1,), ()=> loading(false));
  }


}
