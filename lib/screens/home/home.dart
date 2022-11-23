import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/index.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'controller/game_home_screen_controller.dart';

class HomeView extends GetView<HomeScreenController> {
   HomeView({Key? key}) : super(key: key);
@override
HomeScreenController  controller = Get.put(HomeScreenController());

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
                  Stack(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        fit: StackFit.loose,
                        children: [
                          Obx(()=> CommonImageView(url: "${controller.componentsLoaded.value?controller.randomGame().value.image:''}",),
                          ),
                          ClipRRect(
                            // Clip it cleanly.
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 30,
                                sigmaY: 30,
                              ),
                              child: Container(),
                            ),
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                colors: [
                                  Colors.black,
                                  Colors.transparent,
                                  Colors.transparent,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              )))
                        ],
                      ),
                    ),
                   Obx(()=> Column(children: [
                     controller.componentsLoaded.value? heroImage(context, null) : heroImage(context, ShimmerShape(),),
                      TopGamesView(gameList: controller.topGameList,),
                     const SizedBox(height: 40),
                      DailyChallengeView(gameList: controller.dailyChallenge,),
                     const SizedBox(height: 40),
                     const TournamentsView(),
                     const SizedBox(height: 40),
                      AllGamesView(gameList: controller.gameList,),
                     const SizedBox(height: 40),
                     const EarnTokenView(),
                     const SizedBox(height: 60),
                   ]))
                  ])
                ]),
              ),
              SizedBox(
                  child: ClipRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).padding.top)),
                            homeAppBar(context,controller.userProvider),
                          ]))))
            ])));
  }


  Widget heroImage(context, Widget? child) {
    return CarouselSlider(
        options: CarouselOptions(
        autoPlay: true,
          viewportFraction: 1,
          autoPlayInterval: const Duration(seconds: 15),
          onPageChanged: (int index, reason){
            controller.randomInt(index);
          },
          height: MediaQuery.of(context).size.height * 0.6,
        padEnds: false,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        enlargeCenterPage: true,
    ),
    items: controller.slideGameList.map((element) => Container(
      padding: const EdgeInsets.only(left: 10,right:10),
        margin: const EdgeInsets.only( bottom: 30, top: 120),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.8,
        child: ClipRRect(borderRadius: BorderRadius.circular(10),child: child ?? CommonImageView(
          url: controller.componentsLoaded.value?element.image:'',
          // imagePath: 'assets/img/hero_image.png',
          fit: BoxFit.fill,
        ),)
    )).toList());
  }


}



