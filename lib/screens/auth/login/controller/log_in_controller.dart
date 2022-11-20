import 'package:casual/app/services/auth_service.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/providers/user_provider.dart';
import '../../../../app/routes/routes.dart';
import '../../../../widgets/snackbar.dart';
import '../models/log_in_model.dart';

class LogInController extends GetxController{
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  final emailField = GlobalKey<FormFieldState>();
  final pwField = GlobalKey<FormFieldState>();
  final UserProvider userProvider = UserProvider();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  Rx<bool> loading = false.obs;

  @override
  void onReady() {
    super.onReady();
  emailCtr.text = userProvider.getEmail() ?? "";
  }

  @override
  void onClose() {
    super.onClose();
    emailCtr.dispose();
    passwordCtr.dispose();
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
      LogInModel logInModelObj = LogInModel(
          emailCtr.text,
          passwordCtr.text);
      var result = await userProvider.login(logInModelObj);
      if(result) {
        Get.offAllNamed(DgRoutes.gameHomeScreen);
      }
      loading(false);




  }
}
