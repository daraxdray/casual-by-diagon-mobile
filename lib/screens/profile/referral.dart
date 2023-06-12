import 'dart:ui';

import 'package:casual/app/routes/routes.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../app/utils/index.dart';
import '../../widgets/full_page_loader.dart';
import '../../widgets/index.dart';
import 'controller/referal_controller.dart';

// import 'index.dart';

class ReferralView extends GetView<UserReferralController> {
  const ReferralView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF020412),
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
                SmartRefresher(
                enablePullDown: true,
                enablePullUp: false,
                header: const MaterialClassicHeader(backgroundColor: Colors.black45,color: Colors.grey,),
                controller: controller.refreshController,
                onRefresh: controller.onRefresh,
                child:  Obx(()=>DgFullScreenLoader(
                  color:Colors.black,
                  isloading: controller.loading.value,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Column(children: [
                      Stack(children: [
                        Column(children: [
                          heroImage(context),
                          // const SizedBox(height: 40),
                        ])
                      ]),
                      description(),
                      extraBonus(context),
                      extraEarnings(context),
                      inviteFriends(context),
                      referralCode(context),
                      yourTeam(context),
                      howItWorks(context)
                    ]),
                  ),
                ))),
              SizedBox(
                  child: ClipRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).padding.top)),
                            referralAppBar(context),
                          ]))))
            ])));
  }


  Widget referralCode(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20)
            .add(const EdgeInsets.only(top: 10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          const SizedBox(height: 10),
          AppText.text('Your referral code',
              fontWeight: FontWeight.w600, color: AppColors.muted, fontSize: 18),
          const SizedBox(height: 10),
          AppButton.button(
              onPressed: () {
                FlutterClipboard.copy("${controller.dgAuthService.getAuthProfile().username}").then((value) => successSnack("Referral","Your referral code copied"));
              },
              padding: const EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: const Color(0xFF12162E),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.text("${controller.dgAuthService.getAuthProfile().username}", fontWeight: FontWeight.w500),
                    SvgPicture.asset('assets/svg/copy.svg'),
                  ]))
        ]));
  }


  Widget heroImage(context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.8,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/img/referal_imagee.png'),
          )),
    );
  }

  Widget referralAppBar(context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: MediaQuery.of(context).size.width,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset('assets/svg/back_arrow.svg',
                  height: 30, width: 30)),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100)),
              child: AppText.text('Your Referrals', fontWeight: FontWeight.w500)),
          const SizedBox()
        ]));
  }

  Widget description() {
    return Column(children: [
      const SizedBox(height: 20),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        AppText.text('Get ', fontSize: 23, fontWeight: FontWeight.bold),
        Image.asset('assets/img/ticket.png',
            height: 32, width: 32, fit: BoxFit.contain),
        AppText.text(' 5 tickets for each invite',
            fontSize: 23, fontWeight: FontWeight.bold)
      ]),
      const SizedBox(height: 40),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        AppText.text('1 ', fontSize: 23, fontWeight: FontWeight.bold),
        ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CommonImageView(url:controller.dgAuthService.getAuthProfile().getAvatar(),
                height: 37, width: 37, fit: BoxFit.cover)),
        AppText.text(' = ', fontSize: 23, fontWeight: FontWeight.bold),
        Image.asset('assets/img/ticket.png',
            height: 32, width: 32, fit: BoxFit.contain),
        AppText.text(' 5 tickets', fontSize: 23, fontWeight: FontWeight.bold)
      ]),
    ]);
  }

  Widget extraBonus(context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 46),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppText.text('+ Extra team bonus',
              fontWeight: FontWeight.w700, fontSize: 20),
          AppText.text('Earn extra rewards on referral milestones.',
              color: AppColors.muted)
        ]));
  }

  Widget yourTeam(context) {
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Padding(
            padding: const EdgeInsets.symmetric()
                .add(const EdgeInsets.only(top: 10)),
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
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText.text('My Referrals', fontSize: 15, fontWeight: FontWeight.w600),
                              const SizedBox(width: 10),
                              const Icon(DgIcons.users_group, size:25, color: Colors.white,),
                            ]))),
                onPressed: () =>Get.toNamed(DgRoutes.authRoute(DgRoutes.allReferrers)))
        )
      //  Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       AppText.text('Your Team', fontWeight: FontWeight.w700, fontSize: 20),
      //       const SizedBox(height: 14),
      //       Padding(
      //           padding: const EdgeInsets.only(left: 60, right: 60),
      //           child: AppText.text(
      //               'Invite your friends, you will see your team growing here',
      //               color: AppColors.muted,
      //               textAlign: TextAlign.center)),
      //       const SizedBox(height: 14),
      //   Obx(()=> ListView.separated(
      //       shrinkWrap: true,
      //       physics: const NeverScrollableScrollPhysics(),
      //       padding: const EdgeInsets.symmetric(horizontal: 20),
      //       separatorBuilder: (context, index) =>
      //       const SizedBox(height: 10),
      //       itemCount: controller.referralList.length,
      //       itemBuilder: (context, index) => ListTile(
      //         leading: ClipRRect(
      //             borderRadius: BorderRadius.circular(100),
      //             child: CommonImageView(url:"https://www.diagon.io/images/avatars/${controller.referralList[index]?.avatar ?? 1}.png",
      //                 height: 37, width: 37, fit: BoxFit.cover)),
      //         title: AppText.text(controller.referralList[index]?.username ?? ''),
      //       )
      //   )),
      //       const SizedBox(height: 14),
      //       Center(child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children :[
      //           GestureDetector(
      //             onTap: ()=> Get.toNamed(DgRoutes.authRoute(DgRoutes.allReferrers)),
      //             child: AppText.text("View all team"),
      //           ),
      //           const SizedBox(width:20),
      //           const Icon(DgIcons.caret_right, size:15, color: Colors.white,),
      //         ]
      //       )),
      //
      //     ],
      //   )
    );
  }

  Widget howItWorks(context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.text('How it Works',
                fontSize: 20, fontWeight: FontWeight.w700),
            const SizedBox(height: 16),
            howItWorksCard(
                image: 'assets/img/invite_friends.png',
                title: AppText.text('Invite Friends',
                    fontWeight: FontWeight.w600, fontSize: 19),
                description:
                'Your friends need to use your referral link or code to join your team'),
            const SizedBox(height: 20),
            howItWorksCard(
                image: 'assets/img/silver.png',
                title: Row(children: [
                  AppText.text('Silver = ',
                      fontWeight: FontWeight.w600, fontSize: 19),
                  Image.asset('assets/img/dgn-2.png',
                      height: 19, width: 19, fit: BoxFit.contain),
                  const SizedBox(width: 4),
                  AppText.text('3', fontSize: 19, fontWeight: FontWeight.bold)
                ]),
                description:
                'When your friend reaches a silver rank in any game, you both get 3 Tickets'),
            const SizedBox(height: 20),
            howItWorksCard(
                image: 'assets/img/gold.png',
                title: Row(children: [
                  AppText.text('Gold = ',
                      fontWeight: FontWeight.w600, fontSize: 19),
                  Image.asset('assets/img/dgn-2.png',
                      height: 19, width: 19, fit: BoxFit.contain),
                  const SizedBox(width: 4),
                  AppText.text('10', fontSize: 19, fontWeight: FontWeight.bold)
                ]),
                description:
                'When your friend reaches a goldrank in any game, you both get 10 Tickets'),
            const SizedBox(height: 20),
            howItWorksCard(
                image: 'assets/img/grow_team.png',
                title: AppText.text('Grow your team',
                    fontWeight: FontWeight.w600, fontSize: 19),
                description:
                'Every friend on at least silver level counts towards your team bonus'),
            const SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.symmetric()
                    .add(const EdgeInsets.only(top: 10)),
                child: AppButton.button(
                    onPressed: ()=>Get.toNamed(DgRoutes.browseLink,arguments: {'url':'https://diagonio.medium.com'}),// https://diagonio.medium.com/{},
                    backgroundColor: const Color(0xFF12162E),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/svg/info.svg'),
                          const SizedBox(width: 10),
                          AppText.text('Read more', fontWeight: FontWeight.w500)
                        ])))
          ],
        ));
  }

  Widget howItWorksCard({required String image, required Widget title, required String description}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(image, height: 60, width: 60)),
      const SizedBox(width: 15),
      Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [title, AppText.text(description, color: AppColors.muted)],
          ))
    ]);
  }

  Widget inviteFriends(context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 25, bottom: 25),
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
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/svg/add_user.svg'),
                          const SizedBox(width: 6),
                          AppText.text('Add Refferer',
                              fontSize: 15, fontWeight: FontWeight.w600)
                        ]))),
            onPressed: () =>Get.dialog( Scaffold(
              body: Obx(()=>DgFullScreenLoader(
                isloading: controller.loading.value,
                child: Container(
                    color: AppColors.black900,
                    child: Column(
                      children: [
                        referalCodeAppBar(context),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              top: 55,
                              right: 10,
                            ),
                            child: CommonImageView(
                              imagePath: "assets/img/magnet.png",
                              height: 112.00,
                              width: 108.00,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 20,right:20),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              AppText.text('Who referred you?',
                                  color: AppColors.mutedText,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                              const SizedBox(height: 8),
                              AppTextInput.input(
                                  onChanged: (val) =>
                                      controller.referrerCode.currentState!.validate(),
                                  controller: controller.referrerCodeCtr,
                                  fillColor: AppColors.accent,
                                  cursorColor: Colors.white,
                                  hintText: "Enter Username",
                                  hintStyle: TextStyle(color: Colors.white54),
                                  textColor: Colors.white)
                            ],
                          ),
                        ),
                        Container(
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
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [

                                              const SizedBox(width: 6),
                                              AppText.text('Submit',
                                                  fontSize: 15, fontWeight: FontWeight.w600)
                                            ]))),
                                onPressed: () =>
                                    controller.submitData()))
                      ],
                    )
                ),
              ))

            ) )));
  }

  Widget extraEarnings(context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(height: 16),
            SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                height: 70,
                child: Stack(children: [
                  Positioned(
                    width: MediaQuery.of(context).size.width - 60,
                    top: 15,
                    child: Container(
                        height: 8,

                        width: MediaQuery.of(context).size.width - 60,
                        decoration: BoxDecoration(
                            color: AppColors.accent,

                            borderRadius: BorderRadius.circular(100))),
                  ),
                  Positioned(
                    width: (MediaQuery.of(context).size.width - 60) * controller.totalReferred.value  / 50,
                    top: 15,
                    child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                            color: AppColors.accent,
                            gradient: controller.totalReferred >= 5? const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFA954FF),
                                  Color(0xFF5F00BF)
                                ]):null,
                            borderRadius: BorderRadius.circular(100))),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFFA954FF),
                                          Color(0xFF5F00BF)
                                        ])
                                ),
                                child: Center(
                                    child: AppText.text('5',
                                        fontWeight: FontWeight.bold))),
                            const SizedBox(height: 16),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/img/dgn-2.png',
                                      height: 14, width: 14, fit: BoxFit.contain),
                                  AppText.text(' 5',
                                      fontSize: 13, fontWeight: FontWeight.w700)
                                ])
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: AppColors.accent,
                                  gradient: controller.totalReferred >= 15? const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFA954FF),
                                        Color(0xFF5F00BF)
                                      ]):null
                                ),
                                child: Center(
                                    child: AppText.text('15',
                                        fontWeight: FontWeight.bold))),
                            const SizedBox(height: 16),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/img/dgn-2.png',
                                      height: 14, width: 14, fit: BoxFit.contain),
                                  AppText.text(' 20',
                                      fontSize: 13, fontWeight: FontWeight.w700)
                                ])
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: AppColors.accent,
                                    gradient: controller.totalReferred >= 30? const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFFA954FF),
                                          Color(0xFF5F00BF)
                                        ]):null),
                                child: Center(
                                    child: AppText.text('30',
                                        fontWeight: FontWeight.bold))),
                            const SizedBox(height: 16),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/img/dgn-2.png',
                                      height: 14, width: 14, fit: BoxFit.contain),
                                  AppText.text(' 60',
                                      fontSize: 13, fontWeight: FontWeight.w700)
                                ])
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: AppColors.accent,
                                    gradient: controller.totalReferred >= 50? const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFFA954FF),
                                          Color(0xFF5F00BF)
                                        ]):null),
                                child: Center(
                                    child: AppText.text('50',
                                        fontWeight: FontWeight.bold))),
                            const SizedBox(height: 16),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/img/dgn-2.png',
                                      height: 14, width: 14, fit: BoxFit.contain),
                                  AppText.text(' 150',
                                      fontSize: 13, fontWeight: FontWeight.w700)
                                ])
                          ],
                        ),
                      ]),
                ])),
          ],
        ));
  }


}

