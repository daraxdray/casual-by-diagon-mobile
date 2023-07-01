import 'package:casual/app/routes/routes.dart';
import 'package:casual/app/utils/global_key_factory.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../app/models/referrer_model.dart';
import '../../../app/models/user.dart';
import '../../../app/providers/user_provider.dart';
import '../../../app/services/auth_service.dart';
import '../../../widgets/snackbar.dart';

class UserReferralController extends GetxController {
RxBool  loading = true.obs;
DgAuthService dgAuthService = DgAuthService();
  final RefreshController refreshController =
  RefreshController(initialRefresh: false);
  final UserProvider userProvider = UserProvider();
  final TextEditingController referrerCodeCtr = TextEditingController();
  final GlobalKey<FormState> referrerCode = GlobalKeyFactory.generateUniqueFormKey();
  RxInt totalReferred = 0.obs;

  void onRefresh() async{
    loading(true);
      refreshController.refreshCompleted();
    totalReferred(await userProvider.getUserReferrersCount());
    Future.delayed(const Duration(milliseconds:900 ),() {
      loading(false);
    });
  }


  @override
  void onInit() async {
    referrerCodeCtr.text = dgAuthService.getAuthProfile().referrer ?? '';
    totalReferred(await userProvider.getUserReferrersCount());
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

    if(referrerCodeCtr.text == dgAuthService.getAuthProfile().username){
      warningSnack("Invalid Referrer", "You cannot refer yourself, please enter another referrer code");
      return;
    }
    loading(true);
    var result = await userProvider.addReferrer({
      "referrer_username": referrerCodeCtr.text,
      "user_id":"${dgAuthService.getAuthUser().id}"
    });
    loading(false);
    if(result){
      Get.back();
      successSnack("Updated", "Referrer has been set");
    }else{
    }
  }


}
