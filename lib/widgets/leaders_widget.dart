
import 'package:casual/widgets/common_image_view.dart';
import 'package:casual/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';

import '../app/utils/colors.dart';
import '../screens/leaderboard/models/leader_board_model.dart';

class LeaderWidget extends StatelessWidget {
  final int index;
  final LeaderBoardModel leader;
  final String prize;
  const LeaderWidget({Key? key,required this.index, required this.leader, required this.prize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if(index != 1)Container(margin: EdgeInsets.only(bottom:13),child: Column(
          children: [
            Center(
                child: AppText.text('$index',
                    fontWeight: FontWeight.w400, fontSize: 16)),
            if(index == 2) CommonImageView(imagePath: "assets/img/yellow_arrow_up.png",height: 6,width: 6,),
            if(index == 3) CommonImageView(imagePath: "assets/img/red_arrow_down.png",height: 6,width: 6,)
          ],
        ),),
        if(index == 1) Container(margin: EdgeInsets.only(bottom: 20),
        child: CommonImageView(imagePath: "assets/img/crown.png",height:30,width:50,),),
        ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: CommonImageView(url: "https://www.diagon.io/images/avatars/${leader.avatar ?? 1}.png",height:index == 1?100:60,width:index == 1?100:60,fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom:8),
          child: AppText.text("${leader.username}"),
        ),
        AppText.text(leader.getChallenge,
            color: AppColors.blue,
            fontWeight: FontWeight.bold),
        Padding(
            padding: const EdgeInsets.only(top: 8, bottom:20),
            child:  Row(
              children: [
                CommonImageView(imagePath: "assets/img/cash.png",height:15,width:15,),
                const SizedBox(width:5),
                AppText.text(prize,fontWeight: FontWeight.w600),
              ],
            )),
        const Icon(CupertinoIcons.game_controller,color: Colors.white,).animate().shake(duration: Duration(seconds: 2),rotation: 0.5),
        Padding(
          padding: const EdgeInsets.only(top: 2, bottom:8),
          child: SizedBox(width:100, child:AppText.text("${leader.gamePlayed ?? ''} ",textAlign: TextAlign.center)),
        ),
      ],
    );
  }
}
