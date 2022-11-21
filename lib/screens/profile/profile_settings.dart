import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../app/routes/routes.dart';
import '../../widgets/index.dart';
import 'controller/profile_settings_controller.dart';

class ProfileSettingView extends GetView<ProfileSettingsController> {
  const ProfileSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF020412),
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width),
                        title(context),
                        generalSettings(context),
                        support(context),
                        signout(context),
                        deleteAccount(),
                      ])),
              SizedBox(
                  child: ClipRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
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
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset('assets/svg/back_arrow.svg',
                  height: 30, width: 30)),
        ]));
  }

  Widget title(context) {
    return Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 100,
            left: 20,
            bottom: 40),
        child: Column(
          children: [
            AppText.text('Profile Settings',
                fontSize: 25, fontWeight: FontWeight.bold),
          ],
        ));
  }

  Widget generalSettings(context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child:
            AppText.text('General', fontSize: 20, fontWeight: FontWeight.bold),
      ),
      gradientContainer(context,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              Image.asset(controller
                  .authService
                  .getAvatar(), height: 33, width: 33),
              const SizedBox(width: 10),
              AppText.text('Name & Avatar', fontWeight: FontWeight.w500)
            ]),
            AppButton.button(
                padding: const EdgeInsets.all(0),
                backgroundColor: Colors.transparent,
                minimumSize: const Size(0, 35),
                child: Ink(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.1, 0.8],
                          colors: [Color(0xFF43B8FA), Color(0xFF434AFA)]),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Container(
                        constraints:
                            const BoxConstraints(minWidth: 70, minHeight: 35.0),
                        alignment: Alignment.center,
                        child: AppText.text('Edit', fontSize: 15))),
                onPressed: () =>Get.toNamed(DgRoutes.authRoute(DgRoutes.editProfileScreen)))
          ])),
      gradientContainer(context,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              SvgPicture.asset('assets/svg/notification.svg'),
              const SizedBox(width: 10),
              AppText.text('Notifications', fontWeight: FontWeight.w500)
            ]),
            GestureDetector(
                child: SvgPicture.asset('assets/svg/toggle_off.svg'))
          ])),
      gradientContainer(context,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              SvgPicture.asset('assets/svg/game_sounds.svg'),
              const SizedBox(width: 10),
              AppText.text('Game Sounds', fontWeight: FontWeight.w500)
            ]),
            GestureDetector(
                child: SvgPicture.asset('assets/svg/toggle_off.svg'))
          ])),
    ]);
  }

  Widget support(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppText.text('Support', fontSize: 20, fontWeight: FontWeight.bold),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/svg/about.svg'),
                              const SizedBox(width: 10),
                              AppText.text('About Decagon',
                                  color: const Color(0xFFD4D8E9),
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                          SvgPicture.asset('assets/svg/arrow_right.svg')
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey.withOpacity(0.6), height: 30),
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/svg/help.svg'),
                              const SizedBox(width: 10),
                              AppText.text('Help & Support',
                                  color: const Color(0xFFD4D8E9),
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                          SvgPicture.asset('assets/svg/arrow_right.svg')
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey.withOpacity(0.6), height: 30),
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/svg/issues.svg'),
                              const SizedBox(width: 10),
                              AppText.text('Report Issues',
                                  color: const Color(0xFFD4D8E9),
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                          SvgPicture.asset('assets/svg/arrow_right.svg')
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey.withOpacity(0.6), height: 30),
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/svg/policy.svg'),
                              const SizedBox(width: 10),
                              AppText.text('Privacy Policy',
                                  color: const Color(0xFFD4D8E9),
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                          SvgPicture.asset('assets/svg/arrow_right.svg')
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey.withOpacity(0.6), height: 30),
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/svg/t_and_c.svg'),
                              const SizedBox(width: 10),
                              AppText.text('Terms & Conditions',
                                  color: const Color(0xFFD4D8E9),
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                          SvgPicture.asset('assets/svg/arrow_right.svg')
                        ],
                      ),
                    ),
                  ])))
        ]));
  }

  Widget gradientContainer(context, {required Widget child}) {
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
            child: child));
  }

  Widget signout(context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 30, bottom: 20),
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
                        SvgPicture.asset('assets/svg/logout.svg'),
                        const SizedBox(width: 5),
                        AppText.text('Sign out',
                            fontSize: 15, fontWeight: FontWeight.w600)
                      ],
                    ))),
            onPressed: controller.logUserOut));
  }

  Widget deleteAccount() {
    return GestureDetector(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svg/delete.svg'),
        AppText.text('Delete Account', fontWeight: FontWeight.w500)
      ],
    ));
  }
}
