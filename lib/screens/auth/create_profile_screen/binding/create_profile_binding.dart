import '../controller/create_profile_controller.dart';
import 'package:get/get.dart';

class CreateProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateProfileController());
  }
}
