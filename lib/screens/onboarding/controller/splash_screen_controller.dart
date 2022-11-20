import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';

import '../../../app/routes/routes.dart';
import '../../../app/services/auth_service.dart';


class SplashScreenController extends GetxController  {

  final DgAuthService authService = Get.find<DgAuthService>();

  Rx<double> titleOpacity = 0.0.obs;
  Rx<double> imageOpacity = 0.0.obs;
  Animation? curve;
  // TweenSequence animator = TweenSequence(
  //   <TweenSequenceItem<double>>[
  //     TweenSequenceItem(tween: Tween(begin: 0,end: 1), weight: 50)
  //   ]
  // );
  @override
  void onReady() {
    super.onReady();
    // _animationController = AnimationController(vsync: this)
    // curve = CurvedAnimation(parent: _animationController, curve: curve)
  }

  @override
  void onInit(){
    super.onInit();
    moveToNextPage();
  }


  @override
  void onClose() {
    super.onClose();

  }

  void moveToNextPage(){
    Future.delayed(const Duration(seconds: 3), ()
        {
       return authService.isAuthenticated()?  Get.toNamed(DgRoutes.gameHomeScreen) :  Get.toNamed(DgRoutes.startPage);
        });
  }
}
