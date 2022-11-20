import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import '../../../../app/providers/user_provider.dart';
import '../../../../app/routes/routes.dart';

import 'package:flutter/material.dart';

import '../../../../app/services/auth_service.dart';
import '../../../../widgets/snackbar.dart';


class AddUsernameController extends GetxController {
  TextEditingController userNameCtr = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
    userNameCtr.dispose();
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
      if(selectedImage.value == ""){
        failedSnack("Avatar", "Please select an avatar");
        loading(false);
        return;
      }
       var result = await _userProvider.checkNameAvailability(userNameCtr.text);
        loading(false);
        if(result != null && result['taken'] == false){
          _dgAuthService.userData.write("avatar",selectedImage.value);
          // Get.toNamed(DgRoutes.signUpScreen, arguments: {"firstName": Get.arguments['firstName'], "lastName":Get.arguments['lastName'],"userName":userNameCtr.text,});
          Get.toNamed(DgRoutes.createProfile, arguments: {"userName":userNameCtr.text,"avatar":selectedImage.value});
          return;
        }else {
          failedSnack("Invalid", "The name is not available");
        }
      }
  }

