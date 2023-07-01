import 'package:casual/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/models/games.dart';
import '../app/routes/routes.dart';
import '../app/utils/styles.dart';
import 'clickable.dart';

class DailyChallengeView extends StatelessWidget {
  List<GameModel> gameList;

   DailyChallengeView({Key? key,required this.gameList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('More Games',
                style:  AppStyle.txtInterBold25)),
        const SizedBox(height: 15),
        SizedBox(
            height: 220,
            width: MediaQuery.of(context).size.width,
            child: gameList.isNotEmpty? ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                separatorBuilder: (context, index) => const SizedBox(width: 14),
                itemCount: gameList.length,
                itemBuilder: (context, index) => DgClickable(
                        onTap:()=> Get.toNamed(DgRoutes.gameRulesScreen, arguments:
                        {"gameId": gameList[index].sId , "image": gameList[index].image}),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CommonImageView(
                            url: gameList[index].image,
                              height: 140, width: 140, fit: BoxFit.fill),
                        ),
                         const SizedBox(height: 10,),
                         Text("${gameList[index].title}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17)),
                        const SizedBox(height: 2.5),
                        playerIcons(context, gameList[index])
                      ],
                    ))):
            ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                separatorBuilder: (context, index) => const SizedBox(width: 14),
                itemCount: 10,
                itemBuilder: (context, index) => GestureDetector(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SizedBox( height: 140, width: 140,child:  ShimmerShape()),
                        ),
                         SizedBox(height: 50,width: 50,child: ShimmerShape(),),
                        const SizedBox(height: 10),
                         SizedBox(height: 50,child: ShimmerShape(),),
                      ],
                    ))))
      ],
    );
  }
}
