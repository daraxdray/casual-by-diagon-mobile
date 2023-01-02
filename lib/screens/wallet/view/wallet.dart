import 'dart:ui';

import 'package:casual/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../app/utils/index.dart';
import '../../../widgets/full_page_loader.dart';
import '../../../widgets/index.dart';
import '../controller/wallet_controller.dart';


class WalletView extends GetView<WalletController>{
   WalletView({Key? key}) : super(key: key);
    @override
  WalletController  controller = Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(bottom:20),
          child: Obx(()=>DgFullScreenLoader(
    isloading: controller.isLoading.value,
    color: Colors.black,
    child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const MaterialClassicHeader(backgroundColor: Colors.black45,color: Colors.grey,),
        controller: controller.refreshController,
        onRefresh: controller.onRefresh,
        child:  CustomScrollView(
            physics: const ScrollPhysics(),
            // padding: const EdgeInsets.only(bottom: 20),
            slivers:<Widget>  [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(height: 110),
                    walletBalance(context),
                    Align(alignment: Alignment.centerLeft,
                        child:Padding(
                          padding:const EdgeInsets.only(
                              left: 20,
                              top: 20
                          ),
                          child: AppText.text('Recent Transactions',
                              fontWeight: FontWeight.w600, fontSize: 25),
                        )),
                    const SizedBox(height: 20),
                  ]
                )
              ),
              controller.transactions.isNotEmpty ? SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) {
          var model = controller
              .transactions
          [index];
          return  Padding(
            padding: EdgeInsets.only(left:20,right:30,),
            child: transationItem(
                title: "${model.name}",
                icon:  model.type == "SIGNUP"? 'assets/svg/reward_icon.svg':
                model.type =="REFERRAL"? 'assets/svg/referal_bonus.svg' : 'assets/svg/challenge_icon.svg',
                reward: '+${model.amount}',
                coin: model.type == "SIGNUP"? 'assets/img/dgn-2.png': 'assets/img/ticket.png'));
        } ,
            childCount: controller.transactions.value.length,
          ),
        ) :
              SliverList(delegate: SliverChildListDelegate(
                [
                  Center(child: AppText.text("You currently have no transaction"))
                ]
              )),
              SliverList(delegate: SliverChildListDelegate(
                [
                  Center(child: GestureDetector(
                    onTap: ()=> Get.toNamed(DgRoutes.authRoute(DgRoutes.allTransactions)),
                    child: AppText.text("More"),
                  ))
                ]
              )),
            ],
          ))))),
      SizedBox(
          child: ClipRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                  child:
                  Column(mainAxisSize: MainAxisSize.min, children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top)),
                    homeAppBar(context),
                  ]))))
      ],);
  }

   // Widget transactionHistory(BuildContext context) {
   //   return Padding(
   //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
   //       child: Container(
   //         height: MediaQuery.of(context).size.height,
   //         margin: EdgeInsets.only(bottom:20),
   //         child: ListView.separated(
   //           physics: ScrollPhysics(),
   //           shrinkWrap: true,
   //           padding: const EdgeInsets.only(bottom: 40),
   //
   //           itemCount: controller.transactions.value
   //               .length,
   //           separatorBuilder: (_, i) {
   //             return  Divider(color: Colors.grey.withOpacity(0.4), thickness: 1);
   //           },
   //           itemBuilder: (_, i) {
   //             var model = controller
   //                 .transactions
   //             [i];
   //             return transationItem(
   //                 title: "${model.name}",
   //                 icon:  model.type == "SIGNUP"? 'assets/svg/reward_icon.svg':
   //                 model.type =="REFERRAL"? 'assets/svg/referal_bonus.svg' : 'assets/svg/challenge_icon.svg',
   //                 reward: '+${model.amount}',
   //                 coin: model.type == "SIGNUP"? 'assets/img/dgn-2.png': 'assets/img/ticket.png');
   //           },
   //         )
   //       ));
   // }


  Widget walletBalance(context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.red,width: 0.5),
            image: const DecorationImage(
                image: AssetImage('assets/img/wallet_bg.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              AppText.text('DGN', fontWeight: FontWeight.w800, fontSize: 34),
              GestureDetector(
                  child: SvgPicture.asset('assets/svg/info_circle.svg'))
            ]),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  Image.asset('assets/img/dgn.png',
                      height: 73, width: 73, fit: BoxFit.contain),
                  const SizedBox(width: 8),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.text('Your Balance'),
                        const SizedBox(height: 10,),
                        AppText.text("${controller.authService.getAuthProfile().getDgn ?? 0}",
                            fontWeight:  FontWeight.w800, fontSize: 34),
                        const SizedBox(height: 10,),
                        AppText.text('NGN ${controller.authService.getAuthProfile().getNgnValue}.00',
                          fontWeight:  FontWeight.w600,),

                      ])
                ],
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: const Size(48, 45)),
                  onPressed: () => controller.fetchBalance(),
                  child: SvgPicture.asset('assets/svg/reload_icon.svg'))
            ])
          ],
        ));
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
