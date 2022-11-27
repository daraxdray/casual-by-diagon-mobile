import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../app/utils/index.dart';
import '../../../widgets/index.dart';

class WalletView extends StatelessWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 100),
      child: Column(children: [
        const SizedBox(height: 140),
        walletBalance(context),
        const SizedBox(height: 33),
        transactionHistory()
      ]),
    ));
  }

  Widget walletBalance(context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: AssetImage('assets/img/wallet_bg.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              AppText.text('DGN', fontWeight: FontWeight.w900, fontSize: 30),
              GestureDetector(
                  child: SvgPicture.asset('assets/svg/info_circle.svg'))
            ]),
            const SizedBox(height: 50),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  Image.asset('assets/img/dgn-2.png',
                      height: 58, width: 58, fit: BoxFit.contain),
                  const SizedBox(width: 8),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.text('Balance'),
                        AppText.text('5,000',
                            fontWeight: FontWeight.w900, fontSize: 30),
                      ])
                ],
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: const Size(48, 45)),
                  onPressed: () {},
                  child: SvgPicture.asset('assets/svg/reload_icon.svg'))
            ])
          ],
        ));
  }

  Widget transactionHistory() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppText.text('Transaction History',
              fontWeight: FontWeight.w600, fontSize: 25),
          const SizedBox(height: 40),
          transationItem(
              title: 'Daily Reward',
              icon: 'assets/svg/reward_icon.svg',
              reward: '+50',
              coin: 'assets/img/ticket.png'),
          Divider(color: Colors.grey.withOpacity(0.2), thickness: 1),
          transationItem(
              title: '1 Vs 1 challenge',
              icon: 'assets/svg/challenge_icon.svg',
              reward: '+50',
              coin: 'assets/img/ticket.png'),
          Divider(color: Colors.grey.withOpacity(0.2), thickness: 1),
          transationItem(
              title: 'Tournament',
              icon: 'assets/svg/challenge_icon.svg',
              reward: '+50',
              coin: 'assets/img/ticket.png'),
          Divider(color: Colors.grey.withOpacity(0.2), thickness: 1),
          transationItem(
              title: 'Referral Bonus',
              icon: 'assets/svg/referal_bonus.svg',
              reward: '+50',
              coin: 'assets/img/dgn-2.png'),
        ]));
  }

  Widget transationItem(
      {required String icon,
      required String title,
      required String reward,
      required String coin}) {
    return GestureDetector(
        onTap: () {},
        child: Container(
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    SvgPicture.asset(icon, height: 30, width: 30),
                    const SizedBox(width: 8),
                    AppText.text(title, fontWeight: FontWeight.w500)
                  ]),
                  Row(
                    children: [
                      AppText.text(reward,
                          fontSize: 15, fontWeight: FontWeight.w600),
                      const SizedBox(width: 3),
                      Image.asset(coin, height: 24, width: 24)
                    ],
                  )
                ])));
  }
}
