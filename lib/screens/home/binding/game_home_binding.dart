
import 'package:get/get.dart';

import '../controller/game_home_screen_controller.dart';

class GameHomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController(), tag:'first_home');
  }
}