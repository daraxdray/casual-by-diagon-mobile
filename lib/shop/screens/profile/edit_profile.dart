import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:casual/shop/theme/text_field.dart';
import 'package:casual/shop/theme/theme.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 80, bottom: 30),
                child: Column(
                  children: [userImage(), profileComponents()],
                ))));
  }

  Widget userImage() {
    return GestureDetector(
        child: SizedBox(
      width: 130,
      height: 110,
      child: Stack(children: [
        const Positioned(
            right: 0,
            top: 0,
            child: Image(
              image: AssetImage('assets/img/profile_placeholder.png'),
              height: 110,
              width: 110,
            )),
        Positioned(
            left: 0,
            top: 35,
            child: SvgPicture.asset('assets/svg/edit-profile.svg'))
      ]),
    ));
  }

  Widget formInput() {
    return Column(
      children: [
        AppTextInput.input(
          labelText: 'First name',
          keyboardType: TextInputType.visiblePassword,
          hintTextColor: AppColors.textGrey,
        ),
        const SizedBox(height: 15),
        AppTextInput.input(
          labelText: 'Last name',
          keyboardType: TextInputType.visiblePassword,
          hintTextColor: AppColors.textGrey,
        ),
        const SizedBox(height: 15),
        AppTextInput.input(
          labelText: 'Phone number',
          keyboardType: TextInputType.visiblePassword,
          hintTextColor: AppColors.textGrey,
        ),
        const SizedBox(height: 15),
        AppTextInput.input(
            labelText: 'Email',
            keyboardType: TextInputType.emailAddress,
            hintTextColor: AppColors.textGrey),
        const SizedBox(height: 15)
      ],
    );
  }

  Widget profileComponents() {
    return Column(
      children: [
        const SizedBox(height: 23),
        formInput(),
        const SizedBox(height: 40),
        AppButton.button(
            // backgroundColor: AppColors.secondary,
            widget: Center(
                child: AppText.text('Save changes',
                    fontSize: 17, fontWeight: FontWeight.w600)),
            onPressed: () {}),
      ],
    );
  }
}
