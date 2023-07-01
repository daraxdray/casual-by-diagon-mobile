import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:casual/shop/theme/theme.dart';

import 'payment.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({Key? key}) : super(key: key);
  @override
  CheckoutState createState() => CheckoutState();
}

class CheckoutState extends State<CheckoutView> {
  bool _showData = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          appBar(context),
          yourOrders(),
          confirmCheckout(context),
          const SizedBox(height: 20),
          continueButton(context)
        ],
      ))),
    );
  }

  Widget appBar(context) {
    return Container(
      color: AppColors.gregDark,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SvgPicture.asset('assets/svg/back_icon.svg'))),
          AppText.text('Checkout Summary',
              fontSize: 16, fontWeight: FontWeight.w600),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset('assets/svg/notification_yellow.svg'))
        ],
      ),
    );
  }

  Widget yourOrders() {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 44),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
          color: AppColors.gregDark.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _showData = !_showData;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.text('Your Orders',
                    fontSize: 17, fontWeight: FontWeight.w600),
                SvgPicture.asset(!_showData
                    ? 'assets/svg/arrow-down-circle.svg'
                    : 'assets/svg/arrow-up-circle.svg')
              ],
            ),
          ),
          _showData ? cartItem() : Container(),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.text('Total NGN:',
                  color: AppColors.textGrey,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
              AppText.text('4,999.00', fontWeight: FontWeight.w600)
            ],
          ),
        ],
      ),
    );
  }

  Widget cartItem() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Divider(),
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

  Widget confirmCheckout(context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
          color: AppColors.gregDark.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.text('Email address for order status updates',
              color: AppColors.textGrey, fontWeight: FontWeight.w500),
          const SizedBox(height: 10),
          Container(
              alignment: Alignment.center,
              height: 60,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: TextEditingController(text: 'example@gmail.com'),
                cursorColor: Colors.white,
                style:
                    const TextStyle(color: Colors.white, fontFamily: 'Inter'),
                decoration: InputDecoration(
                  hintText: 'email address',
                  hintStyle: const TextStyle(
                      color: Color(0xFF77817B), fontFamily: 'Inter'),
                  // fillColor: AppColors.primary,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFF77817B))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFF77817B))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFF77817B))),
                ),
              )),
          const SizedBox(height: 17),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset('assets/svg/unchecked.svg'),
              ),
              const SizedBox(width: 15),
              Expanded(
                  child: AppText.text(
                      'Add me to the newsletter to receive news about new products and features.',
                      color: AppColors.textGrey))
            ],
          ),
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset('assets/svg/checked.svg'),
              ),
              const SizedBox(width: 15),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.text('I have read and agree with the POINTS',
                      color: AppColors.textGrey),
                  Row(
                    children: [
                      GestureDetector(
                          child: AppText.text('Terms & Conditions ',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline)),
                      AppText.text('and ', color: AppColors.textGrey),
                      GestureDetector(
                          child: AppText.text('Privacy Policy',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline))
                    ],
                  )
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }

  Widget continueButton(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: AppButton.button(
            borderRadius: BorderRadius.circular(8),
            backgroundColor: AppColors.primary,
            widget: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              AppText.text('Continue',
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600)
            ]),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const PaymentMethodView()));
            }));
  }
}
