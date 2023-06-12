import '../controller/select_avatar_controller.dart';
import 'package:get/get.dart';

class SelectAvatarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectAvatarController());
  }
}
