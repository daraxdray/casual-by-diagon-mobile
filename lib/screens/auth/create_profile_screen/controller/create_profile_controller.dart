import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../app/routes/routes.dart';
import '../../../../app/services/auth_service.dart';
import '../../../../app/utils/global_key_factory.dart';
import '../models/create_profile_model.dart';

class CreateProfileController extends GetxController {
  TextEditingController firstNameCtr = TextEditingController();
  TextEditingController lastNameCtr = TextEditingController();

  Rx<CreateProfileModel> createProfileModelObj = CreateProfileModel().obs;
  final GlobalKey<FormState> formKey = GlobalKeyFactory.generateUniqueFormKey();
  final GlobalKey<FormFieldState> fNameField = GlobalKeyFactory.generateUniqueFormFieldKey();
  final GlobalKey<FormFieldState> lNameField = GlobalKeyFactory.generateUniqueFormFieldKey();

  final DgAuthService dgAuthService = DgAuthService();
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onClose() {
    super.onClose();
    firstNameCtr.dispose();
    lastNameCtr.dispose();
  }

  onTapBtntf() {
    Get.back();
  }

  onTapBtnNext() {
    if(fNameField.currentState?.validate() == false || lNameField.currentState?.validate() == false){
        return;
    }
    Get.toNamed(DgRoutes.signUpScreen, arguments: {"firstName":firstNameCtr.text.trim(),"lastName":lastNameCtr.text.trim(),"userName":Get.arguments["userName"], "avatar":Get.arguments['avatar']});
  }
}
