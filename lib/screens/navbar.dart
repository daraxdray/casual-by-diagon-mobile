import 'dart:ui';

import 'package:casual/app/providers/user_provider.dart';
import 'package:casual/screens/raffle_draw/view/raffle_draw.dart';
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
    const RaffleDrawView(),
     LeaderboardView(),
    const WalletView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          screens[currentTabIndex],
          SizedBox(
              child: ClipRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).padding.top)),
                        homeAppBar(context,userProvider),
                      ]))))
        ]),
        bottomNavigationBar: createBottombar(context));
  }

  Container createBottombar(BuildContext context) {
    return Container(
        height: 80,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(38), topLeft: Radius.circular(38)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF34374B), Color(0xFF06091F)])),
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
                  icon: SvgPicture.asset(
                    'assets/svg/games_icon.svg',
                    color: Colors.white.withOpacity(0.5),
                  ),
                  activeIcon: SvgPicture.asset('assets/svg/games_icon.svg'),
                  label: 'Games'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: SvgPicture.asset('assets/svg/raffle_draw_icon.svg',
                      color: Colors.white.withOpacity(0.5)),
                  activeIcon: SvgPicture.asset(
                      'assets/svg/raffle_draw_icon.svg',
                      color: Colors.white),
                  label: 'Raffle Draw'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: SvgPicture.asset('assets/svg/leaderboard_icon.svg',
                      color: Colors.white.withOpacity(0.5)),
                  activeIcon:
                      SvgPicture.asset('assets/svg/leaderboard_icon.svg'),
                  label: 'Leaderboard'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: SvgPicture.asset('assets/svg/wallet_icon.svg',
                      color: Colors.white.withOpacity(0.5)),
                  activeIcon: SvgPicture.asset('assets/svg/wallet_icon.svg'),
                  label: 'Wallet'),
            ],
          ),
        ));
  }
}
