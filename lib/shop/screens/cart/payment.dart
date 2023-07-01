import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:casual/shop/theme/theme.dart';

import 'checkout_payment.dart';

class PaymentMethodView extends StatefulWidget {
  const PaymentMethodView({Key? key}) : super(key: key);
  @override
  PaymentMethodState createState() => PaymentMethodState();
}

class PaymentMethodState extends State<PaymentMethodView> {
  bool _showData = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          appBar(context),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(children: [
            yourOrders(),
            loginUser(context),
            const SizedBox(height: 30),
            preferedPayementMethod()
          ])))
        ],
      )),
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
          AppText.text('Payment Method',
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

  Widget loginUser(context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: AppColors.gregDark.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            RichText(
              text: const TextSpan(
                text: '',
                style: TextStyle(
                  fontFamily: 'Inter',
                ),
                children: [
                  TextSpan(
                    text: 'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: ' or ',
                  ),
                  TextSpan(
                    text: 'Create ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text:
                        'an account to pay with your account balance, receive rewards, and more!',
                    style: TextStyle(color: AppColors.textGrey),
                  )
                ],
              ),
            ),
          ])
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
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (_) => const CheckoutView()));
            }));
  }

  Widget preferedPayementMethod() {
    return Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.text('Choose Preferred Payment Method',
                fontSize: 17, fontWeight: FontWeight.w600),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return AppButton.button(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 14),
                    borderRadius: BorderRadius.circular(10),
                    backgroundColor: AppColors.gregDark.withOpacity(0.5),
                    widget: Row(children: [
                      Image(
                        image: AssetImage('${mockData[index]['logo']}'),
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.text('${mockData[index]['name']}'),
                          Row(
                            children: [
                              AppText.text('${mockData[index]['price']}',
                                  fontSize: 17, fontWeight: FontWeight.w600),
                              AppText.text('${mockData[index]['symbol']}',
                                  fontSize: 17, fontWeight: FontWeight.w600)
                            ],
                          )
                        ],
                      )
                    ]),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CheckoutPaymentView()));
                    });
              },
              itemCount: mockData.length,
              separatorBuilder: (_, i) => SizedBox(height: 10),
            )
          ],
        ));
  }
}

const mockData = [
  {
    'logo': 'assets/img/btc-logo.png',
    'name': 'Bitcoin',
    'price': '0.00545',
    'symbol': 'BTC',
  },
  {
    'logo': 'assets/img/ethereum-logo.png',
    'name': 'Ethereum',
    'price': '0.00515',
    'symbol': 'Eth',
  },
  {
    'logo': 'assets/img/diagon-token-logo.png',
    'name': 'Diagon Token',
    'price': '40',
    'symbol': 'DGN',
  },
  {
    'logo': 'assets/img/binance-pay-logo.png',
    'name': 'Binance Pay',
    'price': '\$0.40',
    'symbol': '',
  }
];
