import 'package:casual/app/utils/icons.dart';
import 'package:casual/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../app/utils/validation_functions.dart';
import '../../../widgets/common_image_view.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/full_page_loader.dart';
import 'controller/log_in_controller.dart';
import '../../../widgets/index.dart';


class LoginView extends GetWidget<LogInController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: authAppBar("Log in"),
      body: Obx(() => FullScreenLoader(
          isloading: controller.loading.value,
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: controller.loginFormKey,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextInput.input(
                          controller: controller.emailCtr,
                          key: controller.emailField,
                          hintText: 'Email',
                          onChanged: (val)=>controller.emailField.currentState?.validate(),
                          prefix: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset('assets/svg/email.svg')),
                          validator: (value) {
                            if (value == null ||
                                (!isValidEmail(value,
                                    isRequired: true))) {
                              return "Please enter valid email";
                            }
                            return null;
                          }
                      )),
                  const SizedBox(height: 30),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextInput.input(
                        key: controller.pwField,
                          onChanged: (val)=> controller.pwField.currentState?.validate(),
                          controller: controller.passwordCtr,
                          minLines: 1,
                          maxLines: 1,
                          obscureText: true,
                          validator: (value) {
                            if (value == null ||
                                (!isValidPassword(value,
                                    isRequired: true))) {
                              return "Please enter valid password";
                            }
                            return null;
                          },
                          hintText: 'Password',
                          prefix: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                  'assets/svg/password.svg')))),
                  const SizedBox(height: 30),
                    AppButton.button(

                      backgroundColor: const Color(0xFF00B2FF),
                      child: AppText.text('Log in',
                          fontSize: 15, fontWeight: FontWeight.w600),
                      minimumSize:
                      Size(MediaQuery.of(context).size.width - 40, 55),
                      onPressed: () => controller.signIn()),
                  const SizedBox(height: 15),
                  GestureDetector(
                      child: AppText.text('Forgot your password?',
                          color: Colors.white)),
                  const SizedBox(height: 30),
                  AppButton.button(
                      backgroundColor: const Color(0xFF56AB2F),
                      child: AppText.text('New user? Sign up',
                          fontSize: 15, fontWeight: FontWeight.w600),
                      minimumSize:
                      Size(MediaQuery.of(context).size.width - 40, 55),
                      onPressed: ()=> controller.onTapBtnNewusersign()),
                ],
              ),
            )),)));


  }


}