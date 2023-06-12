import 'package:casual/app/providers/user_provider.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../app/models/transaction_model.dart';
import '../../../app/routes/routes.dart';
import '../../../app/services/auth_service.dart';


class WalletController extends GetxController  {

  final DgAuthService authService = Get.find<DgAuthService>();
  RxBool isLoading = false.obs;
  final UserProvider userProvider = UserProvider();
  RxList<TransactionModel> transactions = <TransactionModel>[].obs;
String country = "";

  @override
  void onReady() {
    super.onReady();
  country = authService.userData.read("userCountry") ?? "Nigeria";

  }



  final RefreshController refreshController =
  RefreshController(initialRefresh: false);

  void onRefresh() async{
    refreshController.refreshCompleted();
    await fetchBalance();
  }


Future<void> fetchBalance() async{
    isLoading(true);
   transactions(await userProvider.getTransactions());
    isLoading(false);
}


  @override
  void onInit() async{
    super.onInit();
  await fetchBalance();

  }


  @override
  void onClose() {
    super.onClose();

  }


}
