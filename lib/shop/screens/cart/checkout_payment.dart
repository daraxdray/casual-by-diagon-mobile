import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:casual/shop/theme/theme.dart';

import 'transaction_response.dart';

class CheckoutPaymentView extends StatefulWidget {
  const CheckoutPaymentView({Key? key}) : super(key: key);
  @override
  CheckoutPaymentState createState() => CheckoutPaymentState();
}

class CheckoutPaymentState extends State<CheckoutPaymentView> {
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
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    children: [yourOrders(), paymentInformation()],
                  )))
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
          AppText.text('Checkout Payment',
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
              AppText.text('Total BTC:',
                  color: AppColors.textGrey,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
              AppText.text('0.00563', fontWeight: FontWeight.w600)
            ],
          ),
        ],
      ),
    );
  }

  Widget cartItem() {
    return Column(
      children: [
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.text('Email Address',
                    color: AppColors.textGrey, fontWeight: FontWeight.w500),
                const SizedBox(height: 5),
                AppText.text('example@gmail.com', fontWeight: FontWeight.w500),
              ],
            ),
            GestureDetector(
                onTap: () {},
                child: SvgPicture.asset('assets/svg/edit-icon.svg'))
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.text('Payment Method',
                    color: AppColors.textGrey, fontWeight: FontWeight.w500),
                const SizedBox(height: 5),
                AppText.text('Bitcoin', fontWeight: FontWeight.w500),
              ],
            ),
            GestureDetector(
                onTap: () {},
                child: SvgPicture.asset('assets/svg/edit-icon.svg'))
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.text('Transaction id',
                    color: AppColors.textGrey, fontWeight: FontWeight.w500),
                const SizedBox(height: 5),
                AppText.text('dg1732vb-f821-9337-89220192c0a1',
                    fontWeight: FontWeight.w500),
              ],
            ),
            // GestureDetector(
            //     onTap: () {},
            //     child: SvgPicture.asset('assets/svg/edit-icon.svg'))
          ],
        ),
        const SizedBox(height: 20),
        Divider(
          color: Colors.white.withOpacity(0.3),
        ),
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
                    AppText.text('+234806 100 0000', color: AppColors.textGrey),
                    AppText.text('NGN 3,000', color: AppColors.textGrey)
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText.text('0.00040', fontWeight: FontWeight.w600),
                AppText.text('BTC',
                    color: AppColors.textGrey, fontWeight: FontWeight.w600)
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Divider(
          color: Colors.white.withOpacity(0.3),
        ),
        // const SizedBox(height: 10),
      ],
    );
  }

  Widget paymentInformation() {
    return Container(
        margin: const EdgeInsets.only(left: 25, right: 25, top: 44),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            color: AppColors.gregDark.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        child: Column(children: [
          Row(
            children: [
              const Image(
                  image: AssetImage('assets/img/btc-logo.png'),
                  height: 33,
                  width: 33),
              const SizedBox(width: 10),
              AppText.text('Pay with Bitcoin',
                  fontSize: 17, fontWeight: FontWeight.w700)
            ],
          ),
          const SizedBox(height: 30),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Image(
                image: AssetImage('assets/img/btc-qrcode.png'),
              )),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.text('Send Bitcoin to this address',
                      color: AppColors.textGrey),
                  const SizedBox(height: 5),
                  AppText.text('3DLRr95KBmbsBAG2L1mowQcuWsPot1zz2w',
                      fontWeight: FontWeight.w600)
                ],
              )),
              const SizedBox(width: 30),
              TextButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shape: const StadiumBorder(),
                      backgroundColor: AppColors.gregDark),
                  onPressed: () {},
                  child: AppText.text('Copy'))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.text('Send Bitcoin to this address',
                      color: AppColors.textGrey),
                  const SizedBox(height: 5),
                  AppText.text('3DLRr95KBmbsBAG2L1mowQcuWsPot1zz2w',
                      fontWeight: FontWeight.w600)
                ],
              )),
              const SizedBox(width: 30),
              TextButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shape: const StadiumBorder(),
                      backgroundColor: AppColors.gregDark),
                  onPressed: () {},
                  child: AppText.text('Copy'))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.text('Expires in', fontWeight: FontWeight.w600),
              Row(
                children: [
                  SvgPicture.asset('assets/svg/time-icon.svg'),
                  const SizedBox(width: 5),
                  AppText.text('11:23')
                ],
              )
            ],
          ),
          const SizedBox(height: 30),
          Divider(
            color: Colors.white.withOpacity(0.3),
          ),
          const SizedBox(height: 20),
          TextButton(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: const StadiumBorder(),
                  minimumSize: const Size(100, 65),
                  backgroundColor: AppColors.gregDark),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const TransactionResponseView()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.text('Open Wallet', fontWeight: FontWeight.w500)
                ],
              ))
        ]));
  }
}
