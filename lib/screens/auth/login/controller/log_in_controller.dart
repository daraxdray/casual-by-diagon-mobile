import 'package:casual/app/services/auth_service.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/providers/user_provider.dart';
import '../../../../app/routes/routes.dart';
import '../../../../app/utils/global_key_factory.dart';
import '../../../../widgets/snackbar.dart';
import '../models/log_in_model.dart';


class LogInController extends GetxController{
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  final GlobalKey<FormFieldState>  emailField = GlobalKeyFactory.generateUniqueFormFieldKey();
  final GlobalKey<FormFieldState> pwField = GlobalKeyFactory.generateUniqueFormFieldKey();
  final UserProvider userProvider = UserProvider();
  RxBool passVisible = false.obs;
  final GlobalKey<FormState> loginFormKey = GlobalKeyFactory.generateUniqueFormKey();
  Rx<bool> loading = false.obs;
  final dgAuthService = Get.find<DgAuthService>();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  @override
  void onReady() {
    super.onReady();
  emailCtr.text = userProvider.getEmail() ?? "";

  }

  @override
  void onClose() {
    super.onClose();

    userProvider.dispose();
    loading.close();
  }


  goBack() {
    Get.back();
  }


  onTapBtnNewusersign() {
    Get.toNamed(DgRoutes.addUsername);
  }

  void signIn() async {

    if(loginFormKey.currentState?.validate() == false){
      return;
    }
    loading(true);
    String? deviceInfo = await DgAuthService.getId(model:true);
    String? deviceId = await DgAuthService.getId();

      LogInModel logInModelObj = LogInModel(
          emailCtr.text.trim(), passwordCtr.text, deviceId!, '$deviceInfo');
      var result = await userProvider.login(logInModelObj);
      if(result) {

        Get.offAllNamed(DgRoutes.gameHomeScreen);
      }
      loading(false);




  }
}
