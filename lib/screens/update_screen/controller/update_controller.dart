
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../app/services/auth_service.dart';
import '../models/update_model.dart';

class UpdateController extends GetxController {
  Rx<UpdateModel> updateModelObj = UpdateModel().obs;
    RxBool isLoading = false.obs;
    DgAuthService dgAuthService = DgAuthService();
    RxString downloadLink = "".obs;

  @override
  void onReady() {
    if(GetPlatform.isAndroid){
    downloadLink(dgAuthService.userData.read("adr_download_link"));
    }
else{
    downloadLink (dgAuthService.userData.read("ios_download_link"));
    }
      super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
