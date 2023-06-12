import 'dart:ui';

import 'package:casual/widgets/full_page_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../app/models/referrer_model.dart';
import '../../app/models/transaction_model.dart';
import '../../app/utils/index.dart';
import '../../widgets/index.dart';
import 'controller/all_referrals_controller.dart';


class AllReferralsView extends GetWidget<AllReferralsController> {
  const AllReferralsView({Key? key}) : super(key: key);

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
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(
                         padding: EdgeInsets.only(
                             top: MediaQuery.of(context).padding.top + 100,
                             left: 20),
                         child: AppText.text('My Referrals',
                             style: AppStyle.txtInterBold25)),
                     Padding(
                         padding: EdgeInsets.only(
                             top: MediaQuery.of(context).padding.top + 100,
                             left: 20,right:20),
                         child: AppText.text('${controller.totalReferred}',
                             style: AppStyle.txtInterBold17)),
                   ],
                 ),
                 Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children:[
                   Padding(
                       padding: const EdgeInsets.only(
                         left: 20,
                         bottom: 20,
                       ),
                       child: AppText.text(
                           'See everyone you have referred.',
                           color: Colors.white)),
                       Padding(
                           padding: const EdgeInsets.only(
                             left: 20,
                             bottom: 20,
                               right:20

                           ),
                           child: AppText.text(
                               'Total',
                               color: Colors.white)),
                 ]),
                     SizedBox(height: MediaQuery.of(context).size.height * 0.8,child: (controller.allReferrals.isNotEmpty && controller.lastPage == false)?
                     LazyLoadScrollView(
        onEndOfPage: controller.loadNextPage,
        isLoading: controller.lastPage,
        child:  ListView.separated(
          shrinkWrap: true,
          primary: false,
          padding: const EdgeInsets.only(bottom: 40),
          physics: const PageScrollPhysics(),
          itemCount: controller.allReferrals
              .length,
          separatorBuilder: (_, i) {
            return const SizedBox(height: 6);
          },
          itemBuilder: (_, i) {
            DgReferrerModel? model = controller.allReferrals[i];
            return gradientContainer(context,
                child: Padding(
                    padding: const EdgeInsets.only(left:20,right:30,top:0),
                    child: ListTile(
                      leading: Padding(padding: const EdgeInsets.only(top:5), child: AppText.text("${i+1}")),
                      title: AppText.text(model?.username ?? ''),
                      trailing: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CommonImageView(url:"https://www.diagon.io/images/avatars/${model?.avatar ?? 1}.png",
                              height: 37, width: 37, fit: BoxFit.cover)),
                    )),
            );
          },
        ))
                         : const SizedBox())

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

  Widget gradientContainer(context, {required Widget child, padding}) {
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
            padding:  const EdgeInsets.all(3),
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


}
