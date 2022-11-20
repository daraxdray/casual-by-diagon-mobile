import 'package:get/get.dart';
import '../controller/active_game_play_controller.dart';

class ActiveGamePlayBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ActiveGamePlayController(),);
  }
}

