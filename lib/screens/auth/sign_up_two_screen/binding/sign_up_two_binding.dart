import '../controller/sign_up_two_controller.dart';
import 'package:get/get.dart';

class SignUpTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpTwoController());
  }
}
