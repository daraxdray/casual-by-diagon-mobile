import '../controller/high_score_controller.dart';
import 'package:get/get.dart';

class HighScoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HighScoreController());
  }
}
