import '../controller/past_activity_controller.dart';
import 'package:get/get.dart';

class PastActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PastActivityController());
  }
}
