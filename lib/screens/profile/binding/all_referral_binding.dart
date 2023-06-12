import 'package:get/get.dart';
import '../controller/all_referrals_controller.dart';
import '../controller/referal_controller.dart';


class AllReferralsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllReferralsController());
  }
}
