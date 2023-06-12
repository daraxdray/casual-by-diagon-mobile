
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:volume_controller/volume_controller.dart';
import '../../../app/providers/user_provider.dart';
import '../../../app/routes/routes.dart';
import '../../../app/services/auth_service.dart';
import '../../../widgets/snackbar.dart';

class ProfileSettingsController extends GetxController {
  // Rx<ProfileSettingsModel> profileSettingsModelObj = ProfileSettingsModel().obs;
  DgAuthService authService = DgAuthService();
  UserProvider userProvider = UserProvider();
  RxBool checkbox = false.obs;
  RxBool gameSoundStatus = false.obs;
  RxBool notificationStatus = false.obs;
  RxBool isLoading = false.obs;
  final RefreshController refreshController =
  RefreshController(initialRefresh: false);


  void onRefresh() async{
    isLoading(true);
    refreshController.refreshCompleted();
    Future.delayed(const Duration(milliseconds:900 ),() {
      isLoading(false);
    });}

  @override
  void onInit() {
    super.onInit();
    gameSoundStatus.value = authService.userData.read("gameSound") ?? true;
    notificationStatus.value = authService.userData.read("notification") ?? true;
  }


  @override
  void onReady() {
    super.onReady();
  }

  toggleNotification(){
    if(authService.userData.read("notification") == true){
      authService.userData.write("notification",false);
      successSnack("","Game notification off!");
      VolumeController().muteVolume(showSystemUI: true);
      notificationStatus(false);
    }else{
      successSnack("","Game notification on!");
      notificationStatus(true);


      VolumeController().maxVolume(showSystemUI: true);
      authService.userData.write("notification",true);
    }
  }
  toggleGameSound(){

    if(authService.userData.read("gameSound") == true ){
      authService.userData.write("gameSound",false);
      successSnack("","Game sound off!");
      gameSoundStatus(false);
    }else{
      successSnack("","Game sound on!");
      gameSoundStatus(true);
    authService.userData.write("gameSound",true);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }


  void logUserOut(){
    if(authService.logOut()){
      Get.offAllNamed(DgRoutes.logInScreen);
    };

  }
  

}
