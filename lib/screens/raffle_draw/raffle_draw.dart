import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../app/utils/index.dart';
import '../../../widgets/index.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../app/providers/user_provider.dart';
import '../../widgets/full_page_loader.dart';
import 'controller/raffle_draw_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class RaffleDrawView extends GetView<RaffleDrawController> {
   RaffleDrawView({Key? key}) : super(key: key);

   @override
  RaffleDrawController controller = Get.put<RaffleDrawController>(RaffleDrawController());

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
        Container(
              height: MediaQuery.of(context).size.height,
              child: Obx(() => SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: false,
                  header: const MaterialClassicHeader(backgroundColor: Colors.black45,color: Colors.grey,),
                  controller: controller.refreshController,
                  onRefresh: controller.onRefresh,
                  child:  DgFullScreenLoader(
                      isloading: controller.loading.value,
                      color: Colors.black,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 100),
                        child:
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).padding.top + 100, left: 20),
                              child: AppText.text("Raffle Draws",
                                  style: AppStyle.txtInterBold25)),
                          Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                bottom: 20,
                              ),
                              child: AppText.text('Earn massive cash rewards!!!',
                                  color: Colors.white)),
                          const SizedBox(height: 10),
                          weeklyDraw(context),
                          const SizedBox(height: 25),
                          luckyDraw(context),
                          const SizedBox(height: 25),
                          controller.loading.value == false?   TopGamesView(gameList: controller.topGameList,) : TopGamesView(gameList: [],),
                        ]),
                        // Expanded(child: weeklyDraw(context))
                      ))))),
          SizedBox(
              child: ClipRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).padding.top)),
                        homeAppBar(context),
                      ])))),
        ],
      );
  }

  Widget weeklyDraw(context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        // height: MediaQuery.of(context).size.width * 0.6,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: AssetImage('assets/img/rf-1.png'), fit: BoxFit.cover)),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        AppText.text('WEEKLY DRAW',
                            fontSize: 10, fontWeight: FontWeight.bold),
                        AppText.text('LOTTERY\nPOOL',
                            fontWeight: FontWeight.w900, fontSize: 17),
                      ]),
                  Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(children: [
                        SvgPicture.asset('assets/svg/time.svg'),
                        const SizedBox(width: 4),
                        CountdownTimer(
                          endTime: controller.endTime,
                          widgetBuilder: (_, CurrentRemainingTime? time) {
                            if (time == null) {
                              return AppText.text("LIVE");
                            }
                            return AppText.text("${time.days?? 0} Day(s) ${time.hours ?? 0} Hour(s) ${time.min ?? 0} Minute(s)", fontSize: 12);
                          },
                        ),
                        const SizedBox(width: 4)
                      ]))
                ]),
            const SizedBox(height: 10),
            SvgPicture.asset('assets/svg/rf_win_cash.svg'),
            const SizedBox(height: 20),
            AppText.text('Collect at least 10,000 tickets to enter the draw'),
            const SizedBox(height: 8),
            AppButton.button(
                minimumSize: const Size(double.maxFinite, 49),
                backgroundColor: const Color(0xFFDE419F),
                child: AppText.text('Join Raffle Draw',fontWeight: FontWeight.bold),
                onPressed: () {})
          ],
        ));
  }

  Widget luckyDraw(context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        // height: MediaQuery.of(context).size.width * 0.6,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: AssetImage('assets/img/rf-2.png'), fit: BoxFit.cover)),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        AppText.text('LUCKY\nDRAW',
                            fontSize: 10, fontWeight: FontWeight.bold),
                        // AppText.text('LOTTERY\nPOOL',
                        //     fontWeight: FontWeight.w900, fontSize: 17),
                      ]),
                  Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(children: [
                        SvgPicture.asset('assets/svg/time.svg'),
                        const SizedBox(width: 4),
                        CountdownTimer(
                          endTime: controller.endTime - 30000,
                          widgetBuilder: (_, CurrentRemainingTime? time) {
                            if (time == null) {
                              return AppText.text("LIVE");
                            }
                            return AppText.text("${time.days?? 0} Day(s) ${time.hours ?? 0} Hour(s) ${time.min ?? 0} Minute(s)", fontSize: 12);
                          },
                        ),
                        const SizedBox(width: 4)
                      ]))
                ]),
            const SizedBox(height: 20),
            SvgPicture.asset('assets/svg/rf_win_ticket.svg'),
            const SizedBox(height: 20),
            AppText.text('Collect at least 5,000 tickets to enter the draw'),
            const SizedBox(height: 8),
            AppButton.button(
                minimumSize: const Size(double.maxFinite, 49),
                backgroundColor: const Color(0xFFFFAD31),
                child: AppText.text('Join Raffle Draw',
                    fontWeight: FontWeight.w600),
                onPressed: () {})
          ],
        ));
  }
}
