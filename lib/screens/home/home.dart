import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/index.dart';
import 'controller/game_home_screen_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeView extends GetView<HomeScreenController> {
   HomeView({Key? key}) : super(key: key);
@override
HomeScreenController  controller = Get.put(HomeScreenController());
   final RefreshController refreshController = RefreshController(initialRefresh: false);

   void onRefresh() async{
     // monitor network fetch
     controller.componentsLoaded(false);
     controller.gameList.clear();
     controller.slideGameList.clear();
     controller.topGameList.clear();
     controller.dailyChallenge.clear();
     controller.loadComponents();
     refreshController.refreshCompleted();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF000000),
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
                SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: const MaterialClassicHeader(backgroundColor: Colors.black45,color: Colors.grey,),
                controller: refreshController,
                onRefresh: onRefresh,
                child:
                SingleChildScrollView(
                child: Stack(children: [
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
                    controller.componentsLoaded.value?   TopGamesView(gameList: controller.topGameList,) : TopGamesView(gameList: [],),
                    const SizedBox(height: 20),
                    DailyChallengeView(gameList: controller.dailyChallenge,),
                    const SizedBox(height: 20),
                    controller.componentsLoaded.value? TournamentsView(gameList: controller.gameList.where((element) => element.tournament == true).toList(),) :TournamentsView(gameList: [],)  ,
                    const SizedBox(height: 20),
                    AllGamesView(gameList: controller.gameList,),
                    const SizedBox(height: 20),
                    EarnTokenView(),
                    const SizedBox(height: 40),

                  ]))
                ]),
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
                            homeAppBar(context),
                          ]))))
            ])));
  }


  Widget heroImage(context, Widget? child) {
    return CarouselSlider(
        options: CarouselOptions(
        autoPlay: true,
          viewportFraction: 1,
          autoPlayInterval: const Duration(seconds: 3),
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



