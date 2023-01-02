import 'dart:math';
import 'dart:ui';

import 'package:casual/widgets/full_page_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../app/utils/index.dart';
import '../../../widgets/index.dart';
import '../controller/leader_board_controller.dart';

class LeaderboardView extends GetView<LeaderBoardController> {
   LeaderboardView({Key? key}) : super(key: key);
  final LeaderBoardController controller = Get.put(LeaderBoardController());
   final RefreshController refreshController =
   RefreshController(initialRefresh: false);

   void onRefresh() async{
     // monitor network fetch
     controller.loaded(false);
     refreshController.refreshCompleted();
     controller.getLeaders();


   }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
        SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const MaterialClassicHeader(backgroundColor: Colors.black45,color: Colors.grey,),
        controller: refreshController,
        onRefresh: onRefresh,
        child:  Obx(() => DgFullScreenLoader(
          color: Colors.black,
            isloading: controller.loaded.value == false,
            child:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          const SizedBox(height: 100),
          // Figma Flutter Generator Group215Widget - COMPONENT
          Container(
              width: 330,
              height: 53,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top:20),
              decoration: const BoxDecoration(
                borderRadius : BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                gradient : LinearGradient(
                    begin: Alignment(6.123234262925839e-17,1),
                    end: Alignment(-1,6.123234262925839e-17),
                    colors: [Color.fromRGBO(23, 26, 58, 1),Color.fromRGBO(23, 27, 58, 1)]
                ),
              ),
              child: Obx(() => Row(children: [
                if (controller.userScore.value == 1)
                  SizedBox(
                      width: 34,
                      child: SvgPicture.asset('assets/svg/prize_1.svg',
                          alignment: Alignment.centerLeft)),
                if (controller.userScore.value == 2)
                  SizedBox(
                      width: 34,
                      child: SvgPicture.asset('assets/svg/prize_2.svg',
                          alignment: Alignment.centerLeft)),
                if (controller.userScore.value == 3)
                  SizedBox(width: 34, child: AppText.text("${controller.userScore.value}")),
                if (controller.userScore.value > 3 &&  controller.userScore.value <= 50)
                  SizedBox(width: 34, child: AppText.text("${controller.userScore.value}")),
                if (controller.userScore.value > 50)
                  SizedBox(width: 34, child: AppText.text("50+")),
                ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CommonImageView(url:"${controller.authService.getAuthProfile().getAvatar()}",
                        height: 37, width: 37, fit: BoxFit.cover)),
                const SizedBox(width: 10),
                Expanded(
                    child: Container(
                        height: 37,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText.text("${controller.authService.getAuthProfile().username}"),
                              AppText.text("${controller.authService.getAuthProfile().getPoint}",
                                  color: AppColors.blue)
                            ]
                        )))
              ]))
          ),
          SizedBox(
              width: 200,
              child: gradientContainer(context,
                  child: Center(
                      child: AppText.text('Leaderboard',
                          fontWeight: FontWeight.bold, fontSize: 16)))),
          const SizedBox(height: 20),
          users()
        ]))),
    )),
      SizedBox(
          child: ClipRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                  child:
                  Column(mainAxisSize: MainAxisSize.min, children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top)),
                    homeAppBar(context,),
                  ]))))
    ]
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
    return ListView.separated(
        padding: const EdgeInsets.only(bottom: 50),
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
                    child: CommonImageView(url:"https://www.diagon.io/images/avatars/${(controller.leaders[index].username?.toLowerCase() == controller.authService.getAuthProfile().username?.toLowerCase()) ?controller.authService.getAuthProfile().avatar :  controller.leaders[index].avatar ?? 1}.png",
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
                              AppText.text("${controller.leaders[index].username}"),
                              AppText.text('${controller.leaders[index].getPoint}',
                                  color: AppColors.blue)
                            ])))
              ]));
        });
  }
}
