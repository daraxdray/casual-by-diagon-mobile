import 'package:flutter/animation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../app/services/auth_service.dart';
import '../../../app/utils/global_key_factory.dart';

class ActiveGamePlayController extends GetxController {

  // final GlobalKey webViewKey = GlobalKeyFactory.generateUniqueKey();

  Rx<InAppWebViewController>? webViewController;
  InAppWebViewOptions settings = InAppWebViewOptions(
    useShouldOverrideUrlLoading: true,
    mediaPlaybackRequiresUserGesture: false,
    allowFileAccessFromFileURLs: true,
    // frame: "camera; microphone",
    // iframeAllowFullscreen: true
  );
  String url = Get.arguments['url'];
  Rx<double> progress = 0.0.obs;
  Rx<bool> gameIsPlaying  = false.obs;
  RxDouble currentMargin = 0.0.obs;
  RxBool gameStoped = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onClose() {
    super.onClose();
  }


}
