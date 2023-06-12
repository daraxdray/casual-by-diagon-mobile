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
import 'controller/add_username_controller.dart';
// import '../../app/utils/theme.dart';


class AddUsernameView extends GetWidget<AddUsernameController> {
  const AddUsernameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: authAppBar("Create Profile"),
      body: Obx(() => DgFullScreenLoader(
      isloading: controller.loading.value,
      child:SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: controller.formKey,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller.selectedImage.value != ""? CustomIconButton(
                      onTap: ()=>controller.selectAvatar(),
                      height: 94,
                      width: 94,
                      shape: IconButtonShape
                          .CircleBorder47,
                      alignment: Alignment
                          .center,
                      child: ClipRRect(borderRadius: BorderRadius.circular(60), child:CommonImageView(
                          height: 200,
                          placeHolder: 'assets/img/avatars/avatar72.png',
                          url: "https://www.diagon.io/images/avatars/${controller
                              .selectedImage.value}.png"))):
                  DgClickable(child: SvgPicture.asset('assets/svg/add_photo.svg'),onTap: ()=> controller.selectAvatar()),
                  const SizedBox(height: 17),
                  AppText.text('Choose Avatar',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                  const SizedBox(height: 62),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppTextInput.input(
                        controller: controller.userNameCtr,
                          hintText: 'Enter username',
                          validator:  (value) {
                        if (!isTextAndNum(value)) {
                          return "Please enter valid username";
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
                      child: AppText.text('Next',
                          fontSize: 15,
                          fontWeight: FontWeight.w600))),
              onPressed: () =>controller.isUpdate? controller.updateUsername(): controller.onTapBtnNext(),
    ))]),)
    ))));
  }

}
