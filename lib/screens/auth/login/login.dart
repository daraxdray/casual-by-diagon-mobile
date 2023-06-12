import 'package:casual/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../app/routes/routes.dart';
import '../../../app/utils/validation_functions.dart';
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
      body: Obx(() => DgFullScreenLoader(
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
                          controller: controller.passwordCtr,
                          key: controller.pwField,
                          onChanged: (val)=> controller.pwField.currentState?.validate(),
                          validator: (value) {
                            if (value == null ||
                                (!isValidPassword(value ?? "",
                                    isRequired: false))) {
                              return "Please enter valid password";
                            }
                            return null;
                          },
                          hintText: 'Password',
                          obscureText: !controller.passVisible.value,
                          minLines: 1,
                          maxLines: 1,
                          suffix: IconButton(onPressed: ()=> controller.passVisible(!controller.passVisible.value), icon: controller.passVisible.value?const Icon(Icons.visibility_off,color: AppColors.primaryColor,): const Icon(Icons.visibility,color: AppColors.primaryColor)),
                          prefix: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                  'assets/svg/password.svg')))),
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
                                      Color(0xFF00B2FF),
                                      Color(0xFF0161E9)
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
                                  child: AppText.text('Log in',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600))),
                          onPressed: () => controller.signIn())),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: ()=>Get.toNamed(DgRoutes.forgotPassword),
                      child: AppText.text('Forgot your password?',
                          color: Colors.white)),
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
                                      Color(0xFF56AB2F),
                                      Color(0xFFA2DC5F)
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
                                  child: AppText.text('New user? Sign up',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600))),
                          onPressed: ()=> controller.onTapBtnNewusersign()
                          )),
                  const SizedBox(height: 30),
                  // GestureDetector(
                  //     onTap: ()=>Get.toNamed(DgRoutes.browseLink,arguments: {'url':"diagon.io"}),
                  //     child: AppText.text('UI Test?',
                  //         color: Colors.white)),
                ],
              ),
            )),)));


  }


}
