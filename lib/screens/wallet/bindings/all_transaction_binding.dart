import 'package:casual/screens/wallet/controller/all_transactions_controller.dart';
import 'package:get/get.dart';

class AllTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllTransactionsController());
  }
}
