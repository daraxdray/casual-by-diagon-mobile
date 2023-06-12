import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../widgets/full_page_loader.dart';

import '../../app/utils/colors.dart';
import '../../app/utils/styles.dart';
import '../../widgets/index.dart';
import 'controller/high_score_controller.dart';

class HighScoreView extends GetWidget<HighScoreController> {
  const HighScoreView({Key? key}) : super(key: key);

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
                enablePullUp: false,
                header: const MaterialClassicHeader(backgroundColor: Colors.black45,color: Colors.grey,),
                controller: controller.refreshController,
                onRefresh: controller.onRefresh,
                child:  Obx(()=>DgFullScreenLoader(
            isloading: controller.isLoading.value,
            color: Colors.black,
            child:  Column(children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 100,
                        bottom: 20),
                    child: AppText.text('Total Scores',
                        style: AppStyle.txtInterBold25)),
              Expanded(child:   controller.highScoreList.isNotEmpty?
                highScores(context):
                Center(child: AppText.text("No Scores"),
              ),
                )
              ])))),
              SizedBox(
                  child: ClipRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).padding.top)),
                                backProfileAppBar(context,controller.userProvider),
                          ]))))
            ])));
  }

  Widget highScores(context) {
    return  ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 40),
      physics: PageScrollPhysics(),
      itemCount: controller.highScoreList.value
          .length,
      separatorBuilder: (_, i) {
        return const SizedBox(height: 15);
      },
      itemBuilder: (_, i) {
        var model = controller
            .highScoreList
        [i];
        return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColors.accent, borderRadius: BorderRadius.circular(10)),
            child: Row(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CommonImageView(url: model.image,
                      height: 70, width: 70, fit: BoxFit.cover)),
              const SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                AppText.text(model.game ?? '',
                    fontSize: 19, fontWeight: FontWeight.bold),
                AppText.text(model.getScore,
                    color: const Color(0xFFFFA800), fontWeight: FontWeight.w600)
              ])
            ]));
      },
    );
  }
}

Widget highScoreAppBar(context) {
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
                        child: const Center(
                            child: Text('9',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold)))))
              ],
            )),
      ]));
}


