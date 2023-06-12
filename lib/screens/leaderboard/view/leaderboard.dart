import 'dart:math';
import 'dart:ui';

import 'package:casual/app/services/auth_service.dart';
import 'package:casual/widgets/full_page_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:timelines/timelines.dart';

import '../../../app/utils/index.dart';
import '../../../widgets/index.dart';
import '../../../widgets/leaders_widget.dart';
import '../controller/leader_board_controller.dart';

class LeaderboardView extends GetView<LeaderBoardController> {
   LeaderboardView({Key? key}) : super(key: key);
  @override
  final LeaderBoardController controller = Get.put(LeaderBoardController());
   final RefreshController refreshController =
   RefreshController(initialRefresh: false);

   void onRefresh() async{
     // monitor network fetch
     controller.loaded(false);
     controller.reload(false);
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
            error: controller.reload.value,
            callback: onRefresh,
            isloading: controller.loaded.value == false,
            child:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child:  Column( children: [
            const SizedBox(height: 100),
          controller.appSettings.value.firstPrizeDefault != null? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(child: AppText.text("${controller.appSettings.value.challengeMessage}", fontSize: 16, fontWeight: FontWeight.w500),),
                const SizedBox(height:8),
                CountdownTimer(
                  endTime: DateTime.parse("${controller.appSettings.value.challengeEndTime}").millisecondsSinceEpoch + 1000 * 6900,
                  widgetBuilder: (_, CurrentRemainingTime? time) {
                    if (time == null) {
                      return const SizedBox();
                    }
                    return Row (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          SvgPicture.asset('assets/svg/time.svg',width: 20,),
                          const SizedBox(width: 4),
                          AppText.text("${time.days?? 0}d ${time.hours ?? 0}h ${time.min ?? 0}m", fontSize: 16, fontWeight: FontWeight.normal)]);
                  },
                ),
              ]
          ).animate().slide():
          Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(child:  ShimmerShape(),height: 18,width: 160,),
                        const SizedBox(height:8),
                        SizedBox(height: 18,width: 120,child: ShimmerShape())
                      ]
                  ),
          const SizedBox(height: 15),
          if(controller.appSettings.value.lbs_message != null && controller.appSettings.value.lbs_message != 'null' && controller.appSettings.value.lbs_message != '')  Padding(
            padding:const EdgeInsets.only(left: 20, right: 20),
            child: InfoBox(
              title: "Notice:",
              message:"${controller.appSettings.value.lbs_message}",
            ),
          ),
          const SizedBox(height: 25),
             Align(alignment: Alignment.center,
               child: Padding(
               padding: const EdgeInsets.only(left:10,right:10),
               child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children:  [
                     gradientContainer(context,
                       margin: EdgeInsets.all(2),

                       color: Colors.black,
                       active: controller.showLeader.value,
                       child: InkWell(
                           onTap: ()=>controller.showLeader(true),
                           child: SizedBox(
                                width:150,
                               child: Center(
                                   child: AppText.text('Leaderboard',
                                       fontWeight: FontWeight.bold, fontSize: 16)))),
                     ),
                     gradientContainer(context,
                         color: Colors.black,
                         margin: const EdgeInsets.all(2),
                         active: controller.showLeader.value == false,
                         child:InkWell(
                             onTap: ()=>controller.showLeader(false),
                             child: SizedBox(
                                 width: 150,
                                 child:  Center(
                                     child: AppText.text('Prizes',
                                         fontWeight: FontWeight.bold, fontSize: 16))))),
                   ]),
             ),),
        if(controller.showLeader.value && controller.leaders.isNotEmpty) Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:  [

                      LeaderWidget(index: 2,leader:controller.leaders[1], prize:controller.countryIsNigeria?"${controller.appSettings.value.secondPrizePrimary}":"${controller.appSettings.value.secondPrizeDefault}"),
                      LeaderWidget(index: 1,leader:controller.leaders[0], prize:controller.countryIsNigeria?"${controller.appSettings.value.firstPrizePrimary}":"${controller.appSettings.value.firstPrizeDefault}"),
                      LeaderWidget(index: 3,leader:controller.leaders[2], prize:controller.countryIsNigeria?"${controller.appSettings.value.thirdPrizePrimary}":"${controller.appSettings.value.thirdPrizeDefault}"),

                    ]
                ),
              ).animate().move(),
              const SizedBox(height:5),
              (controller.userScore.value != 1 &&
                  controller.userScore.value != 1 &&
                  controller.userScore.value != 1)?Container(
                  width: 330,
                  height: 53,
                  padding: const EdgeInsets.all(10),
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
                      controller.position.value == 0?const SizedBox(width:34): SizedBox( child: Row(children:[
                        AppText.text("${controller.position.value}"),
                        const SizedBox(width:4),
                        CommonImageView(imagePath: "assets/img/yellow_arrow_up.png",height: 6,width: 6,),
                        const SizedBox(width:4),
    ])),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CommonImageView(url:controller.authService.getAuthProfile().getAvatar(),
                            height: 37, width: 37, fit: BoxFit.cover)),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Container(
                            height: 37,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                 controller.position.value == 0?  AppText.text("YOU - Start Playing!")
                                  : AppText.text("YOU"),
                                  AppText.text("${controller.authService.getAuthProfile().getChallenge}",
                                      color: AppColors.blue)
                                ]
                            )))
                  ]))
              ): const SizedBox(),

              users(),
            ],
          ),
         if(!controller.showLeader.value && controller.leaders.isNotEmpty) Stack(children: [
           Column(
             children: [
               Padding(
                 padding: EdgeInsets.only(left: 20,right:20,top: 60),
                 child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children:  [

                       SizedBox(
                           child: SvgPicture.asset('assets/svg/prize_2.svg',
                             alignment: Alignment.centerLeft,height: 120,)),
                       SizedBox(
                           child: SvgPicture.asset('assets/svg/prize_1.svg',
                               alignment: Alignment.centerLeft,height: 150)),
                       SizedBox(

                           child: SvgPicture.asset('assets/svg/prize_3.svg',
                               alignment: Alignment.centerLeft,height: 120)),

                     ]
                 ),
               ).animate().move(),
              const DotIndicator(color:Colors.amber),
               const SizedBox(height:60, child: DashedLineConnector(thickness: 1.5,gap: 4,),),
               const  DotIndicator(color:Colors.amber),
               if(controller.appSettings.value.firstPrizePrimary != null && controller.appSettings.value.firstPrizeDefault != null) SizedBox(width: 270,
                   child: gradientContainer(context,
                       margin:  const EdgeInsets.only(left: 20, right: 20, top: 0),
                       color: Colors.black,
                       child: Obx(() => Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             ClipRRect(
                                 borderRadius: BorderRadius.circular(100),
                                 child:  Container(color: AppColors.bluegray800Cc,
                                     padding: EdgeInsets.all(5),
                                     child: CommonImageView(imagePath: "assets/img/cash.png",
                                         height: 15, width: 15, fit: BoxFit.cover))),
                             Container(

                                 padding: const EdgeInsets.symmetric(horizontal: 20),
                                 child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       AppText.text("${controller.countryIsNigeria?  controller.appSettings.value.firstPrizePrimary : controller.appSettings.value.firstPrizeDefault }",
                                           fontWeight: FontWeight.bold, fontSize: 20)
                                     ]
                                 ))
                           ]))
                   ).animate().slide()),
               if(controller.appSettings.value.secondPrizePrimary != null && controller.appSettings.value.secondPrizeDefault != null) SizedBox(width: 270,
                   child: gradientContainer(context,
                       color: Colors.black,
                       child: Obx(() => Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             ClipRRect(
                                 borderRadius: BorderRadius.circular(100),
                                 child:  Container(color: AppColors.bluegray800Cc,
                                     padding: EdgeInsets.all(5),
                                     child: CommonImageView(imagePath: "assets/img/cash.png",
                                         height: 15, width: 15, fit: BoxFit.cover))),
                             Container(

                                 padding: const EdgeInsets.symmetric(horizontal: 20),
                                 child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       // AppText.text("${controller.appSettings.value?.prize}"),
                                       AppText.text("${controller.countryIsNigeria? controller.appSettings.value.secondPrizePrimary : controller.appSettings.value.secondPrizeDefault }",
                                           fontWeight: FontWeight.bold, fontSize: 20)
                                     ]
                                 ))
                           ]))
                   ).animate().slide()),
               SizedBox(width: 270,
                   child: gradientContainer(context,
                       color: Colors.black,
                       child: Obx(() => Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             ClipRRect(
                                 borderRadius: BorderRadius.circular(100),
                                 child:  Container(color: AppColors.bluegray800Cc,
                                     padding: EdgeInsets.all(5),
                                     child: CommonImageView(imagePath: "assets/img/cash.png",
                                         height: 15, width: 15, fit: BoxFit.cover))),
                             Container(

                                 padding: const EdgeInsets.symmetric(horizontal: 20),
                                 child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       // AppText.text("${controller.appSettings.value?.prize}"),
                                       AppText.text("${controller.countryIsNigeria?controller.appSettings.value.thirdPrizePrimary :  controller.appSettings.value.thirdPrizeDefault}",
                                           fontWeight: FontWeight.bold, fontSize: 20)
                                     ]
                                 ))
                           ]))
                   ).animate().slide()),
               const SizedBox(height: 20),
               SizedBox(width: 300,
                   child: Obx(() => Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         ClipRRect(
                             borderRadius: BorderRadius.circular(100),
                             child:  Container(color: AppColors.bluegray800Cc,
                               padding: EdgeInsets.all(10),
                               child: SizedBox(
                                   child: SvgPicture.asset('assets/svg/cup_icon.svg',
                                       alignment: Alignment.center)),)),
                         gradientContainer(context, color: Colors.black,
                             margin:const EdgeInsets.only(top:0,left:10,right: 20,),
                             child: Padding(padding: const EdgeInsets.only(left:10,right:10),
                                 child: AppText.text("${controller.appSettings.value.prizeRangeOneLabel}",
                                 fontWeight: FontWeight.bold, fontSize: 13) )),
                         ClipRRect(
                             borderRadius: BorderRadius.circular(100),
                             child:  Container(color: AppColors.bluegray800Cc,
                                 padding: const EdgeInsets.all(5),
                                 child: CommonImageView(imagePath: "assets/img/cash.png",
                                     height: 15, width: 15, fit: BoxFit.cover))),
                         Container(
                             padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                             child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   // AppText.text("${controller.appSettings.value?.prize}"),
                                   AppText.text("${controller.countryIsNigeria?  controller.appSettings.value.prizeRangeOnePrimary : controller.appSettings.value.prizeRangeOneDefault}",
                                       fontWeight: FontWeight.bold, fontSize: 20)
                                 ]
                             ))
                       ])
                   ).animate().slide()),
               const SizedBox(height: 10),
               SizedBox(width: 300,
                   child: Obx(() => Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         ClipRRect(
                             borderRadius: BorderRadius.circular(100),
                             child:  Container(color: AppColors.bluegray800Cc,
                               padding: EdgeInsets.all(10),
                               child: SizedBox(
                                   child: SvgPicture.asset('assets/svg/cup_icon.svg',
                                       alignment: Alignment.center)),)),
                         gradientContainer(context, color: Colors.black,
                             margin: const EdgeInsets.only(top:0,left:10,right: 20,),
                             child: Padding(padding:const EdgeInsets.only(left:10,right:10),child: AppText.text("${controller.appSettings.value.prizeRangeTwoLabel}",
                                 fontWeight: FontWeight.bold, fontSize: 13) )),
                         ClipRRect(
                             borderRadius: BorderRadius.circular(100),
                             child:  Container(color: AppColors.bluegray800Cc,
                                 padding:const EdgeInsets.all(5),
                                 child: CommonImageView(imagePath: "assets/img/cash.png",
                                     height: 15, width: 15, fit: BoxFit.cover))),
                         Container(

                             padding: const EdgeInsets.symmetric(horizontal: 10),
                             child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   // AppText.text("${controller.appSettings.value?.prize}"),
                                   AppText.text("${controller.countryIsNigeria?  controller.appSettings.value.prizeRangeTwoPrimary : controller.appSettings.value.prizeRangeTwoDefault}",
                                       fontWeight: FontWeight.bold, fontSize: 20)
                                 ]
                             ))
                       ])
                   ).animate().slide()),
               const SizedBox(height: 60),

             ],
           ),
           Positioned(
             right: 50,
               top:190,
               child: Column(
             children:  [
               DotIndicator(color:AppColors.fromHex("#6D2B07")),
               const SizedBox(height:70, child: DashedLineConnector(thickness: 1.5,gap: 4,),),
               const SizedBox(width:40, child: DashedLineConnector(direction: Axis.horizontal,thickness: 1.5,gap: 4,
               indent: 19,),),

               // DotIndicator(color:AppColors.fromHex("#6D2B07")),
               ]
           )),
          const Positioned(right: 50,top:280,
             child:  SizedBox(height:160, child: DashedLineConnector(thickness: 1.5,gap: 4,),),),
            Positioned(right: 50,top:430,
             child:  SizedBox(width:40, child: TimelineNode(
               direction: Axis.horizontal,
               endConnector: DotIndicator(color:AppColors.fromHex("#6D2B07")),
             ),),),

           Positioned(
             left: 50,
               top:190,
               child: Column(
             children: const [
               DotIndicator(color:Colors.grey),
               SizedBox(height:70, child: DashedLineConnector(thickness: 1.5,gap: 4,),),
               SizedBox(width:40, child: DashedLineConnector(direction: Axis.horizontal,thickness: 1.5,gap: 4,
                 endIndent: 19,),),
               ]
           )),
            const Positioned(left: 50,top:280,
             child:  SizedBox(height:100, child: DashedLineConnector(thickness: 1.5,gap: 4,),),),
           const Positioned(left: 30,top:370,
             child:  SizedBox(width:40, child: TimelineNode(
               direction: Axis.horizontal,
               endConnector: DotIndicator(color:Colors.grey),
             ),),),
         ],),

          ])
        )),
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

  Widget gradientContainer(context, {required Widget child, bool? active, Color? color,EdgeInsets? margin}) {
    return Container(
        padding: const EdgeInsets.all(2),
        margin: margin ?? const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                // gradient: const LinearGradient(
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //     colors: [
                //       Color(0xFF020412),
                //       Color(0xFF171B3A),
                //     ]),
              color: active == true? Colors.white54: color,

            ),
            child: child));
  }

  Widget users() {
    return ListView.separated(
        padding: const EdgeInsets.only(bottom: 30,top: 0),
        separatorBuilder: (context, index) => SizedBox(height:10),
        itemCount: controller.leaders.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),

              child: index > 2? Row(children: [
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
                              Container(margin: EdgeInsets.only(right: 20),child: AppText.text("${controller.leaders[index].username}"),),

                              // controller.appSettings.value.prizeRangeOneDefault
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  if(index < (controller.appSettings.value.priceRange ?? 0)) SvgPicture.asset('assets/svg/reward_icon.svg', height: 25, width: 25),
                                  const SizedBox(width:5),
                                  Align(alignment: Alignment.centerRight, child: AppText.text(controller.leaders[index].getChallenge,
                                      color: AppColors.blue))
                                ],
                              )
                            ])))
              ]): const SizedBox());
        });
  }
}
