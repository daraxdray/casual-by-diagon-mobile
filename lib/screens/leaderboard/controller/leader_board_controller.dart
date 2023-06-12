import 'package:casual/app/services/auth_service.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../app/models/app_settings_model.dart';
import '../../../app/providers/games_provider.dart';
import '../models/leader_board_model.dart';


class LeaderBoardController extends GetxController {
  RxList<LeaderBoardModel> leaders = <LeaderBoardModel>[].obs;
  final GameProvider gameProvider = GameProvider();
  final DgAuthService authService = DgAuthService();
  Rx<bool> showLeader = true.obs;
  int endTime = 0;
  RxBool loaded = false.obs;
  RxBool reload = false.obs;
  RxInt userScore = 1000.obs;
  Rx<AppSettingModel> appSettings = AppSettingModel().obs;
  Rx<LeaderBoardModel> userLead = LeaderBoardModel().obs;
  RxInt position = 0.obs;
bool  countryIsNigeria = false;
RxBool isNetworkError = false.obs;

  @override
  void onReady() {
    super.onReady();
    countryIsNigeria = authService.userData.read("userCountry") == "Nigeria";
    endTime = DateTime.parse(authService.challengeDate).millisecondsSinceEpoch + 1000 * 6900;

  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {
  getLeaders();
  super.onInit();
  }

  void getLeaders() async {
    try {
      isNetworkError.value = true;
      position(await gameProvider.getPosition());
      List<LeaderBoardModel> result = await gameProvider.getLeaderBoard();
      AppSettingModel p = await gameProvider.getChallengeTime();
      appSettings.value = p;
      leaders.clear();
      leaders.addAll(result);
      int r = result.indexWhere((element) =>
      element.username?.toLowerCase() == authService
          .getAuthProfile()
          .username
          ?.toLowerCase());

      if (r != -1) {
        userScore(r + 1);
      }
      if(leaders.isEmpty){
        reload(true);
      }
      loaded(true);

    }catch(e){
      reload(true);
    }


  }
}
