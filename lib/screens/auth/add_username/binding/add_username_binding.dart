import '../controller/add_username_controller.dart';
import 'package:get/get.dart';

class AddUsernameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddUsernameController());
  }
}
