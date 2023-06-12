import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pinput/pinput.dart';

import '../../../app/utils/colors.dart';
import '../../../widgets/index.dart';
import 'controller/verify_email_controller.dart';


class OtpView extends GetWidget<VerifyEmailController> {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: authAppBar("Verification"),
      body: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                          alignment:Alignment.center,
                          child: AppText.text(
                          'Enter 6 digit Code sent to your email ',
                          color: Colors.white,
                          fontWeight: FontWeight.w500))),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Container(
                          alignment:Alignment.center,
                          child: AppText.text(
                          '${controller.authService.getAuthProfile().email}',
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                            fontSize: 16
                          ))),
                  const SizedBox(height: 30),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Pinput(
                        controller: controller.codeCtr,
                        defaultPinTheme: PinTheme(
                            width: 56,
                            height: 56,
                            textStyle:const  TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(30, 60, 87, 1),
                                fontWeight: FontWeight.w600),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                            )),
                        length: 6,
                        onCompleted: (pin) => {},
                      )),
                  Obx(() => Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                    child: Align(alignment: Alignment.center, child:  int.parse(controller.countdown.value.toString()) == 0?
                    GestureDetector(onTap: ()=>controller.sendCodeToEmail(),
                    child: AppText.text("Resend"),)  : AppText.text("Please wait for: ${controller.countdown.value}sec") ,),),),
                  const SizedBox(height: 121),
                  Obx(()=>Container(
                      width: MediaQuery.of(context).size.width,
                      // margin: const EdgeInsets.only(top: 40, bottom: 40),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppButton.button(
                          isLoading: controller.loading.value,
                          padding: const EdgeInsets.all(0),
                          backgroundColor: Colors.transparent,
                          child: Ink(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFFFF0101),
                                      Color(0xFFFF6363)
                                    ]),
                                borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                              ),
                              child: Container(
                                  constraints: BoxConstraints(
                                      minWidth:
                                      MediaQuery.of(context).size.width,
                                      minHeight: 55.0),
                                  alignment: Alignment.center,
                                  child: AppText.text('Submit',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600))),
                          onPressed: () => controller.verifyEmail()
                      )),),
                  SizedBox(height: 50,),
                  Center(child: GestureDetector(child: AppText.text('Cancel',
                      fontSize: 15,
                      fontWeight: FontWeight.w600), onTap: ()=>Get.defaultDialog(
                      title: "Cancel Verification",
                      titleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      middleText: "Do you want to cancel verification?",
                      middleTextStyle: TextStyle(fontSize: 12, color: Colors.white),
                      backgroundColor: AppColors.bluegray800Cc,
                      onConfirm: ()=>controller.logUserOut(),
                      onCancel: ()=> {})))
                ],
              ))),
    );
  }
}
