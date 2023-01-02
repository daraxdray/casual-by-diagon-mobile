import 'package:get/get.dart';
import '../controller/referal_controller.dart';


class ReferralBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserReferralController());
  }
}
