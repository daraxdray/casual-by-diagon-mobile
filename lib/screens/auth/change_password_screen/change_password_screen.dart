import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pinput/pinput.dart';

import '../../../app/routes/routes.dart';
import '../../../app/utils/colors.dart';
import '../../../app/utils/validation_functions.dart';
import '../../../widgets/index.dart';
import 'controller/change_password_controller.dart';


class ChangePasswordScreen extends GetWidget<ChangePasswordController> {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: authAppBar("Reset Pasword"),
      body: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Obx(()=>Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppText.text(
                          'Enter 6 digit Code sent to your email ${controller.email}',
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextInput.input(
                          key: controller.codeCtrField,
                          controller:controller.codeCtr,
                          keyboardType: TextInputType.number,
                          onChanged: (val)=>controller.codeCtrField.currentState?.validate(),
                          validator: (value) {
                            if (value == null || value.length < 6) {
                              return "Please enter valid code";
                            }
                            return null;
                          },
                          minLines: 1,
                          maxLines: 1,
                          obscureText: false,
                          hintText: 'Code',
                          prefix: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                  'assets/svg/password.svg')))),
                  const SizedBox(height: 30),

                  const SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AppText.text('Password must be at least 6 characters',
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
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
                          hintText: 'New Password',
                          obscureText: !controller.newPassVisible.value,
                          suffix: IconButton(onPressed: ()=> controller.newPassVisible(!controller.newPassVisible.value), icon: controller.newPassVisible.value?const Icon(Icons.visibility_off,color: AppColors.primaryColor,): const Icon(Icons.visibility,color: AppColors.primaryColor)),
                          prefix: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                  'assets/svg/password.svg')))),
                  const SizedBox(height: 18),

                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextInput.input(
                          key: controller.cfPwField,
                          controller:controller.confirmPasswordCtr,
                          onChanged: (val)=>controller.cfPwField.currentState?.validate(),
                          validator: (value) {
                            if (value == null ||
                                (!isValidPassword(value ?? "",
                                    isRequired: true)) || value != controller.passwordCtr.text) {
                              return "Password must be equal with new password.";
                            }
                            return null;
                          },
                          minLines: 1,
                          maxLines: 1,
                          hintText: 'Confirm Password',
                          obscureText: !controller.confirmPassVisible.value,
                          suffix: IconButton(onPressed: ()=> controller.confirmPassVisible(!controller.confirmPassVisible.value), icon: controller.confirmPassVisible.value?const Icon(Icons.visibility_off,color: AppColors.primaryColor,): const Icon(Icons.visibility,color: AppColors.primaryColor)),
                          prefix: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                  'assets/svg/password.svg')))),
                  const SizedBox(height: 51),
                  Container(
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
                          onPressed: () => controller.changePassword()
                      )),
                  SizedBox(height: 50,),
                  Center(

                    child: GestureDetector(
                        onTap: ()=>Get.offAllNamed(DgRoutes.logInScreen),
                        child: AppText.text('Proceed to login',
                            color: Colors.white)),)
                ],
              ))
          )),
    );
  }
}
