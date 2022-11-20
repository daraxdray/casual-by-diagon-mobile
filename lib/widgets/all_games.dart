import 'package:casual/app/utils/index.dart';
import 'package:casual/widgets/common_image_view.dart';
import 'package:casual/widgets/index.dart';
import 'package:casual/widgets/player_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../app/models/games.dart';
import '../app/routes/routes.dart';
import 'custom_button.dart';

class AllGamesView extends StatelessWidget {
   AllGamesView({Key? key, required this.gameList}) : super(key: key);
  List<GameModel> gameList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('All Games',
                style: AppStyle.txtInterBold25)),
        const SizedBox(height: 25),
        SizedBox(
            // height: 140,
            width: MediaQuery.of(context).size.width,
            child: gameList.isNotEmpty?ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 35),
                itemCount: gameList.length,
                itemBuilder: (context, index) => GestureDetector(
                        child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CommonImageView(url:gameList[index].image,
                              height: 83, width: 83, fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                               Text("${gameList[index].title}".capitalize!,
                                  style: AppStyle.txtInterBold20),
                              const SizedBox(
                                height: 10,
                              ),
                              playerIcons(context, "${gameList[index].players}")
                            ])),
                        // TextButton(
                        //     onPressed: () {},
                        //     style: TextButton.styleFrom(
                        //         backgroundColor: const Color(0xFF00B669)),
                        //     child: const Text('PLAY',
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontWeight: FontWeight.bold))),
                        CustomButton(
                          width: 80,
                          padding: ButtonPadding.PaddingAll11,
                          variant: ButtonVariant
                              .GradientLightgreen700Lightgreen400,
                          text: "lbl_play".tr,
                          margin: EdgeInsets.only(
                            left: 10,
                            bottom: 1,
                          ),
                          onTap: ()=>Get.toNamed(DgRoutes.authRoute(DgRoutes.gameRulesScreen),arguments:{'gameId':gameList[index].sId}),
                        ),

                      ],
                    ))):
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                separatorBuilder: (context, index) =>
                const SizedBox(height: 35),
                itemCount: 5,
                itemBuilder: (context, index) => GestureDetector(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            height: 83, width: 83,
                            child:  ShimmerShape(), ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   SizedBox(
                                     height: 70,
                                       child: ShimmerShape()),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(height: 15, child: ShimmerShape())
                                ])),
                        TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF00B669)),
                            child: const Text('PLAY',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)))
                      ],
                    )))),
        const SizedBox(height: 20),
        TextButton(
            onPressed: () {},
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset('assets/svg/circle_right.svg'),
              const SizedBox(width: 5),
              const Text('See More', style: TextStyle(color: Colors.white))
            ]))
      ],
    );
  }


}
