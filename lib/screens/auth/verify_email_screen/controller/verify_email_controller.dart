import 'dart:async';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/providers/user_provider.dart';
import '../../../../app/routes/routes.dart';
import '../../../../widgets/snackbar.dart';
import '../models/verify_email_model.dart';

class VerifyEmailController extends GetxController{
  TextEditingController codeCtr = TextEditingController();
  final UserProvider userProvider = UserProvider();
  Rx<bool> loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<int> countdown = 20.obs;
  Timer? _timer;


  @override
  void onReady() {
    super.onReady();
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

  void sendCodeToEmail() async {
    countdown(20);
    timerCountDown();
     var sent = await  userProvider.sendEmailCode();
    if(sent != null ){
      successSnack("Succcessful","Code has been sent to your email");
    }}


  void verifyEmail() async {
    if(formKey.currentState?.validate() == false){
      return;
    }
    loading(true);
      bool result = await userProvider.verifyEmail(codeCtr.text,);
      loading(false);
      if(result) {
        Get.toNamed(DgRoutes.gameHomeScreen, arguments: {"email":codeCtr.text});
        successSnack("Successful","Your email has been verified",);
      } else {
        failedSnack("Error","Could not complete verification",);
    }
    // catch(e){
    //   loading(false);
    //   debugPrint(e.toString());
    //   Get.snackbar("Error","Unable to process",colorText: DgColors.whiteA700);
    // }



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
