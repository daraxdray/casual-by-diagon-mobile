import '../controller/game_rules_controller.dart';
import 'package:get/get.dart';

class GamePlayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameDetailsController());
  }
}
