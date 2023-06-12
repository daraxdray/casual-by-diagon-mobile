import 'package:get/get.dart';
import '../../../app/utils/styles.dart';
import '../../../app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:casual/widgets/index.dart';
import '../../../app/utils/validation_functions.dart';
import '../../../widgets/common_image_view.dart';
import '../../../widgets/full_page_loader.dart';
import 'controller/sign_up_two_controller.dart';

class SignupView extends GetWidget<SignUpTwoController>{
const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: authAppBar("Sign up"),
      body: Obx(() => DgFullScreenLoader(
      isloading: controller.loading.value,
      child:  SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(

            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 52,
                              top: 75,
                              right: 52),
                          child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .center,
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .center,
                              mainAxisSize:
                              MainAxisSize.max,
                              children: [
                                CustomIconButton(
                                    height: 80,
                                    width: 80,

                                    shape: IconButtonShape
                                        .RoundedBorder19,
                                    child: ClipRRect(borderRadius: BorderRadius.circular(60), child:CommonImageView(
                                        placeHolder: 'assets/img/avatars/avatar72.png',
                                        url:
                                        "https://www.diagon.io/images/avatars/${controller.dgAuthService.userData.read("avatar")}.png"))),
                                Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        left: 6,
                                        top: 12,
                                        bottom:
                                        11),
                                    child: Text(
                                        "${Get.arguments != null?Get.arguments['userName'] : ""}",
                                        overflow:
                                        TextOverflow
                                            .ellipsis,
                                        textAlign:
                                        TextAlign
                                            .left,
                                        style: AppStyle
                                            .txtInterSemiBold16
                                            .copyWith()))
                              ]))),
                  const SizedBox(height: 62),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextInput.input(
                        key: controller.emailField,
                          onChanged: (val)=>controller.emailField.currentState?.validate(),
                          controller: controller.emailCtr,
                          validator: (value) {
                            if (value == null ||
                                (!isValidEmail(value,
                                    isRequired: true))) {
                              return "Please enter valid email";
                            }
                            return null;
                          },
                          hintText: 'Email',
                          prefix: Padding(
                              padding: const EdgeInsets.all(10),
                              child:
                              SvgPicture.asset('assets/svg/email.svg')))),
                  const SizedBox(height: 30),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextInput.input(
                        key: controller.pwField,
                          controller:controller.passwordCtr,
                          onChanged: (val)=>controller.pwField.currentState?.validate(),
                          validator: (value) {
                            if (value == null ||
                                (!isValidPassword(value ?? "",
                                    isRequired: true))) {
                              return "Please enter valid password";
                            }
                            return null;
                          },
                          minLines: 1,
                          maxLines: 1,
                          obscureText: !controller.passVisible.value,
                          suffix: IconButton(onPressed: ()=> controller.passVisible(!controller.passVisible.value), icon: controller.passVisible.value?const Icon(Icons.visibility_off,color: AppColors.primaryColor,): const Icon(Icons.visibility,color: AppColors.primaryColor)),
                          hintText: 'Password',
                          prefix: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                  'assets/svg/password.svg')))),
                  const SizedBox(height: 10),
                 Padding(padding: EdgeInsets.only(left: 25,top: 0),
                 child: Column(children: [
                   Align(alignment: Alignment.centerLeft,
                     child: AppText.text('- Password can be at least 6 characters',
                         color: Colors.white,
                         fontSize: 11,
                         fontWeight: FontWeight.w500),),
                   Align(alignment: Alignment.centerLeft,
                       child:AppText.text('- Use letters and numbers',
                           color: Colors.white,
                           fontSize: 11,
                           fontWeight: FontWeight.w500)),
                   Align(alignment: Alignment.centerLeft,
                       child:AppText.text('- Use special characters (@#\$\%^)',
                           color: Colors.white,
                           fontSize: 11,
                           fontWeight: FontWeight.w500)),
                 ],),),
                  const SizedBox(height: 20),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextInput.input(
                          key: controller.refferedField,
                          onChanged: (val)=>controller.refferedField.currentState?.validate(),
                          controller: controller.refferedCtr,
                          validator: (value) {
                            return null;
                          },
                          hintText: 'Enter referrer code (optional)',
                          prefix: Padding(
                              padding: const EdgeInsets.all(10),
                              child:
                              SvgPicture.asset('assets/svg/referal_bonus.svg')))),
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
                                  child: AppText.text('Next',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600))),
                          onPressed: ()=> controller.signUp()
                          )),
                ],
              ),)),
      ),))
    );
  }
}
