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
      body: Obx(() => FullScreenLoader(
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
                                    child: CommonImageView(
                                        imagePath:
                                        controller.dgAuthService.userData.read("avatar"))),
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
                                (!isValidPassword(value,
                                    isRequired: true))) {
                              return "Please enter valid email";
                            }
                            return null;
                          },
                          minLines: 1,
                          maxLines: 1,
                          obscureText: true,
                          hintText: 'Password',
                          prefix: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                  'assets/svg/password.svg')))),
                  const SizedBox(height: 18),
                  AppText.text('Password must be at least 5 characters',
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w500),
                  const SizedBox(height: 30),
              AppButton.button(
                      child: AppText.text('Next',
                          fontSize: 15, fontWeight: FontWeight.w600),
                      minimumSize:
                      Size(MediaQuery.of(context).size.width - 40, 55),
                      onPressed: ()=> controller.signUp()),
                ],
              ),)),
      ),))
    );
  }
}
