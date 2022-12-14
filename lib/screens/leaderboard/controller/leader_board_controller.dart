import 'package:casual/app/services/auth_service.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../app/providers/games_provider.dart';
import '../models/leader_board_model.dart';


class LeaderBoardController extends GetxController {
  RxList<LeaderBoardModel> leaders = <LeaderBoardModel>[].obs;
  final GameProvider _gameProvider = GameProvider();
  final DgAuthService authService = DgAuthService();
  RxBool loaded = false.obs;
  RxInt userScore = 1000.obs;
  Rx<LeaderBoardModel> userLead = LeaderBoardModel().obs;

  @override
  void onReady() {
    super.onReady();
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
    List<LeaderBoardModel> result = await _gameProvider.getLeaderBoard();
    leaders.clear();
    leaders.addAll(result);
    int r = result.indexWhere((element) => element.username?.toLowerCase() == authService.getAuthProfile().username?.toLowerCase());
    if(r != -1){
    userScore( r+1);
    }

    loaded(true);



  }
}
