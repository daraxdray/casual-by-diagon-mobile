import '../controller/update_controller.dart';
import 'package:get/get.dart';

class UpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateController());
  }
}
