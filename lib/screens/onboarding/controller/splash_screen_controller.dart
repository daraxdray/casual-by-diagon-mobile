import 'package:casual/app/utils/custom_exception.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../../app/providers/user_provider.dart';
import '../../../app/routes/routes.dart';
import '../../../app/services/auth_service.dart';
// import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';


class SplashScreenController extends GetxController  {

  final DgAuthService authService = Get.find<DgAuthService>();
  UserProvider userProvider = UserProvider();
  Rx<double> titleOpacity = 0.0.obs;
  Rx<double> imageOpacity = 0.0.obs;
  Animation? curve;
  bool _serviceEnabled = false;
  LocationPermission permission = LocationPermission.always;

  Future<void>  getUserLocation()async {
  _serviceEnabled = await Geolocator.isLocationServiceEnabled();
  permission = await Geolocator.checkPermission();
if(_serviceEnabled){
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      authService.userData.write("userCountry", "NotNigeria");
    }
    if (permission == LocationPermission.deniedForever) {
      authService.userData.write("userCountry", "NotNigeria");
    }
  }
  else {
    Position position = await Geolocator.getCurrentPosition();
    await placemarkFromCoordinates(
        position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      authService.userData.write("userCountry", place.country);
    }).catchError((e) {
      // debugPrint(e);
    });
  }
}
else{
  authService.userData.write("userCountry", "NotNigeria");
return;
}
}


  @override
  void onReady() async {
    super.onReady();
    //compare app version

  }




  @override
  void onInit()async{
    super.onInit();
    try {
      await getUserLocation();
      moveToNextPage();
    }catch(e){
      Get.toNamed(DgRoutes.noInternet,arguments: {"message":e.toString(),"route":Get.currentRoute,"routeProps":Get.arguments});
    }
  }


  @override
  void onClose() {
    super.onClose();

  }

  void moveToNextPage(){
    Future.delayed(const Duration(seconds: 0), ()
        {

          return authService.isAuthenticated()?  Get.offAllNamed(DgRoutes.gameHomeScreen) :  Get.toNamed(DgRoutes.startPage);
        });
  }
}
