import '../controller/leader_board_controller.dart';
import 'package:get/get.dart';

class LeaderBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeaderBoardController());
  }
}
