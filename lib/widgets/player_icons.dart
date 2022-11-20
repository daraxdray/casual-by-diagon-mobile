import 'package:flutter/material.dart';

Widget playerIcons(context, String players) {
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
    Text(players, style: const  TextStyle(color: Colors.white))
  ]);
}