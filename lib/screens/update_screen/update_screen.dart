import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/routes/routes.dart';
import '../../app/services/auth_service.dart';
import '../../widgets/full_page_loader.dart';
import '../../widgets/index.dart';
import '../../app/utils/index.dart';
import 'controller/update_controller.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends GetWidget<UpdateController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: authAppBar("Update"),
          body: Obx(() => DgFullScreenLoader(
              isloading: controller.isLoading.value,
              child:SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width:322.00,

                          margin: const EdgeInsets.only(
                            left: 24,
                            top: 50,
                            right: 24,
                          ),
                          child: Text(
                            "msg_get_the_latest".tr,
                            maxLines: null,
                            textAlign: TextAlign.center,
                            style: AppStyle.txtInterBold29.copyWith(),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width:   314.00,

                          margin: const EdgeInsets.only(
                            left: 24,
                            top: 19,
                            right: 24,
                          ),
                          child: Text(
                            "msg_to_ensure_maxim".tr,
                            maxLines: null,
                            textAlign: TextAlign.center,
                            style: AppStyle.txtInterRegular14.copyWith(),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 24,
                            top: 90,
                            right: 24,
                          ),
                          child: CommonImageView(
                            svgPath: "assets/svg/notify.svg",
                            height:160.00,
                            width:   188.00,
                          ),
                        ),
                      ),
                      const SizedBox(height:50),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          // margin: const EdgeInsets.only(top: 40, bottom: 40),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: AppButton.button(
                            padding: const EdgeInsets.all(0),
                            backgroundColor: Colors.transparent,
                            child: Ink(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFFF0101),
                                        Color(0xFFFF6363)
                                      ]),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                                ),
                                child: Container(
                                    constraints: BoxConstraints(
                                        minWidth:
                                        MediaQuery.of(context).size.width,
                                        minHeight: 55.0),
                                    alignment: Alignment.center,
                                    child: AppText.text('Next',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600))),
                            onPressed: () async => await DgAuthService.launchURL(controller.downloadLink.value,launchMode: LaunchMode.externalApplication),
                          ))
                    ],
                  )
              ))))
    );
}}
