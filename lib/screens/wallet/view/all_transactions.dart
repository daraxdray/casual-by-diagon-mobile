import 'dart:ui';

import 'package:casual/widgets/full_page_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../app/models/transaction_model.dart';
import '../../../app/utils/index.dart';
import '../../../widgets/index.dart';
import '../controller/all_transactions_controller.dart';
import '../controller/wallet_controller.dart';

class AllTransactions extends GetWidget<AllTransactionsController> {
  const AllTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF000000),
        body:   SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
             child: SmartRefresher(
                 enablePullDown: true,
                 enablePullUp: false,
                 header: const MaterialClassicHeader(backgroundColor: Colors.black45,color: Colors.grey,),
                 controller: controller.refreshController,
                 onRefresh: controller.onRefresh,
                 child:  SingleChildScrollView(
            child: Stack(children: [
                  Obx(() => DgFullScreenLoader(
                   isloading: controller.isLoading.value,
                   child:  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                 Padding(
                     padding: EdgeInsets.only(
                         top: MediaQuery.of(context).padding.top + 100,
                         left: 20),
                     child: AppText.text('All Transactions',
                         style: AppStyle.txtInterBold25)),
                 Padding(
                     padding: const EdgeInsets.only(
                       left: 20,
                       bottom: 20,
                     ),
                     child: AppText.text(
                         'See all your transaction history.',
                         color: Colors.white)),
                     SizedBox(height: MediaQuery.of(context).size.height * 0.8,child: (controller.allTransactions.isNotEmpty && controller.lastPage == false)?
                     LazyLoadScrollView(
        onEndOfPage: controller.loadNextPage,
        isLoading: controller.lastPage,
        child:  ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: 40),
          physics: PageScrollPhysics(),
          itemCount: controller.allTransactions.value
              .length,
          separatorBuilder: (_, i) {
            return const SizedBox(height: 15);
          },
          itemBuilder: (_, i) {
            TransactionModel model = controller
                .allTransactions
                .value
            [i];
            return gradientContainer(context,
                child: Padding(
                    padding: EdgeInsets.only(left:20,right:30,),
                    child: transationItem(
                        title: "${model.name}",
                        icon:  model.type == "SIGNUP"? 'assets/svg/reward_icon.svg':
                        model.type =="REFERRAL"? 'assets/svg/referal_bonus.svg' : 'assets/svg/challenge_icon.svg',
                        reward: '+${model.amount}',
                        coin: model.type == "SIGNUP"? 'assets/img/dgn-2.png': 'assets/img/ticket.png')));
          },
        )): const SizedBox())

                   ]))),
              SizedBox(
                  child: ClipRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child:
                          Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).padding.top)),
                            backBalanceProfileAppBar(context,controller.userProvider),
                          ]))))
            ])))));
  }

  Widget gradientContainer(context, {required Widget child}) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF0A4E74),
                  const Color(0xFF9F00D7).withOpacity(0.5),
                  Colors.transparent
                ])),
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF020412),
                      Color(0xFF171B3A),
                    ])),
            child: child));
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
