import '../controller/high_score_controller.dart';
import 'package:get/get.dart';

class PastActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HighScoreController());
  }
}
