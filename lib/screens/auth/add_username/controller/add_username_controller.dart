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
  final UserProvider _userProvider = UserProvider();
RxInt activeImage = 0.obs;
RxString selectedImage = "".obs;
bool isUpdate = false;
  Rx<bool> loading = false.obs;
  RxInt avatarCounter = 0.obs;

final DgAuthService _dgAuthService = DgAuthService();
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    isUpdate = Get.arguments == "update";
    if(Get.parameters['referrer'] != null){
      _dgAuthService.userData.write("referrer",Get.parameters['referrer']);
    }
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
       var result = await _userProvider.checkNameAvailability(userNameCtr.text.trim());
        loading(false);
        if(result != null && result == false){
          _dgAuthService.userData.write("avatar",selectedImage.value);
          Get.toNamed(DgRoutes.createProfile, arguments: {"userName":userNameCtr.text.replaceAll(" ","").trim(),"avatar":selectedImage.value});
          return;
        }else {
            failedSnack("Invalid", "The name has already been used");
        }
      }
  updateUsername() async {
    if(formKey.currentState?.validate() == false){
        return;
    }
    loading(true);
      if(selectedImage.value == ""){
        failedSnack("Avatar", "Please select an avatar");
        loading(false);
        return;
      }

       var result = await _userProvider.checkNameAvailability(userNameCtr.text.trim());
        if(result != null && result == false){
          _dgAuthService.userData.write("avatar",selectedImage.value);
          var result = await _userProvider.updateProfile({
            "username":userNameCtr.text.trim(),
            "first_name": "${_dgAuthService.getAuthUser().firstName ?? _dgAuthService.getAuthProfile().firstName}".trim(),
            "last_name":"${_dgAuthService.getAuthUser().lastName ?? _dgAuthService.getAuthProfile().lastName}".trim(),
            "avatar":selectedImage.value
          });
          loading(false);
          if(result){
            successSnack("Updated", "Profile Updated Successfully");
            Get.offAllNamed(DgRoutes.gameHomeScreen);
          }else{
            failedSnack("Failed!!!", "Unable to update profile");
          }
          return;
        }else {
          failedSnack("Invalid", "The name has already been used.");
        }
    loading(false);
      }
  }

