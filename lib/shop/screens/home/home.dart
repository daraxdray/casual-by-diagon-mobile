import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/theme.dart';
import '../product/index.dart';

class HomeView extends StatelessWidget {
  final Function openDrawer;
  const HomeView({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBar(),
        Expanded(
            child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(children: [
                  refillOnTheGo(context),
                  quickAirtimeTopUp(context),
                  const SizedBox(height: 80),
                  quickTopUp(context),
                  const SizedBox(height: 50),
                  const Divider(color: Color(0xFF818181)),
                  const SizedBox(height: 24),
                  recommended(context),
                  const SizedBox(height: 40),
                  howRefillWorks(context),
                  const SizedBox(height: 50),
                  const Divider(color: Color(0xFF818181)),
                  const SizedBox(height: 35),
                  exploreMore(context)
                ])))
      ],
    );
  }

  Widget appBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                openDrawer();
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SvgPicture.asset('assets/svg/menu.svg'))),
          SvgPicture.asset('assets/svg/points.svg'),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset('assets/svg/notification_red.svg'))
        ],
      ),
    );
  }

  Widget refillOnTheGo(context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.65,
      padding: const EdgeInsets.only(top: 100, bottom: 100),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.primaryDark, Colors.black])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svg/refill_on_the_go.svg'),
          const SizedBox(width: 30),
          SvgPicture.asset('assets/svg/battery.svg'),
        ],
      ),
    );
  }

  Widget quickAirtimeTopUp(context) {
    return Column(
      children: [
        AppText.text('Quick Airtime Top up',
            fontSize: 20, fontWeight: FontWeight.w600),
        const SizedBox(height: 12),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        fixedSize: const Size(60, 60),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/country_flag.svg'),
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                        )
                      ],
                    )),
                Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        color: AppColors.primary,
                        height: 60,
                        child: const TextField(
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Inter'),
                          decoration: InputDecoration(
                              hintText: 'Enter Phone Number',
                              hintStyle: TextStyle(
                                  color: Colors.white, fontFamily: 'Inter'),
                              fillColor: AppColors.primary,
                              filled: true,
                              border: InputBorder.none),
                        ))),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        fixedSize: const Size(60, 60),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)))),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.gregDark,
                    ))
              ],
            )),
        const SizedBox(height: 22),
        AppText.text(
            'Top up prepaid mobile\nphones from anywhere in\nthe world',
            color: const Color(0xFF77817B),
            fontSize: 20,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500)
      ],
    );
  }

  Widget quickTopUp(context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AppText.text('Quick Top Up',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
                const SizedBox(width: 5),
                SvgPicture.asset('assets/svg/divide.svg')
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                quickTopUpItem(context,
                    icon: SvgPicture.asset('assets/svg/mobile.svg'),
                    text: 'Airtime',
                    onPress: () {}),
                quickTopUpItem(context,
                    icon: SvgPicture.asset('assets/svg/wifi.svg'),
                    text: 'Data',
                    onPress: () {}),
                quickTopUpItem(context,
                    icon: SvgPicture.asset('assets/svg/monitor.svg'),
                    text: 'TV Subscription',
                    onPress: () {}),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                quickTopUpItem(context,
                    icon: SvgPicture.asset('assets/svg/electricity.svg'),
                    text: 'Electricity',
                    onPress: () {}),
                quickTopUpItem(context,
                    icon: SvgPicture.asset('assets/svg/betting.svg'),
                    text: 'Betting',
                    onPress: () {}),
                quickTopUpItem(context,
                    icon: SvgPicture.asset('assets/svg/airtime-to-cash.svg'),
                    text: 'Airtime to Cash',
                    onPress: () {}),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                quickTopUpItem(context,
                    icon: SvgPicture.asset('assets/svg/travel.svg'),
                    text: 'Travel',
                    onPress: () {}),
                quickTopUpItem(context,
                    icon: SvgPicture.asset('assets/svg/gift-cards.svg'),
                    text: 'Gift Cards',
                    onPress: () {}),
                quickTopUpItem(context,
                    icon: SvgPicture.asset('assets/svg/usdt-to-cash.svg'),
                    text: 'USDT to Cash',
                    onPress: () {}),
              ],
            ),
          ],
        ));
  }

  Widget quickTopUpItem(context, {required Widget icon, required String text, required Function() onPress,}) {
    return Expanded(
        child: Column(
      children: [
        TextButton(
            style: TextButton.styleFrom(
                backgroundColor: AppColors.primary,
                fixedSize: Size(MediaQuery.of(context).size.width * 0.2,
                    MediaQuery.of(context).size.width * 0.2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1000))),
            onPressed: onPress,
            child: icon),
        const SizedBox(height: 10),
        AppText.text(text,
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
      ],
    ));
  }

  Widget recommended(context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/svg/recommended.svg',
                    height: 35,
                  ),
                  const SizedBox(height: 10),
                  AppText.text('Recommended',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ],
              )),
          const SizedBox(height: 20),
          Container(
              color: AppColors.primary,
              width: MediaQuery.of(context).size.width,
              height: 240,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const ProductView()));
                          },
                          child: Container(
                            width: 115,
                            height: 155,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: index == 0
                                        ? const AssetImage(
                                            'assets/img/mtn.png')
                                        : index == 1
                                            ? const AssetImage(
                                                'assets/img/dstv.png')
                                            : index == 2
                                                ? const AssetImage(
                                                    'assets/img/airtel.png')
                                                : const AssetImage(
                                                    'assets/img/glo.png'))),
                          )),
                      const SizedBox(height: 13),
                      AppText.text(
                          index == 0
                              ? 'MTN Airtime'
                              : index == 1
                                  ? 'DSTV Subscccription'
                                  : index == 2
                                      ? 'Airtel Data'
                                      : 'Glo Data',
                          fontSize: 12,
                          fontWeight: FontWeight.w600)
                    ],
                  );
                },
                separatorBuilder: (_, i) => const SizedBox(width: 14),
              ))
        ]));
  }

  Widget howRefillWorks(context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: MediaQuery.of(context).size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppText.text('How Refill Works',
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          const SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 95,
                width: 95,
                decoration: BoxDecoration(
                    color: const Color(0xFF3A3F3C),
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                width: 46,
                child: AppText.text('1.',
                    textAlign: TextAlign.center,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.text('Enter a phone number and amount',
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  const SizedBox(height: 8),
                  AppText.text(
                      'Type in the phone number and the amount you want us to refill',
                      color: const Color(0xFF77817B))
                ],
              ))
            ],
          ),
          const SizedBox(height: 35),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 95,
                width: 95,
                decoration: BoxDecoration(
                    color: const Color(0xFF3A3F3C),
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                width: 46,
                child: AppText.text('2.',
                    textAlign: TextAlign.center,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.text('Pay with DGN or Naira',
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  const SizedBox(height: 8),
                  AppText.text('Your payment is confirmed automatically.',
                      color: const Color(0xFF77817B))
                ],
              ))
            ],
          ),
          const SizedBox(height: 35),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 95,
                width: 95,
                decoration: BoxDecoration(
                    color: const Color(0xFF3A3F3C),
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                width: 46,
                child: AppText.text('3.',
                    textAlign: TextAlign.center,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.text('Instant refill',
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  const SizedBox(height: 8),
                  AppText.text(
                      'Once your payment is confirmed you will get your refill instantly.',
                      color: const Color(0xFF77817B))
                ],
              ))
            ],
          ),
        ]));
  }

  Widget exploreMore(context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                AppText.text('Explore more',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
                const SizedBox(width: 5),
                SvgPicture.asset('assets/svg/divide.svg')
              ],
            )),
        const SizedBox(height: 14),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 240,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: index == 0
                              ? AssetImage('assets/img/diagon-token.png')
                              : AssetImage('assets/img/bitcoin-train.png'))),
                );
              },
              separatorBuilder: (_, i) => const SizedBox(width: 10),
            ))
      ],
    );
  }
}
