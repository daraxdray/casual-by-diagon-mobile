import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:casual/shop/theme/theme.dart';

class TransactionResponseView extends StatefulWidget {
  const TransactionResponseView({Key? key}) : super(key: key);
  @override
  TransactionResponseState createState() => TransactionResponseState();
}

class TransactionResponseState extends State<TransactionResponseView> {
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
                    children: [
                      transactionStatus(),
                      yourOrders(),
                      const SizedBox(height: 50),
                      checkoutSummary(context)
                    ],
                  )))
        ],
      )),
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
                Navigator.pop(context);
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SvgPicture.asset('assets/svg/back_icon.svg'))),
          AppText.text('Transaction Response',
              fontSize: 16, fontWeight: FontWeight.w600),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset('assets/svg/notification_yellow.svg'))
        ],
      ),
    );
  }

  Widget transactionStatus() {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.only(left: 25, right: 25, top: 40),
      decoration: BoxDecoration(
          color: AppColors.gregDark.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText.text('Transaction Successful',
              fontSize: 17, fontWeight: FontWeight.w500),
          SvgPicture.asset('assets/svg/checked.svg')
        ],
      ),
    );
  }

  Widget yourOrders() {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 20),
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
          const SizedBox(height: 10),
          _showData ? cartItem() : Container(),
          const SizedBox(height: 10),
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
        const SizedBox(height: 20),
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
            // GestureDetector(
            //     onTap: () {},
            //     child: SvgPicture.asset('assets/svg/edit-icon.svg'))
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
            // GestureDetector(
            //     onTap: () {},
            //     child: SvgPicture.asset('assets/svg/edit-icon.svg'))
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

        // const SizedBox(height: 10),
      ],
    );
  }

  Widget checkoutSummary(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: AppButton.button(
            borderRadius: BorderRadius.circular(8),
            backgroundColor: AppColors.primary,
            widget: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              AppText.text('Go back Home',
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600)
            ]),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            }));
  }
}
