import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../../../services/auth_service.dart';
import '../models/name_editing_model.dart';

class EditProfileController extends GetxController {
  TextEditingController firstNameCtr = TextEditingController();
  TextEditingController lastNameCtr = TextEditingController();

  TextEditingController usernameCtr = TextEditingController();

  Rx<SelectAvatarModel> SelectAvatarModelObj = SelectAvatarModel().obs;

  DgAuthService authService = Get.find<DgAuthService>();
  UserModel? user;


  @override
  void onReady() {
    super.onReady();

  }

  @override
  void onInit(){
  user =  authService.getAuthUser();
  firstNameCtr.text = "${user?.firstName}";
  lastNameCtr.text = "${user?.lastName}";
  usernameCtr.text = "${user?.email}";
  }

  @override
  void onClose() {
    super.onClose();
    firstNameCtr.dispose();
    lastNameCtr.dispose();
    usernameCtr.dispose();
  }
}
