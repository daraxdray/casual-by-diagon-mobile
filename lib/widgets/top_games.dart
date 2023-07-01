import 'package:casual/app/models/games.dart';
import 'package:casual/screens/game_rules/controller/game_rules_controller.dart';
import 'package:casual/widgets/clickable.dart';
import 'package:casual/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/routes/routes.dart';
import '../app/utils/styles.dart';

class TopGamesView extends StatelessWidget {
  List<GameModel> gameList;

  TopGamesView({Key? key, required this.gameList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Top Games', style: AppStyle.txtInterBold25)),
        const SizedBox(height: 15),
        SizedBox(
            height: 156,
            width: MediaQuery.of(context).size.width,
            child: gameList.isNotEmpty
                ? ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 14),
                    itemCount: gameList.length,
                    itemBuilder: (context, index) => DgClickable(
                        onTap: () {
                          Get.delete<GameDetailsController>();
                          Get.toNamed(DgRoutes.gameRulesScreen,
    preventDuplicates: false,

    arguments: {
    "gameId": gameList[index].sId,
    "image": gameList[index].image
    });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CommonImageView(
                                url: gameList[index].image,
                                height: 140,
                                width: 140,
                                fit: BoxFit.cover),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                         // Padding(
                         //   padding: const EdgeInsets.only(left: 8),
                         //   child:  Text("${gameList[index].title?.capitalize}",
                         //       style: const TextStyle(
                         //           color: Colors.white,
                         //           fontWeight: FontWeight.w500,
                         //
                         //           fontSize: 18)),
                         // )

                        ])))
                : ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 14),
                    itemCount: 10,
                    itemBuilder: (context, index) => GestureDetector(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                              height: 140, width: 140, child: ShimmerShape()),
                        ))))
      ],
    );
  }
}
