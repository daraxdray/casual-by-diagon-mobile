import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../app/models/user.dart';
import '../../../app/providers/user_provider.dart';
import '../../../app/services/auth_service.dart';

class UserProfileController extends GetxController {
  TextEditingController groupFiftyTwoController = TextEditingController();
  TextEditingController groupFiftyThreeController = TextEditingController();
  TextEditingController groupFortyEightController = TextEditingController();
  Rx<UserModel> userProfileModel = UserModel().obs;
  final UserProvider userProvider = UserProvider();
RxBool  loading = true.obs;
  final RefreshController refreshController =
  RefreshController(initialRefresh: false);

  void onRefresh() async{
    loading(true);
    userProfileModel(await userProvider.getProfile());
    loading(false);
    refreshController.refreshCompleted();
  }


  @override
  void onInit() async {
    try {
      userProfileModel(await userProvider.getProfile());
      loading(false);
    }catch(e){
      loading(false);
    }
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    groupFiftyTwoController.dispose();
    groupFiftyThreeController.dispose();
    groupFortyEightController.dispose();
  }
}
