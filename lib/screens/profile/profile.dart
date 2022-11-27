import 'dart:ui';
import 'package:casual/app/models/games.dart';
import 'package:casual/app/routes/routes.dart';
import 'package:casual/screens/profile/controller/user_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../app/utils/index.dart';
import '../../widgets/full_page_loader.dart';
import '../../widgets/index.dart';
import 'profile_settings.dart';

class ProfileView extends GetView<UserProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF020412),
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              Obx(() => FullScreenLoader(
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
                        community(context)
                      ])))),
              SizedBox(
                  child: ClipRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).padding.top)),
                            profileAppBar(context),
                          ]))))
            ])));
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
                            child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage(controller
                                    .userProfileModel.value
                                    .getAvatar()),
                                height: 95,
                                width: 95)),
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
                    ))),
            const SizedBox(height: 20),
            AppText.text(
                '@${controller.userProfileModel.value.username?.capitalize}',
                fontSize: 24,
                fontWeight: FontWeight.bold),
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
                    CommonImageView(
                      imagePath: 'assets/img/ticket.png',
                      height: 20,
                      width: 20,
                    ),
                    AppText.text(
                        controller.loading.value
                            ? '0'
                            : controller.userProfileModel.value.getTicket,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)
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
              AppText.text(
                  'Level ${controller.userProfileModel.value.getRank().level}',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: 2,
                  height: 18,
                  color: Colors.white.withOpacity(0.3)),
              AppText.text(
                  "${controller.userProfileModel.value.getRank().title!.capitalize}",
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
                AppText.text(
                    controller.loading.value
                        ? '0'
                        : controller.userProfileModel.value.getPoint,
                    fontWeight: FontWeight.w600)
              ])
            ])));
  }

  Widget userReferral(context) {
    return Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        padding: const EdgeInsets.all(20),
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
            const SizedBox(height: 4),
            AppText.text('For Every New ',
                fontWeight: FontWeight.w900, fontSize: 24),
            Row(
              children: [
                AppText.text('Member ',
                    fontWeight: FontWeight.w900, fontSize: 24),
                Image.asset('assets/img/dgn-2.png', height: 28, width: 28),
                AppText.text(' 5 DGN ',
                    fontWeight: FontWeight.w900, fontSize: 24),
              ],
            ),
            const SizedBox(height: 10),
            playerIcons(context, GameModel())
          ],
        ));
  }

  // Widget playerIcons(context) {
  //   return Row(children: [
  //     SizedBox(
  //         height: 18,
  //         width: 54,
  //         child: Stack(children: [
  //           Positioned(
  //               left: 30,
  //               child: Container(
  //                 height: 18,
  //                 width: 18,
  //                 decoration: BoxDecoration(
  //                     border: Border.all(
  //                       color: const Color(0xFF00C64F),
  //                     ),
  //                     borderRadius: BorderRadius.circular(100),
  //                     image: const DecorationImage(
  //                         image: AssetImage('assets/img/user_profile.png'))),
  //               )),
  //           Positioned(
  //               left: 15,
  //               child: Container(
  //                 height: 18,
  //                 width: 18,
  //                 decoration: BoxDecoration(
  //                     border: Border.all(
  //                       color: const Color(0xFF00C64F),
  //                     ),
  //                     borderRadius: BorderRadius.circular(100),
  //                     image: const DecorationImage(
  //                         image: AssetImage('assets/img/user_profile.png'))),
  //               )),
  //           Positioned(
  //               left: 0,
  //               child: Container(
  //                 height: 18,
  //                 width: 18,
  //                 decoration: BoxDecoration(
  //                     border: Border.all(
  //                       color: const Color(0xFF00C64F),
  //                     ),
  //                     borderRadius: BorderRadius.circular(100),
  //                     image: const DecorationImage(
  //                         image: AssetImage('assets/img/user_profile.png'))),
  //               )),
  //         ]))
  //   ]);
  // }

  Widget highScore(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20)
            .add(const EdgeInsets.only(top: 10)),
        child: AppButton.button(
            onPressed: () =>
                Get.toNamed(DgRoutes.authRoute(DgRoutes.highScoreScreen)),
            backgroundColor: const Color(0xFF251654),
            child: Row(children: [
              SvgPicture.asset('assets/svg/high_score.svg'),
              const SizedBox(width: 10),
              AppText.text('Your High Score', fontWeight: FontWeight.w500)
            ])));
  }

  Widget pastActivities(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20)
            .add(const EdgeInsets.only(top: 10)),
        child: AppButton.button(
            onPressed: () =>
                Get.toNamed(DgRoutes.authRoute(DgRoutes.pastActivityScreen)),
            backgroundColor: const Color(0xFF123732),
            child: Row(children: [
              SvgPicture.asset('assets/svg/past_activity.svg'),
              const SizedBox(width: 10),
              AppText.text('Past Activity', fontWeight: FontWeight.w500)
            ])));
  }

  Widget referralCode(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20)
            .add(const EdgeInsets.only(top: 10)),
        child: AppButton.button(
            onPressed: () {},
            backgroundColor: const Color(0xFF12162E),
            child: Row(children: [
              SvgPicture.asset('assets/svg/user_group.svg'),
              const SizedBox(width: 10),
              AppText.text('Referral Code', fontWeight: FontWeight.w500)
            ])));
  }

  Widget community(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppText.text('Community', fontSize: 20, fontWeight: FontWeight.bold),
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
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/svg/discord.svg'),
                          const SizedBox(width: 10),
                          AppText.text('Discord',
                              color: const Color(0xFFD4D8E9),
                              fontWeight: FontWeight.w600)
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey.withOpacity(0.6), height: 30),
                    GestureDetector(
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/svg/telegram.svg',
                              height: 22, width: 22),
                          const SizedBox(width: 10),
                          AppText.text('Telegram Group Hangout',
                              color: const Color(0xFFD4D8E9),
                              fontWeight: FontWeight.w600)
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey.withOpacity(0.6), height: 30),
                    GestureDetector(
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
