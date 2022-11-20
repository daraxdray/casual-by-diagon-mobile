import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pinput/pinput.dart';

import '../../../widgets/index.dart';
import 'controller/verify_email_controller.dart';


class OtpView extends GetWidget<VerifyEmailController> {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset('assets/svg/back_arrow.svg')),
        title: AppText.text('Sign up',
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppText.text(
                          'Enter 6 digit Code sent to your email',
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
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
                        onCompleted: (pin) => print(pin),
                      )),
                  const SizedBox(height: 121),
                  Obx(()=>Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: AppButton.button(
                            isLoading: controller.loading.value,
                          child: AppText.text('Submit',
                              fontSize: 15, fontWeight: FontWeight.w600),
                          minimumSize:
                          Size(MediaQuery.of(context).size.width - 40, 55),
                          onPressed: () => controller.verifyEmail())),)
                ],
              ))),
    );
  }
}
