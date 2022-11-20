import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/games.dart';
import '../routes/api_routes.dart';
import '../services/auth_service.dart';
import '../utils/diagon_net.dart';


class GameProvider extends GetConnect{
  DiagonNet  networkService = DiagonNet();
  final dgAuthService = Get.find<DgAuthService>();


  Future<List<GameModel>> getGames() async {
    try {
      List<dynamic> result = await networkService.get(
          DgApiRoutes.getGameList);
      return result.map((e) => GameModel.fromJson(e)).toList();
    }
    catch(e){
      return [];
    }
  }

  // Future<List<LeaderBoardModel>> getLeaderBoard() async {
  //   try {
  //     List<dynamic> result = await networkService.get(
  //         DgApiRoutes.leaderBoard);
  //     return result.map((e) => LeaderBoardModel.fromJson(e)).toList();
  //   }
  //   catch(e){
  //     return [];
  //   }
  // }

  Future<GameModel?> getGameById(String id) async {
    try {
      dynamic result = await networkService.get(
          DgApiRoutes.getGameById+id);
      debugPrint(result.toString());
      return GameModel.fromJson(result);
    }
    catch(e){
      debugPrint(e.toString());
    }
  }

int? getHighscore(String gameId){
  int? highscore = dgAuthService.userData.read("${gameId}_highscore");
  return highscore;
}
}