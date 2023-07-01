import 'dart:ui';

// import 'package:tea_time/app/home/view/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';


import '../../theme/theme.dart';
import '../cart/cart.dart';
import '../home/index.dart';
import '../profile/index.dart';
import '../search/index.dart';

class ShopNavView extends StatefulWidget {
  const ShopNavView({Key? key}) : super(key: key);

  @override
  ShopNavState createState() => ShopNavState();
}

class ShopNavState extends State<ShopNavView> {
  int currentNavIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      drawer: Drawer(
        child: ListView(
          // padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Text('Placeholder 1'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              title: Text('Placeholder 2'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
          ],
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: currentNavIndex == 0
              ? Colors.white
              : currentNavIndex == 3
                  ? AppColors.primary
                  : Colors.black,
          // systemNavigationBarColor:
          //     context.isDarkMode ? AppColors.accent : AppColors.primary,
          // systemNavigationBarIconBrightness:
          //     context.isDarkMode ? Brightness.light : Brightness.light,
          // Status bar brightness (optional)
          // For Android (light icons)
          statusBarIconBrightness:
              currentNavIndex == 0 ? Brightness.dark : Brightness.light,
          // For iOS (light icons)
          statusBarBrightness:
              currentNavIndex == 0 ? Brightness.dark : Brightness.light,
        ),
        child: SafeArea(child: userScreens(currentNavIndex)),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildBottomNavigation() => BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          // fixedColor: Colors.black,
          currentIndex: currentNavIndex,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.navGrey,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              currentNavIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                // backgroundColor: Colors.white,
                label: 'Home',
                // activeIcon:
                //     SvgPicture.asset('assets/svg/home_icon.svg'),
                icon: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/home.svg',
                      height: 22,
                      color: currentNavIndex == 0
                          ? AppColors.primary
                          : AppColors.inactive,
                    ),
                    const SizedBox(height: 2),
                    AppText.text('Home',
                        fontSize: 10,
                        color: currentNavIndex == 0
                            ? AppColors.primary
                            : AppColors.inactive)
                  ],
                )),
            BottomNavigationBarItem(
                label: 'Search',
                // activeIcon: SvgPicture.asset(
                //   'assets/svg/explore_icon.svg',
                //   color: AppColors.primary,
                // ),
                icon: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/search.svg',
                      height: 22,
                      color: currentNavIndex == 1
                          ? AppColors.primary
                          : AppColors.inactive,
                    ),
                    const SizedBox(height: 2),
                    AppText.text('Search',
                        fontSize: 10,
                        color: currentNavIndex == 1
                            ? AppColors.primary
                            : AppColors.inactive)
                  ],
                )),
            BottomNavigationBarItem(
                label: 'Cart',
                // activeIcon: SvgPicture.asset(
                //   'assets/svg/portfolio_icon.svg',
                //   color: AppColors.primary,
                // ),
                icon: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/cart.svg',
                      height: 22,
                      color: currentNavIndex == 2
                          ? AppColors.primary
                          : AppColors.inactive,
                    ),
                    const SizedBox(height: 2),
                    AppText.text('Cart',
                        fontSize: 10,
                        color: currentNavIndex == 2
                            ? AppColors.primary
                            : AppColors.inactive)
                  ],
                )),
            BottomNavigationBarItem(
                label: 'Profile',
                // activeIcon: SvgPicture.asset(
                //   'assets/svg/wallet_icon.svg',
                //   color: AppColors.primary,
                // ),
                icon: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/profile.svg',
                      height: 22,
                      color: currentNavIndex == 3
                          ? AppColors.primary
                          : AppColors.inactive,
                    ),
                    const SizedBox(height: 2),
                    AppText.text('Profile',
                        fontSize: 10,
                        color: currentNavIndex == 3
                            ? AppColors.primary
                            : AppColors.inactive)
                  ],
                ))
          ]);
  Widget userScreens(index) {
    List<Widget> children = [
      HomeView(openDrawer: openDrawer),
      const SearchView(),
      const CartView(),
      ProfileView(openDrawer: openDrawer),
    ];
    return children[index];
  }
}
