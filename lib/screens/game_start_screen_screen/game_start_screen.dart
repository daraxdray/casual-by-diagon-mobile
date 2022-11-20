import 'dart:ui';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';
import '../../app/utils/index.dart';
import 'controller/game_start_screen_controller.dart';
import 'package:get/get.dart';
import '../../widgets/common_image_view.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class GameStartScreen extends GetWidget<GameStartScreenController> {
  const GameStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: AppDecoration.fillBlack90033.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder15,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 4,
                        top: 3,
                        bottom: 3,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          12.00,
                        ),
                        child: Obx(() => CommonImageView(
                              url: "${controller.gameModel.value?.image}",
                              height: 24.00,
                              width: 24.00,
                            )),
                      ),
                    ),
                    Obx(
                      () => Padding(
                          padding: const EdgeInsets.only(
                            left: 7,
                            top: 8,
                            right: 5,
                            bottom: 6,
                          ),
                          child: Text(
                            "${controller.gameModel.value?.title}",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterBold15.copyWith(),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ).animate().slide(
              delay: const Duration(milliseconds: 500),
              begin: const Offset(1, 0),
              end: const Offset(0, 0)),
          centerTitle: true,
          leading: CustomIconButton(
            height: 30,
            width: 30,
            onTap: () => Get.back(),
            padding: IconButtonPadding.PaddingAll0,
            child: const Icon(
              DgIcons.cancel_circle,
              color: Colors.white,
              size: 20,
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right:20,top: 10 ),
                width: 43,
                height: 33,
                child: Stack(
                  children: [
                     Positioned(
                        width: 33,
                        top: 0,
                        right: 0,
                        child: Image(
                            image: AssetImage("${controller.dgAuthService.getAvatar()}"),
                            height: 33,
                            width: 33)),
                    Positioned(
                        top: 9,
                        left: 0,
                        child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3,
                                  color: const Color(0xFF142261),
                                  strokeAlign: StrokeAlign.outside),
                              borderRadius: BorderRadius.circular(100),
                              gradient: const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Color(0xFFFF8383),
                                  Color(0xFFFF1A1A),
                                ],
                              ),
                            ),
                            child: const Center(
                                child: Text('9',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold)))))
                  ],
                ))
            // Container(
            //         margin:const EdgeInsets.only(left: 10, bottom: 15, right: 20),
            //         child: Row(
            //             crossAxisAlignment: CrossAxisAlignment.end,
            //             mainAxisSize: MainAxisSize.min,
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Container(
            //                   margin:
            //                   const EdgeInsets.only(top: 6, bottom: 3, right: 0),
            //                   padding: const EdgeInsets.only(
            //                       left: 5, top: 3, bottom: 3, right: 5),
            //                   decoration: AppDecoration.txtFillRedA400.copyWith(
            //                       borderRadius:
            //                           BorderRadiusStyle.txtRoundedBorder8),
            //                   child: Text("8".tr,
            //                       overflow: TextOverflow.ellipsis,
            //                       textAlign: TextAlign.left,
            //                       style: AppStyle.txtInterBold12
            //                           .copyWith(color: Colors.white))),
            //               Container(
            //                   height: 26.00,
            //                   width: 26.00,
            //                   margin: const EdgeInsets.only(left: 4),
            //                   child: Stack(
            //                       alignment: Alignment.centerLeft,
            //                       children: [
            //                         Align(
            //                             alignment: Alignment.center,
            //                             child: Padding(
            //                                 padding: const EdgeInsets.all(3),
            //                                 child: ClipRRect(
            //                                     borderRadius:
            //                                         BorderRadius.circular(
            //                                             10.10),
            //                                     child: CommonImageView(
            //                                         imagePath: controller
            //                                             .dgAuthService
            //                                             .getAuthProfile()
            //                                             .avatar,
            //                                         height: 20.00,
            //                                         width: 20.00)))),
            //                         Align(
            //                             alignment: Alignment.centerLeft,
            //                             child: SizedBox(
            //                                 height: 26.00,
            //                                 width: 26.00,
            //                                 child: CircularProgressIndicator(
            //                                   value: 0.5,
            //                                   strokeWidth: 4.00,
            //                                   color: AppColors.red300,
            //                                 )))
            //                       ]))
            //             ]))
            //     .animate()
            //     .slide(
            //         delay:const Duration(milliseconds: 500),
            //         begin: const Offset(1, 0),
            //         end:const Offset(0, 0)),
          ],
        ),
        body:  SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    20.00,
                  ),
                  child: CommonImageView(
                    fit: BoxFit.cover,
                    imagePath: "assets/img/red_lightning_bg.png",
                    height: MediaQuery.of(context).size.height,
                    width: 375.00,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: AppDecoration.gradientBlack90000Black902,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: 260.00,
                          width: 335.00,
                          margin: const EdgeInsets.only(
                            left: 20,
                            top: 130,
                            right: 20,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  right: 10,
                                ),
                                decoration: AppDecoration.gradientRed500Gray900
                                    .copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder15,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 44,
                                        top: 88,
                                        right: 44,
                                        bottom: 88,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          36.00,
                                        ),
                                        child: CommonImageView(
                                          imagePath: controller.dgAuthService.getAvatar(),
                                          height: 72.00,
                                          width: 72.00,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                                  .animate()
                                  .fadeIn(delay: Duration(milliseconds: 300))
                                  .slide(
                                      delay: const Duration(milliseconds: 500),
                                      begin: const Offset(-1, 0),
                                      end: const Offset(0, 0)),
                              // Align(
                              //   alignment: Alignment.centerRight,
                              //   child: Container(
                              //     width:
                              //       160.00,
                              //     ),
                              //     margin: EdgeInsets.only(
                              //       left: 10,
                              //     ),
                              //     decoration: AppDecoration
                              //         .gradientBlue400Deeppurple900
                              //         .copyWith(
                              //       borderRadius:
                              //       BorderRadiusStyle.circleBorder15,
                              //     ),
                              //     child: Column(
                              //       mainAxisSize: MainAxisSize.min,
                              //       crossAxisAlignment:
                              //       CrossAxisAlignment.center,
                              //       mainAxisAlignment:
                              //       MainAxisAlignment.center,
                              //       children: [
                              //         Padding(
                              //           padding: EdgeInsets.only(
                              //             left: 44,
                              //             top: 88,
                              //             right: 44,
                              //             bottom: 88,
                              //           ),
                              //           child: ClipRRect(
                              //             borderRadius: BorderRadius.circular(
                              //
                              //                 36.00,
                              //               ),
                              //             ),
                              //             child: CommonImageView(
                              //               imagePath:
                              //               ImageConstant.imgEllipse63,
                              //               height:
                              //                 72.00,
                              //               ),
                              //               width:
                              //                 72.00,
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // Align(
                              //   alignment: Alignment.topCenter,
                              //   child: Container(
                              //     margin: EdgeInsets.only(
                              //       left: 125,
                              //       top: 108,
                              //       right: 125,
                              //       bottom: 108,
                              //     ),
                              //     decoration:
                              //     AppDecoration.txtOutlineBlack9007f2,
                              //     child: Text(
                              //       "lbl_vs".tr,
                              //       overflow: TextOverflow.ellipsis,
                              //       textAlign: TextAlign.center,
                              //       style: AppStyle
                              //           .txtMonumentExtendedUltrabold30
                              //           .copyWith(),
                              //     ),
                              //   ),
                              // ),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 10,
                          right: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:const EdgeInsets.only(
                                top: 14,
                                bottom: 12,
                              ),
                              child: Text(
                                "${controller.dgAuthService.getAuthUser().username}".toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterSemiBold14.copyWith(),
                              ),
                            ),
                            Padding(
                                padding:const EdgeInsets.only(
                                  left: 4,
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(1.00),
                                    child: CommonImageView(
                                      imagePath: "assets/img/img_vector_gold.png",
                                      height: 41.00,
                                      width: 23.00,
                                    ))),
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //     left: 38,
                            //     top: 14,
                            //     bottom: 12,
                            //   ),
                            //   child: Text(
                            //     "lbl_yung_john".tr,
                            //     overflow: TextOverflow.ellipsis,
                            //     textAlign: TextAlign.left,
                            //     style: AppStyle.txtInterSemiBold14
                            //         .copyWith(),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.only(
                          left: 20,
                          top: 87,
                          right: 20,
                        ),
                        child: Text(
                          "lbl_starts_in".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterMedium20.copyWith(),
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding:const EdgeInsets.only(
                            left: 20,
                            top: 8,
                            right: 20,
                            bottom: 114,
                          ),
                          child: Text(
                            "${controller.countdown.value}s",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterSemiBold35.copyWith(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
