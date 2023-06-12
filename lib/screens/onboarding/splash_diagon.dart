import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/routes/routes.dart';
import '../../app/utils/colors.dart';
import '../../app/utils/styles.dart';
import 'controller/splash_screen_controller.dart';



class SplashScreen extends GetView<SplashScreenController>{
  SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/img/splash_background.png"),fit: BoxFit.fill)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 200,top: 320),
              child: Text(
                  "lbl_casual"
                      .tr,
                  overflow:
                  TextOverflow
                      .ellipsis,
                  textAlign:
                  TextAlign
                      .left,
                  style: AppStyle
                      .txtMonumentExtendedUltrabold36
                      .copyWith(
                      letterSpacing:
                      3.60))),
            Container(
              margin: EdgeInsets.only(top:120),
            alignment: Alignment.bottomCenter,
            child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                          text: "lbl_by"
                              .tr,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 3.00)),
                    const  TextSpan(
                          text:
                          " ",
                          style:  TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 3.00)),
                      TextSpan(
                          text: "lbl_diagon"
                              .tr,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize:15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              letterSpacing: 3.00))
                    ]),
                textAlign:
                TextAlign
                    .left),
          )]
      )
    ));
  }
}




