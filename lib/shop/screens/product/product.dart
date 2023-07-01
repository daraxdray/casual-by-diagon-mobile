import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:casual/shop/theme/theme.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          appBar(context),
          brandImage(),
          Expanded(
              child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                enterPhoneNumber(context),
                const SizedBox(height: 20),
                enterAmount(context),
                const SizedBox(height: 20),
                selectPaymentMethod(context),
                const SizedBox(height: 15),
                infoText(),
                const SizedBox(height: 15),
                topUpButton(),
                const SizedBox(height: 15),
                addToCart(),
              ],
            ),
          ))
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
          AppText.text('MTN Airtime Top Up',
              fontSize: 16, fontWeight: FontWeight.w600),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset('assets/svg/notification_yellow.svg'))
        ],
      ),
    );
  }

  Widget brandImage() {
    return Stack(
      children: [
        Container(
          height: 60,
          color: AppColors.gregDark,
        ),
        Center(
          child: Container(
              margin: const EdgeInsets.only(top: 15),
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 10),
                  borderRadius: BorderRadius.circular(1000),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/img/mtn.png')))),
        )
      ],
    );
  }

  Widget enterPhoneNumber(context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.text('Enter Phone Number',
                color: Colors.white, fontWeight: FontWeight.w500),
            const SizedBox(height: 14),
            Row(
              children: [
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.gregDark,
                        fixedSize: const Size(100, 60),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/country_flag.svg',
                          width: 30,
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                        )
                      ],
                    )),
                Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.gregDark, width: 1.4),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8))),
                        child: const TextField(
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Inter'),
                          decoration: InputDecoration(
                              hintText: '0*** *** ****',
                              hintStyle: TextStyle(
                                  color: Color(0xFF77817B),
                                  fontFamily: 'Inter'),
                              // fillColor: AppColors.primary,
                              filled: true,
                              border: InputBorder.none),
                        ))),
              ],
            )
          ],
        ));
  }

  Widget enterAmount(context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.text('Enter Amount',
                color: Colors.white, fontWeight: FontWeight.w500),
            const SizedBox(height: 14),
            Row(
              children: [
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.gregDark,
                        fixedSize: const Size(100, 60),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText.text('NGN',
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ],
                    )),
                Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        decoration: BoxDecoration(
                            color: AppColors.gregDark,
                            border: Border.all(
                                color: AppColors.gregDark, width: 1.4),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8))),
                        child: const TextField(
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Inter'),
                          decoration: InputDecoration(
                              hintText: '50 - 50,000',
                              hintStyle: TextStyle(
                                  color: Color(0xFF77817B),
                                  fontFamily: 'Inter'),
                              // fillColor: AppColors.primary,
                              filled: true,
                              border: InputBorder.none),
                        ))),
                const SizedBox(width: 15),
                SizedBox(
                    height: 60,
                    child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: const Color(0xFF77817B)),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/svg/gift-outline.svg'),
                            const SizedBox(width: 3),
                            AppText.text('0')
                          ],
                        )))
              ],
            )
          ],
        ));
  }

  Widget selectPaymentMethod(context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.text('Select Payment Method',
                color: Colors.white, fontWeight: FontWeight.w500),
            const SizedBox(height: 14),
            Row(
              children: [
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.gregDark,
                        fixedSize: const Size(100, 60),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText.text('BTC',
                            fontSize: 18, fontWeight: FontWeight.w500),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                        )
                      ],
                    )),
                Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.gregDark, width: 1.4),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8))),
                        child: const TextField(
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Inter'),
                          decoration: InputDecoration(
                              hintText: '0.00000000',
                              hintStyle: TextStyle(
                                  color: Color(0xFF77817B),
                                  fontFamily: 'Inter'),
                              // fillColor: AppColors.primary,
                              filled: true,
                              border: InputBorder.none),
                        ))),
              ],
            )
          ],
        ));
  }

  Widget infoText() {
    return AppText.text(
        'Pay with DGN, Bitcoin, Ethereum, Binance Pay, USDT, USDC, Dogecoin, Litecoin, Dash, etc. Instant email delivery. No account required. Earn free Points using an account.',
        fontSize: 12,
        color: const Color(0xFF77817B));
  }

  Widget topUpButton() {
    return AppButton.button(
        borderRadius: BorderRadius.circular(8),
        backgroundColor: const Color(0xFFFFD600),
        widget: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          AppText.text('Top up',
              color: AppColors.gregDark,
              fontSize: 19,
              fontWeight: FontWeight.w600)
        ]),
        onPressed: () {});
  }

  Widget addToCart() {
    return AppButton.button(
        borderRadius: BorderRadius.circular(8),
        backgroundColor: AppColors.gregDark,
        widget: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          AppText.text('Add to cart',
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600)
        ]),
        onPressed: () {});
  }
}
