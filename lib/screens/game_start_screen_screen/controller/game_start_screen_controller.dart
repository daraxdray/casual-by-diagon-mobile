import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../app/models/games.dart';
import '../../../app/routes/routes.dart';
import '../../../app/services/auth_service.dart';


class GameStartScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? animation;
  final DgAuthService dgAuthService = DgAuthService();
  Rxn<GameModel> gameModel = Rxn<GameModel>();
  Rx<int> countdown = 3.obs;
  Timer? _timer;
  RxBool gameStarted = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    gameModel(Get.arguments);
    animation =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    Future.delayed(const Duration(milliseconds: 1200), timerCountDown);
    super.onInit();
  }

  timerCountDown() {
    const oneSec = Duration(seconds: 1);
    String? url =  Platform.isIOS? gameModel.value?.no_ads_url: gameModel.value?.url;
    _timer = Timer.periodic(oneSec, (timer) {
      if (countdown.value == 0) {
        _timer?.cancel();
        gameStarted(true);
        Get.offNamed(DgRoutes.authRoute(DgRoutes.activeGamePlayScreen),
            arguments: {'url': "$url",'image':gameModel.value?.image, 'title':gameModel.value?.title});
      } else {
        countdown.value--;
      }
    });
  }

  void goToGame() {
    Get.offNamed(DgRoutes.authRoute(DgRoutes.activeGamePlayScreen),
        arguments: {'url': gameModel.value?.url});
  }

  @override
  void onClose() {
    super.onClose();
    _timer?.cancel();
    animation?.dispose();
  }
}
