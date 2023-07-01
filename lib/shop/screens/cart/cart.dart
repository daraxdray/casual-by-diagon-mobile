import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:casual/shop/theme/theme.dart';

import 'checkout.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          appBar(context),
          SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Column(
                children: [
                  cartItem(),
                  const SizedBox(height: 40),
                  totalEarnings(),
                  const SizedBox(height: 20),
                  pointsEarning(),
                  const SizedBox(height: 30),
                  actionButtons(context)
                ],
              ))
        ],
      ),
    );
  }

  Widget appBar(context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                // Navigator.pop(context);
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10)
                      .copyWith(top: 15),
                  child: SvgPicture.asset('assets/svg/back_icon.svg'))),
          AppText.text('Cart details',
              fontSize: 16, fontWeight: FontWeight.w600),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset('assets/svg/notification_yellow.svg'))
        ],
      ),
    );
  }

  Widget cartItem() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/img/mtn.png'))),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.text('MTN Airtime',
                        fontSize: 17, fontWeight: FontWeight.w600),
                    AppText.text('+234806 100 0000', color: AppColors.textGrey)
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset('assets/svg/close-circle.svg'),
            )
          ],
        ),
        const SizedBox(height: 17),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AppText.text('NGN ', color: AppColors.textGrey),
                AppText.text('3,000.00'),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: AppColors.gregDark),
                  borderRadius: BorderRadius.circular(100)),
              child: Row(children: [
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.gregDark,
                        padding: const EdgeInsets.all(0),
                        minimumSize: const Size(26, 26),
                        shape: const CircleBorder()),
                    onPressed: () {},
                    child: SvgPicture.asset('assets/svg/minus.svg')),
                AppText.text('1'),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.all(0),
                        minimumSize: const Size(26, 26),
                        shape: const CircleBorder()),
                    onPressed: () {},
                    child: SvgPicture.asset('assets/svg/plus.svg')),
              ]),
            )
          ],
        )
      ],
    );
  }

  Widget totalEarnings() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: AppColors.gregDark, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText.text('Total NGN:',
              color: AppColors.textGrey,
              fontSize: 17,
              fontWeight: FontWeight.w500),
          AppText.text('4,999.00', fontWeight: FontWeight.w600)
        ],
      ),
    );
  }

  Widget pointsEarning() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: AppColors.gregDark, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText.text('VIP Points to earn',
              color: AppColors.textGrey,
              fontSize: 17,
              fontWeight: FontWeight.w500),
          Row(
            children: [
              SvgPicture.asset('assets/svg/coin.svg'),
              const SizedBox(width: 5),
              AppText.text('13', fontWeight: FontWeight.w600)
            ],
          )
        ],
      ),
    );
  }

  Widget actionButtons(context) {
    return Row(
      children: [
        Expanded(
            child: AppButton.button(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(color: AppColors.gregDark, width: 2),
                backgroundColor: Colors.black,
                widget:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  AppText.text('Keep shopping',
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600)
                ]),
                onPressed: () {})),
        const SizedBox(width: 8),
        Expanded(
            child: AppButton.button(
                borderRadius: BorderRadius.circular(8),
                backgroundColor: const Color(0xFFFFD600),
                widget:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  AppText.text('Check out',
                      color: AppColors.gregDark,
                      fontSize: 15,
                      fontWeight: FontWeight.w600)
                ]),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const CheckoutView()));
                })),
      ],
    );
  }
}
