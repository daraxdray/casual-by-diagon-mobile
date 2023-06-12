import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/providers/user_provider.dart';
import '../../../../app/routes/routes.dart';
import '../../../../app/services/auth_service.dart';
import '../../../../widgets/snackbar.dart';
import '../models/sign_up_two_model.dart';

class SignUpTwoController extends GetxController {
  TextEditingController emailCtr = TextEditingController();
  TextEditingController refferedCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailField = GlobalKey<FormFieldState>();
  final refferedField = GlobalKey<FormFieldState>();
  final pwField = GlobalKey<FormFieldState>();
  RxBool passVisible = false.obs;
  Rx<bool> loading = false.obs;
  final DgAuthService dgAuthService = DgAuthService();
  UserProvider userProvider = UserProvider();

  @override
  void onReady() {
    super.onReady();

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(dgAuthService.userData.read("referrer") != null){
      refferedCtr.text = dgAuthService.userData.read("referrer");
    }
  }

  @override
  void onClose() {
    super.onClose();
    // emailCtr.dispose();
    // passwordCtr.dispose();

  }

  void goBack(){
    Get.back();
  }

  void signUp() async {
    if(formKey.currentState?.validate() == false){
      return;
    }
    loading(true);
    String? deviceInfo = await DgAuthService.getId(model:true);
    String? deviceId = await DgAuthService.getId();
    SignUpModel signUpModelObj = SignUpModel(Get.arguments['firstName'],
          Get.arguments['lastName'], Get.arguments['userName'],
          emailCtr.text.trim(), passwordCtr.text, refferedCtr.text.trim(),
        int.parse(dgAuthService.userData.read("avatar")), deviceId!, '$deviceInfo');
          var result = await userProvider.signup(signUpModelObj);
    loading(false);
    if(result){
      successSnack("Success","Your account has been created successfully, please login",duration: 4);
      Get.offAllNamed(DgRoutes.logInScreen,);
    }

  }
}
