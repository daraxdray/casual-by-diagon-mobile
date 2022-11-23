import 'dart:math';

import 'package:casual/widgets/full_page_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../app/utils/index.dart';
import '../../../widgets/index.dart';
import '../controller/leader_board_controller.dart';

class LeaderboardView extends GetView<LeaderBoardController> {
   LeaderboardView({Key? key}) : super(key: key);
  final LeaderBoardController controller = Get.put(LeaderBoardController());

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          const SizedBox(height: 100),
          SizedBox(
              width: 200,
              child: gradientContainer(context,
                  child: Center(
                      child: AppText.text('Leaderboard',
                          fontWeight: FontWeight.bold, fontSize: 16)))),
          const SizedBox(height: 20),
          Obx(() => FullScreenLoader(isloading: controller.loaded.value == false, child: users()))
        ]),
    );
  }

  Widget gradientContainer(context, {required Widget child}) {
    return Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF0A4E74),
                  const Color(0xFF9F00D7).withOpacity(0.2),
                ])),
        child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF020412),
                      Color(0xFF171B3A),
                    ])),
            child: child));
  }

  Widget users() {
    var rng = Random();
    var code = rng.nextInt(900000) + 100000;
    return ListView.separated(
        padding: const EdgeInsets.only(bottom: 100),
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: controller.leaders.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                if (index == 0)
                  SizedBox(
                      width: 34,
                      child: SvgPicture.asset('assets/svg/prize_1.svg',
                          alignment: Alignment.centerLeft)),
                if (index == 1)
                  SizedBox(
                      width: 34,
                      child: SvgPicture.asset('assets/svg/prize_2.svg',
                          alignment: Alignment.centerLeft)),
                if (index == 2)
                  SizedBox(
                      width: 34,
                      child: SvgPicture.asset('assets/svg/prize_3.svg',
                          alignment: Alignment.centerLeft)),
                if (index > 2)
                  SizedBox(width: 34, child: AppText.text('${index + 1}.')),
                ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/img/user_profile.png',
                        height: 37, width: 37, fit: BoxFit.cover)),
                const SizedBox(width: 10),
                Expanded(
                    child: Container(
                        height: 37,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.bluegray800Cc),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText.text("${controller.leaders[index].firstName}"),
                              AppText.text('${controller.leaders[index].getPoint}',
                                  color: AppColors.blue)
                            ])))
              ]));
        });
  }
}
