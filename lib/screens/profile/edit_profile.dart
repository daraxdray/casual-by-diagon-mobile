import 'dart:ui';
import 'package:casual/widgets/full_page_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../app/utils/index.dart';
import '../../widgets/index.dart';
import 'controller/edit_profile_controller.dart';

class EditProfileView extends GetWidget<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF020412),
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Obx(() => FullScreenLoader(
                isloading: controller.loading.value,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width),
                              title(context),
                              editProfileImage(context),
                              updateUserinfo(context)
                            ])),
                    SizedBox(
                        child: ClipRect(
                            child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 5.0, sigmaY: 5.0),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: MediaQuery.of(context)
                                                  .padding
                                                  .top)),
                                      profileAppBar(context),
                                    ]))))
                  ],
                )))));
  }

  Widget profileAppBar(context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: MediaQuery.of(context).size.width,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset('assets/svg/back_arrow.svg',
                  height: 30, width: 30)),
        ]));
  }

  Widget title(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 100, left: 20, bottom: 40),
      child: AppText.text('Edit Profile',
          textAlign: TextAlign.center,
          fontSize: 25,
          fontWeight: FontWeight.bold),
    );
  }

  Widget editProfileImage(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: GestureDetector(
          onTap: () {},
          child: SizedBox(
              width: 141,
              height: 122,
              child: Stack(
                children: [
                  Positioned(
                      width: 122,
                      top: 0,
                      right: 0,
                      child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(controller.authService.getAvatar()),
                          height: 122,
                          width: 122)),
                  Positioned(
                      top: 42,
                      left: 0,
                      child: SvgPicture.asset('assets/svg/edit_profile.svg',
                          height: 38, width: 38))
                ],
              ))),
    );
  }

  Widget updateUserinfo(context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    AppText.text('First Name',
                        color: AppColors.mutedText,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                    const SizedBox(height: 8),
                    AppTextInput.input(
                        key: controller.fNameField,
                        onChanged: (val) =>
                            controller.fNameField.currentState!.validate(),
                        controller: controller.firstNameCtr,
                        fillColor: AppColors.accent,
                        cursorColor: Colors.white,
                        textColor: Colors.white)
                  ],
                )),
                const SizedBox(width: 20),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      const SizedBox(height: 20),
                      AppText.text('Last Name',
                          color: AppColors.mutedText,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                      const SizedBox(height: 8),
                      AppTextInput.input(
                          key: controller.lNameField,
                          onChanged: (val) =>
                              controller.lNameField.currentState!.validate(),
                          controller: controller.lastNameCtr,
                          fillColor: AppColors.accent,
                          cursorColor: Colors.white,
                          textColor: Colors.white)
                    ]))
              ]),
              const SizedBox(height: 20),
              AppText.text('Username',
                  color: AppColors.mutedText,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
              const SizedBox(height: 8),
              AppTextInput.input(
                  key: controller.uNameField,
                  onChanged: (val) =>
                      controller.uNameField.currentState!.validate(),
                  controller: controller.usernameCtr,
                  fillColor: AppColors.accent,
                  cursorColor: Colors.white,
                  textColor: Colors.white),
              saveChanges(context)
            ],
          ),
        ));
  }

  Widget saveChanges(context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 30, bottom: 20),
        child: AppButton.button(
            padding: const EdgeInsets.all(0),
            backgroundColor: Colors.transparent,
            child: Ink(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.8],
                      colors: [Color(0xFF4CE5B7), Color(0xFF2C48BB)]),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Container(
                    constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width,
                        minHeight: 55.0),
                    alignment: Alignment.center,
                    child: AppText.text('Save changes',
                        fontSize: 15, fontWeight: FontWeight.w600))),
            onPressed: ()=>controller.submitData()));
  }
}
