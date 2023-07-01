import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import '../../../../app/providers/user_provider.dart';
import '../../../../app/routes/routes.dart';

import 'package:flutter/material.dart';

import '../../../../app/services/auth_service.dart';
import '../../../../app/utils/global_key_factory.dart';
import '../../../../widgets/snackbar.dart';


class ForgotPasswordController extends GetxController {
  TextEditingController emailCtr = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKeyFactory.generateUniqueFormKey();
  UserProvider _userProvider = UserProvider();
RxInt activeImage = 0.obs;
RxString selectedImage = "".obs;
  Rx<bool> loading = false.obs;
  RxInt avatarCounter = 0.obs;

final DgAuthService _dgAuthService = DgAuthService();
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailCtr.dispose();
  }

  onTapBtntf() {
    Get.back();
  }

  selectAvatar() async {
    selectedImage.value = await Get.toNamed(DgRoutes.selectAvatarScreen, arguments: Get.currentRoute);
}

  onTapBtnNext() async {
    if(formKey.currentState?.validate() == false){
        return;
    }
    loading(true);
       var result = await _userProvider.sendResetLink(emailCtr.text.trim());
        loading(false);
        _dgAuthService.userData.write("forgot_user_id", result['user_id']);
        if(result != null ){
          _dgAuthService.userData.write("fuserId",result["user_id"]);
          _dgAuthService.userData.write("femail",emailCtr.text.trim());
          Get.toNamed(DgRoutes.changePassword, arguments: {"email":emailCtr.text.trim(),"user_id":result["user_id"]});
          return;
        }
      }
  }

