import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../app/models/games.dart';
import '../../app/utils/index.dart';
import '../../widgets/index.dart';
import 'controller/game_rules_controller.dart';

class RulesView extends GetView<GameDetailsController> {
  const RulesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF000000),
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              SingleChildScrollView(
                  child: Column(children: [
                heroWidget(context),
                highScore(context),
                rules(context),
                startPlaying(context)
              ])),
              SizedBox(
                  child: ClipRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).padding.top)),
                            backBalanceProfileAppBar(
                                context, controller.userProvider),
                          ]))))
            ])));
  }

  Widget heroWidget(context) {
    return Container(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        // alignment: Alignment.bottomLeft,
        // decoration:  BoxDecoration(
        //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
        //     image: DecorationImage(
        //         image: NetworkImage("${Get.arguments["image"] != null?Get.arguments['image'] : controller.gameModel.value?.image }",),
        //         fit: BoxFit.fill)
        // ),
        child:  Stack(children: [
          ClipRRect(borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50) ),child: CommonImageView(
            url: "${Get.arguments != null ? Get.arguments['image'] : controller.gameModel.value?.image}",
          ),),
          Align(alignment: Alignment.bottomLeft,child: Padding(padding: EdgeInsets.all(20),child: SizedBox(
              height: 57,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CommonImageView(
                      url: "${Get.arguments != null ? Get.arguments['image'] : controller.gameModel.value?.image}",
                      height: 57,
                      width: 57,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        controller.componentsLoaded.value
                            ? AppText.text(
                            "${controller.gameModel.value?.title?.capitalize!}",

                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)
                            : Container(
                          margin: EdgeInsets.only(top:3),
                            height: 10,
                            width: 120,
                            child: ShimmerShape()),
                        controller.componentsLoaded.value
                            ? Row(children: [
                          AppText.text(controller.userProvider.dgAuthService.getAuthProfile().getRank().title.capitalize!),
                          const SizedBox(width: 20),
                          playerIcons(context,
                             controller.gameModel.value ?? GameModel())
                        ])
                            : Container(
                            margin: EdgeInsets.only(top:3, bottom: 3),
                            height: 10,
                            width: 120,
                            child: ShimmerShape()),
                        if (!controller.componentsLoaded.value)
                          SizedBox(
                              height: 10,
                              width: 120,
                              child: ShimmerShape()),
                      ]))
                ],
              )),))
        ]),);
  }

  Widget highScore(context) {
    return Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        decoration: BoxDecoration(
            color: const Color(0xFF171B3A),
            borderRadius: BorderRadius.circular(10)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          AppText.text('High Score', fontSize: 15, fontWeight: FontWeight.w600),
          Row(children: [
            SvgPicture.asset('assets/svg/cup_icon.svg'),
            const SizedBox(width: 5),
            AppText.text("${controller.getHighScore()} Points",
                color: const Color(0xFFFFA800), fontWeight: FontWeight.w600)
          ])
        ]));
  }

  Widget rules(context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.text('RULES:',
                fontWeight: FontWeight.w600, color: AppColors.muted),
            const SizedBox(height: 10),
            Obx(() => controller.componentsLoaded.value
                ? AppText.text("${controller.gameModel.value?.rules}",
                    color: AppColors.muted)
                : Column(children: [
                    SizedBox(
                        height: 10,
                        width: MediaQuery.of(context).size.width,
                        child: ShimmerShape()),
                    const SizedBox(
                      height: 20,
                      width: 120,
                    ),
                    SizedBox(
                        height: 10,
                        width: MediaQuery.of(context).size.width,
                        child: ShimmerShape()),
                    const SizedBox(
                      height: 20,
                      width: 120,
                    ),
                    SizedBox(
                        height: 10,
                        width: MediaQuery.of(context).size.width,
                        child: ShimmerShape()),
                    const SizedBox(
                      height: 20,
                      width: 120,
                    ),
                    SizedBox(
                        height: 10,
                        width: MediaQuery.of(context).size.width,
                        child: ShimmerShape()),
                    const SizedBox(
                      height: 20,
                      width: 120,
                    ),
                    SizedBox(
                        height: 10,
                        width: MediaQuery.of(context).size.width,
                        child: ShimmerShape()),
                  ]))
          ],
        ));
  }

  Widget startPlaying(context) {
    return Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 40, bottom: 40),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppButton.button(
                padding: const EdgeInsets.all(0),
                backgroundColor: Colors.transparent,
                child: Ink(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.1, 0.8],
                          colors: [Color(0xFF4C27E0), Color(0xFF5F03A7)]),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Container(
                        constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width,
                            minHeight: 55.0),
                        alignment: Alignment.center,
                        child: Text('Start Playing',
                            style: AppStyle.txtInterMedium15,))),
                onPressed: () => controller.gotoGame()))
        .animate()
        .slide(duration: 400.ms);
  }
}


