import 'package:casual/widgets/index.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';

import '../../../app/models/user.dart';
import '../../../app/providers/user_provider.dart';
import '../../../app/routes/routes.dart';
import '../../../app/services/auth_service.dart';

class EditProfileController extends GetxController {
  TextEditingController firstNameCtr = TextEditingController();
  TextEditingController lastNameCtr = TextEditingController();
  TextEditingController usernameCtr = TextEditingController();
  DgAuthService authService = Get.find<DgAuthService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final fNameField = GlobalKey<FormFieldState>();
  final lNameField = GlobalKey<FormFieldState>();
  final uNameField = GlobalKey<FormFieldState>();
  RxString selectedImage = "".obs;
  final UserProvider userProvider = UserProvider();
  UserModel? user;
  RxBool  loading = false.obs;


  @override
  void onReady() {
    super.onReady();

  }

  @override
  void onInit(){
  user =  authService.getAuthUser();
  selectedImage("${authService.userData.read("avatar") ?? 1}");
  firstNameCtr.text = "${user?.firstName}";
  lastNameCtr.text = "${user?.lastName}";
  usernameCtr.text = "${user?.username}";
  }

  @override
  void onClose() {
    super.onClose();
    firstNameCtr.dispose();
    lastNameCtr.dispose();
    usernameCtr.dispose();
  }


  void submitData() async{
      if(formKey.currentState?.validate() == false){
        return;
      }
      loading(true);
      var result = await userProvider.updateProfile({
        "first_name": firstNameCtr.text,
        "last_name":lastNameCtr.text,
        "avatar":selectedImage.value
      });
      loading(false);
      if(result){
        successSnack("Updated", "Profile Updated Successfully");
        userProvider.getProfile();
      }else{
        failedSnack("Failed!!!", "Unable to update profile");
      }
  }

  void selectAvatar() async {
    selectedImage.value = await Get.toNamed(DgRoutes.selectAvatarScreen, arguments: Get.currentRoute);
    user?.setAvatar(selectedImage.value);
  }
}
