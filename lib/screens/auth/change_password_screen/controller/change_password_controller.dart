import 'dart:async';
import 'package:casual/app/utils/global_key_factory.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/providers/user_provider.dart';
import '../../../../app/routes/routes.dart';
import '../../../../app/services/auth_service.dart';
import '../../../../widgets/snackbar.dart';
import '../models/verify_email_model.dart';

class ChangePasswordController extends GetxController{
  TextEditingController codeCtr = TextEditingController();
  final UserProvider userProvider = UserProvider();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController confirmPasswordCtr = TextEditingController();
  final GlobalKey<FormFieldState> pwField = GlobalKeyFactory.generateUniqueFormFieldKey();
  final GlobalKey<FormFieldState> cfPwField = GlobalKeyFactory.generateUniqueFormFieldKey();
  final GlobalKey<FormFieldState> codeCtrField = GlobalKeyFactory.generateUniqueFormFieldKey();
  RxBool newPassVisible = false.obs;
  RxBool confirmPassVisible = false.obs;
  Rx<bool> loading = false.obs;
  String? userId = "";
  String? email = "";
  final GlobalKey<FormState> formKey = GlobalKeyFactory.generateUniqueFormKey();
  Rx<int> countdown = 50.obs;
  Timer? _timer;
  DgAuthService authService = DgAuthService();


  @override
  void onReady() {
    super.onReady();
    userId =  Get.arguments != null? Get.arguments["user_id"]: "";
    email = Get.arguments != null? Get.arguments["email"]: "";
  }

  @override
  void onClose() {
    super.onClose();
    codeCtr.dispose();
    userProvider.dispose();
    loading.close();
  }



  goBack() {
    Get.back();
  }

  onTapBtnLogin() {
    Get.toNamed(DgRoutes.logInScreen);
  }


  void changePassword() async {
    if(formKey.currentState?.validate() == false){
      return;
    }
    loading(true);
    try{

      Map<String,dynamic>? result = await userProvider.changePassword(codeCtr.text,passwordCtr.text,confirmPasswordCtr.text,userId);
      loading(false);
      if(result != null) {
        Get.offAllNamed(DgRoutes.logInScreen,);
          authService.userData.remove("fuserId");
        successSnack("Successful","Your password has been changed",);
      }}
    catch(e){
      loading(false);
      // debugPrint(e.toString());
      Get.snackbar("Error","Unable to process",colorText: Colors.white);
    }



  }

  void logUserOut(){
    if(authService.logOut()){
      Get.offAllNamed(DgRoutes.logInScreen);
    };

  }


  @override
  void onInit() {
    timerCountDown();
    super.onInit();
  }


  timerCountDown(){
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if(countdown.value == 0) {
        _timer?.cancel();
      }else{
        countdown.value --;
      }
    });
  }
}
