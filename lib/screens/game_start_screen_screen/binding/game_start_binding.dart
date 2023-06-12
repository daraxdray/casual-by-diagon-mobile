import '../controller/game_start_screen_controller.dart';
import 'package:get/get.dart';

class GameStartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameStartScreenController());
  }
}
