
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../app/routes/routes.dart';
import '../../../app/services/auth_service.dart';

class ProfileSettingsController extends GetxController {
  // Rx<ProfileSettingsModel> profileSettingsModelObj = ProfileSettingsModel().obs;
  DgAuthService authService = DgAuthService();
  RxBool checkbox = false.obs;

  @override
  void onReady() {
    super.onReady();
  }


  @override
  void onClose() {
    super.onClose();
  }


  void logUserOut(){
    if(authService.logOut()){
      Get.offAllNamed(DgRoutes.logInScreen);
    };

  }
}
