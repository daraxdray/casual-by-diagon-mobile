import 'package:casual/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';

import '../app/models/games.dart';

Widget playerIcons(context, GameModel game,) {
  return Row(children: [
    // SizedBox(
    //     height: 18,
    //     width: 54,
    //     child: Stack(children: [
    //       Positioned(
    //           left: 30,
    //           child: Container(
    //             height: 18,
    //             width: 18,
    //             decoration: BoxDecoration(
    //                 border: Border.all(
    //                   color: Colors.black,
    //                 ),
    //                 borderRadius: BorderRadius.circular(100),
    //                 image: const DecorationImage(
    //                     image: AssetImage(''))),
    //           )),
    //       Positioned(
    //           left: 15,
    //           child: Container(
    //             height: 18,
    //             width: 18,
    //             decoration: BoxDecoration(
    //                 border: Border.all(
    //                   color: Colors.black,
    //                 ),
    //                 borderRadius: BorderRadius.circular(100),
    //                 image: const DecorationImage(
    //                     image: AssetImage('assets/img/user_profile.png'))),
    //           )),
    //       Positioned(
    //           left: 0,
    //           child: Container(
    //             height: 18,
    //             width: 18,
    //             decoration: BoxDecoration(
    //                 border: Border.all(
    //                   color: Colors.black,
    //                 ),
    //                 borderRadius: BorderRadius.circular(100),
    //                 image: const DecorationImage(
    //                     image: AssetImage('assets/img/user_profile.png'))),
    //           )),
    //     ])),
  SizedBox(
      height: 18,
      width: 54,
    child: ImageStack(
      imageList: game.playersImage?.map((e) => DgAuthService.imageList[e]).toList() ?? [],
      imageSource: ImageSource.Asset,
      totalCount: 3, // If larger than images.length, will show extra empty circle,
      imageRadius: 16, // Radius of each images
      imageCount: 3, // Maximum number of images to be shown in stack
      imageBorderWidth: 0, // Border width around the images
      showTotalCount: false,
    ),),

    Text("${game.players}", style: const  TextStyle(color: Colors.white))
  ]);
}