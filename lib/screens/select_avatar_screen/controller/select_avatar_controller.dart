import 'package:get/get.dart';

class SelectAvatarController extends GetxController {
  // Rx<SelectAvatarModel> SelectAvatarModelObj = SelectAvatarModel().obs;
  List<String> selectAvatarItemList = List.generate(24, (index) =>"${index+1}");
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
