import 'package:casual/app/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../app/models/user.dart';
import '../../../app/providers/user_provider.dart';
import '../../../app/services/auth_service.dart';
import '../../../widgets/snackbar.dart';

class UserReferralController extends GetxController {
  DgAuthService dgAuthService = DgAuthService();
RxBool  loading = true.obs;
  final RefreshController refreshController =
  RefreshController(initialRefresh: false);
  final DgAuthService authService = DgAuthService();
  final UserProvider userProvider = UserProvider();
  final TextEditingController referrerCodeCtr = TextEditingController();
  final GlobalKey<FormState> referrerCode = GlobalKey<FormState>();
  void onRefresh() async{
    loading(true);
      refreshController.refreshCompleted();
    Future.delayed(const Duration(milliseconds:900 ),() {
      loading(false);
    });
  }


  @override
  void onInit() async {
    referrerCodeCtr.text = "${authService.getAuthProfile().referrer}";
    loading(false);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }


  void submitData() async{
    if(referrerCode.currentState?.validate() == false){
      return;
    }
    loading(true);
    var result = await userProvider.addReferrer({
      "referrer_username": referrerCodeCtr.text,
      "user_id":"${authService.getAuthUser().id}"
    });
    loading(false);
    if(result){
      successSnack("Updated", "Referrer has been set");
      Get.back();
    }else{
    }
  }


}
