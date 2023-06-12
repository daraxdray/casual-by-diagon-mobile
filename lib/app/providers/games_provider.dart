import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../screens/leaderboard/models/leader_board_model.dart';
import '../models/app_settings_model.dart';
import '../models/games.dart';
import '../models/raffle_draw.dart';
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

  Future<AppSettingModel> getChallengeTime() async {
    Map<String,dynamic>? result =  await networkService.get(DgApiRoutes.appInfo,);
    print(result);
    return AppSettingModel.fromJson(result!);
  }


  Future<List<GameModel>> getTopGames() async {
    try {
      List<dynamic> result = await networkService.get(
          "${DgApiRoutes.topGameList}");
      return result.map((e) => GameModel.fromJson(e)).toList();
    }
    catch(e){
      return [];
    }
  }

  Future<List<RaffleDrawWinner>> getRaffleWinners() async {
    try {
      List<dynamic> result = await networkService.get(
          DgApiRoutes.raffleDraw);
      return result.map((e) => RaffleDrawWinner.fromJson(e)).toList();
    }
    catch(e){
      return [];
    }
  }

  Future<List<GameModel>> getSlideGame() async {
    try {
      List<dynamic> result = await networkService.get(
          DgApiRoutes.slideGameList);
      return result.map((e) => GameModel.fromJson(e)).toList();
    }
    catch(e){
      return [];
    }
  }

  Future<List<LeaderBoardModel>> getLeaderBoard() async {
    try {
      List<dynamic> result = await networkService.get(
          "${DgApiRoutes.leaderBoard}?limit=50");
      return result.map((e) => LeaderBoardModel.fromJson(e)).toList();
    }
    catch(e){
      return [];
    }
  }

  Future<int> getPosition() async {
    try {
      int result = await networkService.get(
          "${DgApiRoutes.position}?username=${dgAuthService.getAuthProfile().username}");
      return result;
    }
    catch(e){
      return 0;
    }
  }

  Future<GameModel?> getGameById(String id) async {
    try {
      dynamic result = await networkService.get(
          DgApiRoutes.getGameById+id);
      return GameModel.fromJson(result);
    }
    catch(e){
      // debugPrint(e.toString());
    }
  }

int? getHighscore(String gameId){
  int? highscore = dgAuthService.userData.read("${gameId}_highscore");
  return highscore;
}
}