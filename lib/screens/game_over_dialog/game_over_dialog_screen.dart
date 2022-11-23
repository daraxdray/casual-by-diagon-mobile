import 'dart:ui';
import 'package:get/get.dart';
import '../../app/utils/app_decoration.dart';
import '../../app/utils/colors.dart';
import '../../app/utils/styles.dart';
import 'controller/game_over_controller.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class GamePlayScreenGameOverDialog
    extends GetWidget<GamePlayScreenGameOverController> {
  GamePlayScreenGameOverDialog({Key? key}) : super(key: key);

  @override
  final GamePlayScreenGameOverController controller =
      Get.put(GamePlayScreenGameOverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/game_over.png'),
                        fit: BoxFit.cover)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 10, sigmaX: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          left: 50,
                          top: 60,
                          right: 50,
                        ),
                        decoration: AppDecoration.gradientWhiteA700Lightgreen401
                            .copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder25,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 12,
                                top: 37,
                                right: 12,
                              ),
                              child: Text(
                                "GAME RESULT",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterBold26.copyWith(),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 12,
                                top: 43,
                                right: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 1,
                                      bottom: 1,
                                    ),
                                    child: Text(
                                      "Level Score",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterSemiBold15Gray904
                                          .copyWith(fontSize: 20),
                                    ),
                                  ),
                                  Text(
                                    "${controller.getGameResult.params?.levelScore ?? controller.getGameResult.params?.totalScore ?? '0'}",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterSemiBold18
                                        .copyWith(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 1.00,
                              width: 232.00,
                              margin: EdgeInsets.only(
                                left: 12,
                                top: 16,
                                right: 12,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.bluegray9004c,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 12,
                                top: 16,
                                right: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 3,
                                    ),
                                    child: Text(
                                      "lbl_time".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterSemiBold15Gray904
                                          .copyWith(fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 1,
                                    ),
                                    child: Text(
                                      "${controller.getGameResult.gameTime}s",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterSemiBold18
                                          .copyWith(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 1.00,
                              width: 232.00,
                              margin: EdgeInsets.only(
                                left: 12,
                                top: 13,
                                right: 12,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.bluegray9004c,
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //     left: 12,
                            //     top: 16,
                            //     right: 12,
                            //   ),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     mainAxisSize: MainAxisSize.max,,
                            //     children: [
                            //       Padding(
                            //         padding: EdgeInsets.only(
                            //           bottom: 3,
                            //         ),
                            //         child: Text(
                            //           "lbl_best_time".tr,
                            //           overflow: TextOverflow.ellipsis,
                            //           textAlign: TextAlign.left,
                            //           style:
                            //           AppStyle.txtInterSemiBold15Gray904.copyWith(fontSize: 20),
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.only(
                            //           top: 1,
                            //         ),
                            //         child: Text(
                            //           "lbl_0_53".tr,
                            //           overflow: TextOverflow.ellipsis,
                            //           textAlign: TextAlign.left,
                            //           style: AppStyle.txtInterSemiBold18.copyWith(fontSize: 20),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                left: 12,
                                top: 55,
                                right: 12,
                                bottom: 12,
                              ),
                              decoration: AppDecoration.fillGray904.copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder15,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      top: 20,
                                      right: 20,
                                    ),
                                    child: Text(
                                      "lbl_total_score".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtInterMedium14.copyWith(),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      top: 4,
                                      right: 20,
                                      bottom: 20,
                                    ),
                                    child: Text(
                                      "${controller.getGameResult.accumulated}",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterBold45WhiteA700
                                          .copyWith(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => controller.goToGame(),
                        child: Container(
                            height: 58.00,
                            width: 156.00,
                            margin: EdgeInsets.only(
                              left: 50,
                              top: 47,
                              right: 50,
                              bottom: 20,
                            ),
                            // decoration: AppDecoration.gradientAmberA400GreenA701,
                            child: TweenAnimationBuilder(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 43,
                                    top: 20,
                                    right: 43,
                                    bottom: 20,
                                  ),
                                  child: Text(
                                    "lbl_continue".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtInterRegular15.copyWith(),
                                  ),
                                ),
                              ),
                              tween: Tween<double>(begin: 0, end: 200),
                              duration: const Duration(seconds: 5),
                              builder: (
                                BuildContext context,
                                double value,
                                child,
                              ) {
                                return Card(
                                  clipBehavior: Clip.antiAlias,
                                  color: Colors.green,
                                  elevation: 0,
                                  margin: const EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      29.00,
                                    ),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          height: 58.00,
                                          width: 103.00,
                                          margin: EdgeInsets.only(
                                            right: value,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.black9007f2,
                                            gradient: const LinearGradient(
                                              colors:
                                                  AppColors.gradientOrangeGreen,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                50.00,
                                              ),
                                              bottomLeft: Radius.circular(
                                                50.00,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      child ?? const SizedBox()
                                    ],
                                  ),
                                );
                              },
                            )),
                      )
                    ],
                  ),
                ))));
  }
}
