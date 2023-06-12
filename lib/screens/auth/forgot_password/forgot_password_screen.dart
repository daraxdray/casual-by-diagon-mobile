import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../app/routes/routes.dart';
import '../../../app/utils/validation_functions.dart';
import '../../../widgets/clickable.dart';
import '../../../widgets/common_image_view.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/full_page_loader.dart';
import '../../../widgets/index.dart';
import 'controller/forgot_password_controller.dart';
// import '../../app/utils/theme.dart';


class ForgotPasswordView extends GetWidget<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: authAppBar("Forgot Password"),
      body: Obx(() => DgFullScreenLoader(
      isloading: controller.loading.value,
      child:SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: controller.formKey,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  const SizedBox(height: 62),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextInput.input(
                        controller: controller.emailCtr,
                          hintText: 'Enter email',
                          validator:  (value) {
                        if (!isValidEmail(value)) {
                          return "Please enter valid email";
                        }
                        return null;
                      })),
                  const SizedBox(height: 30),
                  Container(
          width: MediaQuery.of(context).size.width,
          // margin: const EdgeInsets.only(top: 40, bottom: 40),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AppButton.button(
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
                      child: AppText.text('Send Reset Link',
                          fontSize: 15,
                          fontWeight: FontWeight.w600))),
              onPressed: () => controller.onTapBtnNext(),
    )),
                  const SizedBox(height: 30),

              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: ()=>Get.toNamed(DgRoutes.changePassword),
                  child: AppText.text('Proceed to enter code',
                      color: Colors.white)),)

                ]),),

    ))));
  }

}
