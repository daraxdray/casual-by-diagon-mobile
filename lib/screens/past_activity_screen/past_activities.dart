import 'dart:ui';

import 'package:casual/widgets/full_page_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../app/utils/index.dart';
import '../../widgets/index.dart';
import 'controller/past_activity_controller.dart';
import 'models/past_activity_item_model.dart';

class PastActivitiesView extends GetWidget<PastActivityController> {
  const PastActivitiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF000000),
        body: SizedBox(
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
             child:  SingleChildScrollView(
            child: Stack(children: [
               Obx(() => FullScreenLoader(
                   isloading: controller.isLoading.value,
                   child:  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                 Padding(
                     padding: EdgeInsets.only(
                         top: MediaQuery.of(context).padding.top + 100,
                         left: 20),
                     child: AppText.text('Past Activity',
                         fontWeight: FontWeight.w900, fontSize: 22)),
                 Padding(
                     padding: const EdgeInsets.only(
                       left: 20,
                       bottom: 20,
                     ),
                     child: AppText.text(
                         'Check your past records and game plays.',
                         color: Colors.white)),
                     if(controller.pastActivityList.isNotEmpty && controller.lastPage == false)LazyLoadScrollView(
                         onEndOfPage: controller.loadNextPage,
                         isLoading: controller.lastPage,
                         child:  ListView.separated(
                           shrinkWrap: true,
                           padding: const EdgeInsets.only(bottom: 40),
                           physics: PageScrollPhysics(),
                           itemCount: controller.pastActivityList.value
                               .length,
                           separatorBuilder: (_, i) {
                             return const SizedBox(height: 15);
                           },
                           itemBuilder: (_, i) {
                             PastActivityItemModel model = controller
                                 .pastActivityList
                                 .value
                             [i];
                             return gradientContainer(context,
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Row(children: [
                                       ClipRRect(
                                           borderRadius: BorderRadius.circular(10),
                                           child: CommonImageView(url: model.name,
                                               height: 40, width: 40, fit: BoxFit.cover)),
                                       const SizedBox(width: 10),
                                       Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             AppText.text(model.name ?? '',
                                                 fontSize: 15, fontWeight: FontWeight.bold),
                                             AppText.text(timeago.format(DateTime.parse('${model.date}')),
                                                 color: AppColors.muted, fontWeight: FontWeight.w600)
                                           ])
                                     ]),
                                     AppButton.button(
                                         backgroundColor: Colors.white,
                                         minimumSize: const Size(0, 0),
                                         onPressed: () {},
                                         child: Row(
                                           children: [
                                             Image.asset('assets/img/ticket.png', height: 30,width: 30,),
                                             AppText.text("${model.points}",
                                                 color: Colors.black, fontWeight: FontWeight.bold)
                                           ],
                                         ))
                                   ],
                                 ));
                           },
                         ))

                   ]))),
              SizedBox(
                  child: ClipRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                          child:
                          Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).padding.top)),
                            homeAppBar(context,controller.userProvider),
                          ]))))
            ]))));
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
            padding: const EdgeInsets.all(10),
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

  Widget activitiesAppBar(context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: MediaQuery.of(context).size.width,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
              width: 43,
              height: 33,
              child: Stack(
                children: [
                  const Positioned(
                      width: 33,
                      top: 0,
                      right: 0,
                      child: Image(
                          image: AssetImage('assets/img/user_profile.png'),
                          height: 33,
                          width: 33)),
                  Positioned(
                      top: 9,
                      left: 0,
                      child: Container(
                          width: 16,
                          height: 16,
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
              )),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(100)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/ticket.png',
                    height: 18,
                  ),
                  const Text('500',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/img/dgn.png',
                    height: 18,
                    width: 18,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 5),
                  const Text('500',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ],
              )),
        ]));
  }

}
