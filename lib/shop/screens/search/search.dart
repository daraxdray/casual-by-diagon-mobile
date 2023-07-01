import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:casual/shop/theme/text_field.dart';

import '../../theme/theme.dart';
import '../product/product.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchWidget(),
        Expanded(
            child: SingleChildScrollView(
                child: Column(
          children: [
            searchResults(context),
            const SizedBox(height: 20),
            topSearch(context)
          ],
        )))
      ],
    );
  }
}

Widget searchWidget() {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                // Navigator.pop(context);
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10)
                      .copyWith(top: 15),
                  child: SvgPicture.asset('assets/svg/back_icon.svg'))),
          const SizedBox(width: 15),
          Expanded(
              child: SizedBox(
                  height: 60,
                  child: Stack(
                    children: [
                      Align(
                          child: Container(
                        height: 38,
                        decoration: BoxDecoration(
                            color: AppColors.inputDark,
                            borderRadius: BorderRadius.circular(100)),
                      )),
                      AppTextInput.input(
                          borderRadius: 100,
                          fillColor: Colors.transparent,
                          hintText: 'Search',
                          prefix: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 20),
                              child: SvgPicture.asset(
                                'assets/svg/search-2.svg',
                                height: 18,
                              )))
                    ],
                  )))
        ],
      ));
}

Widget searchResults(context) {
  return Container(
      color: AppColors.primary,
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 20),
          child: AppText.text('3 results found'),
        ),
        Container(
            color: AppColors.primary,
            width: MediaQuery.of(context).size.width,
            height: 240,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              physics: const BouncingScrollPhysics(),
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
                          width: 155,
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

Widget topSearch(context) {
  return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/svg/verified.svg',
                  height: 35,
                ),
                const SizedBox(height: 10),
                AppText.text('Top Searched Products',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ],
            )),
        const SizedBox(height: 20),
        Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: 200,
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
