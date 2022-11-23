import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:casual/widgets/index.dart';

import '../../../app/utils/validation_functions.dart';
import '../../../widgets/common_image_view.dart';
import 'controller/create_profile_controller.dart';

class CreateProfileView extends GetWidget<CreateProfileController> {
  const CreateProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: authAppBar('Create Profile'),
      body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Form(
                  // key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                              height:114.00,
                              width: 126.00,
                              margin: EdgeInsets.only(
                                  left: 106,
                                  top: 90,
                                  right: 105),
                              child: Stack(
                                  alignment: Alignment
                                      .centerLeft,
                                  children: [
                                    CustomIconButton(
                                        height: 164,
                                        width: 144,
                                        margin: EdgeInsets.only(
                                            left: 10),
                                        shape: IconButtonShape
                                            .CircleBorder47,
                                        alignment: Alignment
                                            .centerRight,
                                        child: CommonImageView(
                                            height: 350,
                                            width: 350,
                                            imagePath: Get.arguments['avatar'])),
                                  ]))),
                      const SizedBox(height: 62),
                      Padding(

                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: AppTextInput.input(
                            key: controller.fNameField,
                            onChanged: (val)=>controller.fNameField.currentState?.validate(),
                            validator: (value) {
                              if (!isText(value)) {
                                return "Please enter valid text without space";
                              }
                              return null;
                            },
                            controller: controller.firstNameCtr,
                            hintText: 'First name'),),
                      const SizedBox(height: 30),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: AppTextInput.input(
                              key: controller.lNameField,
                              onChanged: (val)=>controller.lNameField.currentState?.validate(),
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text without space";
                                }
                                return null;
                              },
                              controller: controller.lastNameCtr,
                              hintText: 'Last name')),
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
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600))),
                        onPressed: () => controller.onTapBtnNext(),
                          )),
                ]),
              )),
    ));
  }
}

