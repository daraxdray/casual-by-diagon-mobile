import 'package:casual/widgets/index.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';

import '../../../app/models/user.dart';
import '../../../app/providers/user_provider.dart';
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
        "firstName": firstNameCtr.text,
        "lastName":lastNameCtr.text,
        "username": usernameCtr.text
      });
      loading(false);
      if(result){
        successSnack("Updated", "Profile Updated Successfully");
      }else{
        failedSnack("Failed!!!", "Unable to update profile");
      }
  }
}
