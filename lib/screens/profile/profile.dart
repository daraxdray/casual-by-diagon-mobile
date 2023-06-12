import 'dart:ui';
import 'package:casual/app/models/games.dart';
import 'package:casual/app/routes/routes.dart';
import 'package:casual/screens/profile/controller/user_profile_controller.dart';
import 'package:casual/screens/profile/referral.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../app/services/auth_service.dart';
import '../../app/utils/index.dart';
import '../../widgets/full_page_loader.dart';
import '../../widgets/index.dart';
import 'profile_settings.dart';
import 'package:url_launcher/url_launcher.dart';


class ProfileView extends GetView<UserProfileController> {
  ProfileView({Key? key}) : super(key: key);
  final UserProfileController controller = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF020412),
        body:  SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:   SmartRefresher(
                enablePullDown: true,
                enablePullUp: false,
    header: const MaterialClassicHeader(backgroundColor: Colors.black45,color: Colors.grey,),
    controller: controller.refreshController,
    onRefresh: controller.onRefresh,
    child: Stack(children: [
                    Obx(() => DgFullScreenLoader(
            color: AppColors.black900,
            isloading: controller.loading.value,
            child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        SizedBox(width: MediaQuery.of(context).size.width),
                        basicInfo(context),
                        ticketBalance(context),
                        badges(context),
                        userReferral(context),
                        highScore(context),
                        pastActivities(context),
                        referralCode(context),
                        community(context),
                          const  SizedBox(height:30)
                      ])))),
                  SizedBox(
                      child: ClipRect(
                          child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                .padding
                                                .top)),
                                    profileAppBar(context),
                                  ]))))
                ]))));
  }

  Widget profileAppBar(context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: MediaQuery.of(context).size.width,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset('assets/svg/back_arrow.svg',
                  height: 30, width: 30)),
          GestureDetector(
            onTap: () =>
                Get.toNamed(DgRoutes.authRoute(DgRoutes.profileSettingsScreen)),
            child: SvgPicture.asset('assets/svg/settings.svg'),
          )
        ]));
  }

  Widget basicInfo(context) {
    return Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 100),
        child: Column(
          children: [
            GestureDetector(
                onTap: () {},
                child: SizedBox(
                    width: 111,
                    height: 95,
                    child: Stack(
                      children: [
                        Positioned(
                            width: 95,
                            top: 0,
                            right: 0,
                            child: ClipRRect(borderRadius: BorderRadius.circular(60), child: CommonImageView(
                                fit: BoxFit.cover,
                                url: controller
                                    .userProfileModel.value
                                    .getAvatar(),
                                placeHolder: 'assets/img/avatars/avatar72.png',
                                height: 95,
                                width: 95))),
                        Positioned(
                            top: 32.5,
                            left: 0,
                            child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 3,
                                      color: const Color(0xFF142261),
                                      strokeAlign: BorderSide.strokeAlignOutside),
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
                                child:  Center(
                                    child: Text("${controller.userProfileModel.value.getRank().level}",
                                        textAlign: TextAlign.center,
                                        style:const TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold)))))
                      ],
                    ))),
            const SizedBox(height: 20),
            AppText.text('@${controller.userProfileModel.value.username}',
                fontSize: 24, fontWeight: FontWeight.bold),
            const SizedBox(height: 13),
            AppText.text(
                "${controller.userProfileModel.value.firstName?.capitalize} ${controller.userProfileModel.value.lastName?.capitalize}",
                fontWeight: FontWeight.w500),
          ],
        ));
  }

  Widget ticketBalance(context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF0A4E74),
                  const Color(0xFF9F00D7).withOpacity(0.5),
                  Colors.transparent
                ])),
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF020412),
                      Color(0xFF171B3A),
                    ])),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AppText.text('Ticket Balance',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withOpacity(0.67)),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                    color: const Color(0xFF22264E),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Image.asset('assets/img/ticket.png',
                        height: 25, width: 32, fit: BoxFit.contain),
                    const SizedBox(width: 10,),
                    AppText.text(controller.loading.value?'0': "${controller.userProfileModel.value.getTicket}",
                        fontSize: 18, fontWeight: FontWeight.w500)
                  ],
                ),
              )
            ])));
  }

  Widget badges(context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF0A4E74),
                  const Color(0xFF9F00D7).withOpacity(0.5),
                  Colors.transparent
                ])),
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF020412),
                      Color(0xFF171B3A),
                    ])),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              AppText.text('Level ${controller.userProfileModel.value.getRank().level}',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: 2,
                  height: 18,
                  color: Colors.white.withOpacity(0.3)),
              AppText.text("${controller.userProfileModel.value.getRank().title!.capitalize}",
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: 2,
                  height: 18,
                  color: Colors.white.withOpacity(0.3)),
              Row(children: [
                SvgPicture.asset('assets/svg/cup_icon.svg'),
                const SizedBox(width: 5),
                AppText.text(controller.loading.value?'0': "${controller.userProfileModel.value.getPoint}", fontWeight: FontWeight.w600)
              ])
            ])));
  }

  Widget userReferral(context) {
    return Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        padding: const EdgeInsets.only(left:20,top: 20,bottom: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF00C64F), Color(0xFF006F39)])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.text('Your referrals'),

            Container(
                width:                 300.00,
                margin: EdgeInsets.only(
                    top: 10,
                    right: 10),
                child:  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: RichText(
                        text:TextSpan(
                            text:"For every New Member earn ",
                            children: [
                              WidgetSpan(child: Image.asset('assets/img/ticket.png',
                                  height: 32, width: 32, fit: BoxFit.contain),),

                              TextSpan(text:" 5 tickets", style: AppStyle.txtInterBold24.copyWith(fontWeight:FontWeight.w900,)),
                            ],
                            style: AppStyle.txtInterBold24.copyWith(fontWeight:FontWeight.w900,
                                fontSize: 24))))),
            playerIcons(context,GameModel(), hideTotal: true)
          ],
        ));
  }

  Widget highScore(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20)
            .add(const EdgeInsets.only(top: 10)),
        child: AppButton.button(
            onPressed: () => Get.toNamed(DgRoutes.authRoute(DgRoutes.highScoreScreen)),
            backgroundColor: const Color(0xFF251654),
            child: Row(children: [
              SvgPicture.asset('assets/svg/high_score.svg'),
              const SizedBox(width: 10),
              AppText.text('My Total Scores', fontWeight: FontWeight.w500)
            ])));
  }

  Widget pastActivities(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20)
            .add(const EdgeInsets.only(top: 10)),
        child: AppButton.button(
            onPressed: () =>Get.toNamed(DgRoutes.authRoute(DgRoutes.pastActivityScreen)),
            backgroundColor: const Color(0xFF123732),
            child: Row(children: [
              SvgPicture.asset('assets/svg/past_activity.svg'),
              const SizedBox(width: 10),
              AppText.text('My Past Activities', fontWeight: FontWeight.w500)
            ])));
  }

  Widget referralCode(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20)
            .add(const EdgeInsets.only(top: 10)),
        child: AppButton.button(
            onPressed: () =>Get.toNamed(DgRoutes.authRoute(DgRoutes.referralScreen)),
            backgroundColor: const Color(0xFF12162E),
            child: Row(children: [
              SvgPicture.asset('assets/svg/user_group.svg'),
              const SizedBox(width: 10),
              AppText.text('My Referral Code', fontWeight: FontWeight.w500)
            ])));
  }

  Widget community(context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 60, left: 20,right: 20,top:40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppText.text('Join the Community', fontSize: 20, fontWeight: FontWeight.bold),
          Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFF0A4E74),
                        const Color(0xFF9F00D7).withOpacity(0.5),
                      ])),
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFF020412)),
                  child: Column(children: [
                    GestureDetector(
                      onTap: ()=> DgAuthService.launchURL('https://discord.gg/GDZgb8qZsm',launchMode: LaunchMode.externalApplication),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/svg/discord.svg'),
                          const SizedBox(width: 10),
                          AppText.text('Discord Server',
                              color: const Color(0xFFD4D8E9),
                              fontWeight: FontWeight.w600)
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey.withOpacity(0.6), height: 30),
                    GestureDetector(
                      onTap: ()=> DgAuthService.launchURL('https://t.me/diagonstudios',launchMode: LaunchMode.externalApplication),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/svg/telegram.svg',
                              height: 22, width: 22),
                          const SizedBox(width: 10),
                          AppText.text('Telegram Group',
                              color: const Color(0xFFD4D8E9),
                              fontWeight: FontWeight.w600)
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey.withOpacity(0.6), height: 30),
                    GestureDetector(
                      onTap: ()=> DgAuthService.launchURL('https://twitter.com/diagonio',launchMode: LaunchMode.externalApplication),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/twitter.svg',
                          ),
                          const SizedBox(width: 10),
                          AppText.text('Twitter Social',
                              color: const Color(0xFFD4D8E9),
                              fontWeight: FontWeight.w600)
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey.withOpacity(0.6), height: 30),
                    GestureDetector(
                      onTap: ()=> DgAuthService.launchURL('https://www.instagram.com/diagonio/',launchMode: LaunchMode.externalApplication),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/svg/instagram.svg',
                              height: 22, width: 22),
                          const SizedBox(width: 10),
                          AppText.text('Instagram Page',
                              color: const Color(0xFFD4D8E9),
                              fontWeight: FontWeight.w600)
                        ],
                      ),
                    ),
                  ])))
        ]));
  }


}
