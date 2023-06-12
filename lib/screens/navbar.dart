import 'dart:ui';

import 'package:casual/app/providers/user_provider.dart';
import 'package:casual/screens/profile/profile.dart';
import 'package:casual/screens/raffle_draw/index.dart';
import 'package:casual/screens/wallet/view/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/appbars.dart';
import 'home/home.dart';
import 'leaderboard/view/leaderboard.dart';



class NavbarView extends StatefulWidget {
  @override
  const NavbarView({Key? key}) : super(key: key);

  @override
  NavbarState createState() => NavbarState();
}

class NavbarState extends State<NavbarView> {
  int currentTabIndex = 0;
  UserProvider userProvider = UserProvider();
  List<Widget> screens = [
     HomeView(),
    ProfileView(),
     LeaderboardView(),
     RaffleDrawView(),
    WalletView(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: screens[currentTabIndex],
        bottomNavigationBar: createBottombar(context));
  }

  Container createBottombar(BuildContext context) {
    return Container(
        height: 70,
        padding: const EdgeInsets.only(left:30, right:30),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(38), topLeft: Radius.circular(38)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(240,52,55,75),
                  Color.fromARGB(240,6,9,31)
                ],

            )),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(38.0),
            topRight: Radius.circular(38.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            currentIndex: currentTabIndex,
            showUnselectedLabels: true,
            onTap: (index) {
              setState(() {
                currentTabIndex = index;
              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Column(children: [
                    Padding(padding: const EdgeInsets.only(bottom:5),child: SvgPicture.asset(
                      'assets/svg/games_icon.svg',
                      color: Colors.white.withOpacity(0.5),
                    ),),
                    Text("Games", style:TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 10))
                  ],),
                  activeIcon: Column(children: [
                    Padding(padding: const EdgeInsets.only(bottom:5),child: SvgPicture.asset(
                    'assets/svg/games_icon.svg',
                    ),),
                    Text("Games", style:TextStyle(color: Colors.white, fontSize: 10))
                  ],),
                  label: ''),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Column(children: [
                    Padding(padding: const EdgeInsets.only(bottom:3),child: SvgPicture.asset(
                      'assets/svg/person-regular.svg',
                      color: Colors.white.withOpacity(0.5),
                      height:25
                    ),),
                    Text("Profile", style:TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 10))
                  ],),
                  activeIcon: Column(children: [
                    Padding(padding: const EdgeInsets.only(bottom:5),child: SvgPicture.asset(
                      'assets/svg/person-regular.svg',
                      color: Colors.white,
                    ),),
                    const Text("Profile", style:TextStyle(color: Colors.white, fontSize: 10))
                  ],),
                  label: ''),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Column(children: [
                    Padding(padding: const EdgeInsets.only(bottom:5),child: SvgPicture.asset(
                  'assets/svg/leaderboard_icon.svg',
                      color: Colors.white.withOpacity(0.5),
                    ),),
                    Text("Leaderboard", style:TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 10))
                  ],),
                  activeIcon: Column(children: [
                    Padding(padding: const EdgeInsets.only(bottom:5),child: SvgPicture.asset(
                      'assets/svg/leaderboard_icon.svg',
                      color: Colors.white,
                    ),),
                   const Text("Leaderboard", style:TextStyle(color: Colors.white, fontSize: 10))
                  ],),
                  label: ''),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Column(children: [
                    Padding(padding: const EdgeInsets.only(bottom:5),child: SvgPicture.asset(
                      'assets/svg/raffle_draw_icon.svg',
                      color: Colors.white.withOpacity(0.5),

                    ),),
                    Text("Raffle Draw", style:TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 10))
                  ],),
                  activeIcon: Column(children: [
                    Padding(padding: const EdgeInsets.only(bottom:5),child: SvgPicture.asset(
                      'assets/svg/raffle_draw_icon.svg',
                      color: Colors.white,
                      height:25
                    ),),
                    const Text("Raffle Draw", style:TextStyle(color: Colors.white, fontSize: 10))
                  ],),
                  label: ''),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Column(children: [
                    Padding(padding: const EdgeInsets.only(bottom:5),child: SvgPicture.asset(
                      'assets/svg/wallet_icon.svg',
                      color: Colors.white.withOpacity(0.5),
                      height: 25,
                    ),),
                     Text("Wallet", style:TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 10))
                  ],),
                  activeIcon: Column(children: [
                    Padding(padding: const EdgeInsets.only(bottom:5),child: SvgPicture.asset(
                      'assets/svg/wallet_icon.svg',
                      color: Colors.white,
                      height:25
                    ),),
                    const Text("Wallet", style:TextStyle(color: Colors.white, fontSize: 10))
                  ],),
                  label: ''),

            ],
          ),
        ));
  }
}
