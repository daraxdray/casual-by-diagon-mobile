
import 'package:flutter/material.dart';
// import 'package:casual/widgets/index.dart';
import 'package:get/get.dart';

// import '../app/models/games.dart';
import '../app/routes/routes.dart';
import '../app/utils/styles.dart';
import '../screens/game_rules/controller/game_rules_controller.dart';
import 'clickable.dart';
import '../app/models/games.dart';
import 'common_image_view.dart';

class TournamentsView extends StatelessWidget {
  List<GameModel> gameList;
   TournamentsView({Key? key, required this.gameList }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Weekly Challenge',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25))),
        const SizedBox(height: 15),
        SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                separatorBuilder: (context, index) => const SizedBox(width: 14),
                itemCount: gameList.length ?? 0,
                itemBuilder: (context, index) => GestureDetector(
    onTap: () {
    Get.delete<GameDetailsController>();
    Get.toNamed(DgRoutes.gameRulesScreen,
    preventDuplicates: false,

    arguments: {
    "gameId": gameList[index].sId,
    "image": gameList[index].image
    });
    },
                        child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CommonImageView(url : "https://diagon.io/images/tournaments/${gameList[index].title?.replaceAll(" ","_").toLowerCase()}.jpg",
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width - 20,
                            fit: BoxFit.cover),
                      ),
                      Positioned(
                          right: 20,
                          top: 16,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: Colors.white.withOpacity(0.8),
                                  foregroundColor: Colors.black,
                                  minimumSize: const Size(100, 0)),
                              onPressed: () {},
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                   Text(
                                    '${gameList[index].currencySymbol}${gameList[index].getPrize}${gameList[index].currency} Prize Pool',
                                  ),
                                  Row(
                                    children: [
                                      const Text('+',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      CommonImageView(imagePath:'assets/img/dgn.png', height: 20,width: 20,),
                                      const Text('1,000 DGN',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20))
                                    ],
                                  )
                                ],
                              ))),
                      Positioned(
                          bottom: 0,
                          child: Container(
                              width: MediaQuery.of(context).size.width - 20,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.8),
                                  borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(20))),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children:  [
                                          Text("${gameList[index].title}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17)),
                                          SizedBox(height: 8),
                                          // Text('Closed',
                                          //     style: TextStyle(
                                          //       color: Colors.white,
                                          //       fontWeight: FontWeight.bold,
                                          //     )),
                                        ]),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 8),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFEB4F47),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: const Text('LIVE',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                        const SizedBox(height: 8),
                                         Text( '${gameList[index].getPlayers} Playing',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16))
                                      ],
                                    )
                                  ])))
                    ]))))
      ],
    );
  }
}
