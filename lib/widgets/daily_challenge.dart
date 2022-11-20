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
            child: Text('Daily Challenge',
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
                        onTap:()=> Get.toNamed(DgRoutes.authRoute(DgRoutes.gameRulesScreen), arguments:
                        {"gameId": gameList[index].sId , "image": gameList[index].image}),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CommonImageView(
                            url: gameList[index].image,
                              height: 140, width: 140, fit: BoxFit.fill),
                        ),
                         const SizedBox(height: 20,),
                         Text("${gameList[index].title}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        const SizedBox(height: 10),
                        playerIcons(context)
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
                         SizedBox(height: 50,child: ShimmerShape(),),
                        const SizedBox(height: 10),
                         SizedBox(height: 50,child: ShimmerShape(),),
                      ],
                    ))))
      ],
    );
  }

  Widget playerIcons(context) {
    return Row(children: [
      SizedBox(
          height: 18,
          width: 54,
          child: Stack(children: [
            Positioned(
                left: 30,
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                          image: AssetImage('assets/img/user_profile.png'))),
                )),
            Positioned(
                left: 15,
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                          image: AssetImage('assets/img/user_profile.png'))),
                )),
            Positioned(
                left: 0,
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                          image: AssetImage('assets/img/user_profile.png'))),
                )),
          ])),
      const Text('56', style: TextStyle(color: Colors.white))
    ]);
  }
}
