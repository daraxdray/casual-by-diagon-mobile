import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../app/utils/index.dart';
import '../../../widgets/index.dart';

class RaffleDrawView extends StatelessWidget {
  const RaffleDrawView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 100, left: 20),
                child: AppText.text('Raffle Draw',
                    fontWeight: FontWeight.w900, fontSize: 22)),
            Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  bottom: 20,
                ),
                child: AppText.text('Earn massive cash rewards !!!',
                    color: Colors.white)),
            const SizedBox(height: 10),
            weeklyDraw(context),
            const SizedBox(height: 25),
            luckyDraw(context)
          ]),
          // Expanded(child: weeklyDraw(context))
        ));
  }

  Widget weeklyDraw(context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        // height: MediaQuery.of(context).size.width * 0.6,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: AssetImage('assets/img/rf-1.png'), fit: BoxFit.cover)),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        AppText.text('WEEKLY DRAW',
                            fontSize: 10, fontWeight: FontWeight.bold),
                        AppText.text('LOTTERY\nPOOL',
                            fontWeight: FontWeight.w900, fontSize: 17),
                      ]),
                  Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(children: [
                        SvgPicture.asset('assets/svg/time.svg'),
                        const SizedBox(width: 4),
                        AppText.text('22h 15m left'),
                        const SizedBox(width: 4)
                      ]))
                ]),
            const SizedBox(height: 10),
            SvgPicture.asset('assets/svg/rf_win_cash.svg'),
            const SizedBox(height: 20),
            AppText.text('Collect at least 10,000 tickets to enter the draw'),
            const SizedBox(height: 8),
            AppButton.button(
                minimumSize: const Size(double.maxFinite, 49),
                backgroundColor: const Color(0xFFDE419F),
                child: AppText.text('Join Raffle Draw',
                    fontWeight: FontWeight.bold),
                onPressed: () {})
          ],
        ));
  }

  Widget luckyDraw(context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        // height: MediaQuery.of(context).size.width * 0.6,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: AssetImage('assets/img/rf-2.png'), fit: BoxFit.cover)),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        AppText.text('LUCKY\nDRAW',
                            fontSize: 10, fontWeight: FontWeight.bold),
                        // AppText.text('LOTTERY\nPOOL',
                        //     fontWeight: FontWeight.w900, fontSize: 17),
                      ]),
                  Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(children: [
                        SvgPicture.asset('assets/svg/time.svg'),
                        const SizedBox(width: 4),
                        AppText.text('2 Days left'),
                        const SizedBox(width: 4)
                      ]))
                ]),
            const SizedBox(height: 20),
            SvgPicture.asset('assets/svg/rf_win_ticket.svg'),
            const SizedBox(height: 20),
            AppText.text('Collect at least 5,000 tickets to enter the draw'),
            const SizedBox(height: 8),
            AppButton.button(
                minimumSize: const Size(double.maxFinite, 49),
                backgroundColor: const Color(0xFFFFAD31),
                child: AppText.text('Join Raffle Draw',
                    fontWeight: FontWeight.w600),
                onPressed: () {})
          ],
        ));
  }
}
