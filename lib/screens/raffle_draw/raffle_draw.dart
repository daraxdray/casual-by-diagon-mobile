import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../app/utils/index.dart';
import '../../../widgets/index.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../app/providers/user_provider.dart';
import '../../app/routes/routes.dart';
import '../../widgets/full_page_loader.dart';
import 'controller/raffle_draw_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class RaffleDrawView extends GetView<RaffleDrawController> {
  RaffleDrawView({Key? key}) : super(key: key);

  @override
  RaffleDrawController controller =
      Get.put<RaffleDrawController>(RaffleDrawController());


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height,
            child: Obx(() => SmartRefresher(
                enablePullDown: true,
                enablePullUp: false,
                header: const MaterialClassicHeader(
                  backgroundColor: Colors.black45,
                  color: Colors.grey,
                ),
                controller: controller.rfCtr,
                onRefresh: controller.onRefresh,
                child: DgFullScreenLoader(
                    isloading: controller.loading.value,
                    color: Colors.black,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 100),
                          if(controller.appSettings.value.rds_message != null && controller.appSettings.value.rds_message != 'null' && controller.appSettings.value.rds_message != '')
                            Padding(
                             padding: EdgeInsets.only(left: 20, right: 20),
                             child: InfoBox(
                               title: "Notice:",
                               message:  "${controller.appSettings.value.rds_message}",
                             ),
                           ),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).padding.top,
                                    left: 20),
                                child: AppText.text("Raffle Draws",
                                    style: AppStyle.txtInterBold25)),
                            Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  bottom: 20,
                                ),
                                child: AppText.text(
                                    'Earn massive cash rewards!!!',
                                    color: Colors.white)),
                           if(controller.raffles.isNotEmpty) Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 13),
                                child: Container(
                                    height: 47,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          stops: [
                                            0.1,
                                            0.8
                                          ],
                                          colors: [
                                            Color(0xFF4C27E0),
                                            Color(0xFF5F03A7)
                                          ]),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0)),
                                    ),
                                    child:
                                        AppText.text("RECENT WINNERS"))),
                            raffleWinners(),
                            const SizedBox(height: 10),
                            // weeklyDraw(context),
                            const SizedBox(height: 25),
                      // Padding(
                      //     padding: const EdgeInsets.only(
                      //         left: 20, right: 20, bottom: 13),
                      //     child: Container(
                      //
                      //         alignment: Alignment.center,
                      //         height: 80,
                      //         padding: const EdgeInsets.all(15),
                      //         decoration: const BoxDecoration(
                      //             gradient: LinearGradient(
                      //                 begin: Alignment.topLeft,
                      //                 end: Alignment.bottomRight,
                      //                 stops: [
                      //               0.1,
                      //               0.8
                      //             ],
                      //                 colors: [
                      //               Color(0xFF4C27E0),
                      //               Color(0xFF5F03A7)
                      //             ])),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //             Container(
                      //               child: Text.rich(TextSpan(
                      //                 text:
                      //                     "Winners for last week's raffle draw ",
                      //                 style: AppStyle.txtInterSemiBold13,
                      //               )),
                      //             ),
                      //             AppButton.button(
                      //
                      //                 minimumSize: const Size(double.maxFinite, 49),
                      //                 backgroundColor: const Color(0xFFFFAD31),
                      //                 child: AppText.text('View Now',
                      //                     fontWeight: FontWeight.w600),
                      //                 onPressed: () {})
                      //           ],
                      //         ),
                      //       )),
                            const SizedBox(height: 25),
                            luckyDraw(context),
                            const SizedBox(height: 25),
                            controller.loading.value == false
                                ? TopGamesView(
                                    gameList: controller.topGameList,
                                  )
                                : TopGamesView(
                                    gameList: [],
                                  ),
                          ]),
                      // Expanded(child: weeklyDraw(context))
                    ))))),
        SizedBox(
            child: ClipRect(
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
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
                          endTime: DateTime.parse(controller.appSettings.value
                                          .raffleDrawCountDown ??
                                      "2023-04-30")
                                  .millisecondsSinceEpoch +
                              1000 * 6900,
                          widgetBuilder: (_, CurrentRemainingTime? time) {
                            if (time == null) {
                              return AppText.text("LIVE");
                            }
                            return AppText.text(
                                "${time.days ?? 0}d ${time.hours ?? 0}h ${time.min ?? 0}m",
                                fontSize: 12);
                          },
                        ),
                        const SizedBox(width: 4)
                      ]))
                ]),
            const SizedBox(height: 10),
            FutureBuilder(
                future: controller.userProvider.getSystemSettings(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    MoneyFormatter fmf = MoneyFormatter(
                      amount: double.parse(
                          snapshot.data!['raffle_draw_amount'].toString()),
                    );
                    MoneyFormatter ticket = MoneyFormatter(
                      amount: double.parse(
                          snapshot.data!['weekly_draw_tickets'].toString()),
                    );

                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // if(controller.country =="Nigeria")AppText.text('${snapshot.data!['default_currency_symbol']}${fmf.output.nonSymbol}${snapshot.data!['default_currency']}', fontWeight:  FontWeight.w600,),
                            AppText.text('WIN UP TO',
                              style: AppStyle.txtMonumentExtendedUltrabold36,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/img/dgn.png',
                                    height: 30, width: 30, fit: BoxFit.contain),
                                const SizedBox(width: 7,),
                                AppText.text(
                                  '${snapshot.data!['raffle_draw_currency_symbol']}${fmf.output.withoutFractionDigits} ${snapshot.data!['raffle_draw_currency']}',
                                  // fontSize: 50,
                                  // fontWeight: FontWeight.w900,
                                  style:   AppStyle.txtMonumentExtendedUltrabold36,),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                AppText.text(' TOKENS WEEKLY',
                                  style:   AppStyle.txtMonumentExtendedUltrabold19.copyWith(fontSize: 25,color: AppColors.whiteColor), ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            AppText.text(
                                'Collect ${ticket.output.withoutFractionDigits} tickets to enter the draw'),
                          ])
                    );
                  }
                  return Container(
                      height: 20,
                      width: 20,
                      child: const CircularProgressIndicator(
                        strokeWidth: 3.4,
                        color: Colors.white,
                      ));
                }),
            const SizedBox(height: 24),
            controller.authService.isAuthenticated()?
            AppButton.button(
                minimumSize: const Size(double.maxFinite, 49),
                backgroundColor: controller.authService.getAuthProfile().raffleDraw == false?  const Color(0xFFDE419F)
                    :  const Color(0x885D5659),
                child: controller.authService.getAuthProfile().raffleDraw == true? AppText.text('You have joined the Raffle Draw',
                    fontWeight: FontWeight.bold): controller.joinLoading.value? Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 20,
                    width: 20,
                    child: const CircularProgressIndicator(
                      strokeWidth: 3.4,
                      color: Colors.white,
                    )):AppText.text('Join Raffle Draw',
                    fontWeight: FontWeight.bold),
                onPressed: controller.authService.getAuthProfile().raffleDraw == true?
                    ()=> {}
                    :()=> controller.joinRaffle() ):
            AppButton.button(
                minimumSize: const Size(double.maxFinite, 49),
                backgroundColor: controller.authService.getAuthProfile().raffleDraw == false?  const Color(0xFFDE419F)
                    :  const Color(0x885D5659),
                child: controller.authService.getAuthProfile().raffleDraw == true? AppText.text('You have joined the Raffle Draw',
                    fontWeight: FontWeight.bold): controller.joinLoading.value? Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 20,
                    width: 20,
                    child: const CircularProgressIndicator(
                      strokeWidth: 3.4,
                      color: Colors.white,
                    )):AppText.text('Login to Join Raffle',
                    fontWeight: FontWeight.bold),
                onPressed:
                    ()=> Get.offAndToNamed(DgRoutes.logInScreen))

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
                        AppText.text('LUCKY DRAW',
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
                          endTime: DateTime.parse(controller.appSettings.value
                                          .luckyDrawCountDown ??
                                      "2023-02-30")
                                  .millisecondsSinceEpoch +
                              1000 * 6900,
                          widgetBuilder: (_, CurrentRemainingTime? time) {
                            if (time == null) {
                              return AppText.text("LIVE");
                            }
                            return AppText.text(
                                "${time.days ?? 0}d ${time.hours ?? 0}h ${time.min ?? 0}m",
                                fontSize: 12);
                          },
                        ),
                        const SizedBox(width: 4)
                      ]))
                ]),
            const SizedBox(height: 20),
            // SvgPicture.asset('assets/svg/rf_win_ticket.svg'),
            AppText.text("WIN A USDT GIFT CARD ",style:  AppStyle.txtMonumentExtendedUltrabold36, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            FutureBuilder(
                future: controller.userProvider.getSystemSettings(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    MoneyFormatter fmf = MoneyFormatter(
                      amount: double.parse(
                          snapshot.data!['lucky_draw_tickets'].toString()),
                    );

                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText.text(
                              'Collect ${fmf.output.withoutFractionDigits} tickets to enter the draw'),
                        ]);
                  }
                  return Container(
                      height: 20,
                      width: 20,
                      child: const CircularProgressIndicator(
                        strokeWidth: 3.4,
                        color: Colors.white,
                      ));
                }),
            const SizedBox(height: 24),
            controller.authService.isAuthenticated()?
            AppButton.button(
                minimumSize: const Size(double.maxFinite, 49),
                backgroundColor: controller.authService.getAuthProfile().luckyDraw == false? const Color(0xFFFFAD31)
                : const Color(0x885D5659),
                child: controller.authService.getAuthProfile().raffleDraw == true? AppText.text('You have joined the Lucky Draw',
                    fontWeight: FontWeight.bold): controller.joinLuckyLoading.value? Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 20,
                    width: 20,
                    child: const CircularProgressIndicator(
                      strokeWidth: 3.4,
                      color: Colors.white,
                    )) : AppText.text('Join Lucky Draw',
                    fontWeight: FontWeight.w600),
                onPressed: controller.authService.getAuthProfile().luckyDraw == true?
                    ()=> {}
                    :()=> controller.joinLucky() ):
            AppButton.button(
                minimumSize: const Size(double.maxFinite, 49),
                backgroundColor: controller.authService.getAuthProfile().luckyDraw == false? const Color(0xFFFFAD31)
                : const Color(0x885D5659),
                child: controller.authService.getAuthProfile().raffleDraw == true? AppText.text('You have joined the Lucky Draw',
                    fontWeight: FontWeight.bold): controller.joinLuckyLoading.value? Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 20,
                    width: 20,
                    child: const CircularProgressIndicator(
                      strokeWidth: 3.4,
                      color: Colors.white,
                    )) : AppText.text('Login to Join Lucky Draw',
                    fontWeight: FontWeight.w600),
                onPressed:()=> Get.offAndToNamed(DgRoutes.logInScreen) )
          ],
        ));
  }

  Widget raffleWinners() {
    return ListView.separated(
        padding: const EdgeInsets.only(bottom: 30, top: 0),
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: controller.raffles.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Row(children: [
                SizedBox(width: 34, child: AppText.text('${index + 1}.')),
                ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CommonImageView(
                        url:
                            "https://www.diagon.io/images/avatars/${(controller.raffles[index].username?.toLowerCase() == controller.authService.getAuthProfile().username?.toLowerCase()) ? controller.authService.getAuthProfile().avatar : controller.raffles[index].avatar ?? 1}.png",
                        height: 37,
                        width: 37,
                        fit: BoxFit.cover)),
                const SizedBox(width: 10),
                Expanded(
                    child:
                      Container(
                        height: 37,
                        width: 200,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.bluegray800Cc),
                        child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                controller.raffles[index].category == "RAFFLE DRAW"?
                                Image.asset('assets/img/dgn.png',
                                    height: 20, width: 20, fit: BoxFit.contain):
                                SvgPicture.asset('assets/svg/reward_icon.svg', height: 25, width: 25),
                                const SizedBox(width:10),
                                Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  alignment: Alignment.centerLeft,
                                  child: AppText.text(
                                      "${controller.raffles[index].username}", textAlign: TextAlign.left),
                                ),
                              ],
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          controller.raffles[index].paid == true
                              ? SvgPicture.asset('assets/svg/green-check.svg',
                                  height: 20, width: 20)
                              : SvgPicture.asset('assets/svg/error-check.svg',
                                  height: 20, width: 20),
                        ],
                      )
                    ])))
              ]));
        });
  }
}
