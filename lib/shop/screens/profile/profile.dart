import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:casual/shop/theme/text_field.dart';
import 'package:casual/shop/theme/theme.dart';

import 'create_profile.dart';

class ProfileView extends StatelessWidget {
  Function openDrawer;
  ProfileView({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBar(),
        Expanded(
            child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 80, bottom: 30),
                child: Column(
                  children: [
                    loginComponents(context)
                  ],
                )))
      ],
    );
  }

  Widget appBar() {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                openDrawer();
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SvgPicture.asset(
                    'assets/svg/menu.svg',
                    color: Colors.white,
                  ))),
          SvgPicture.asset('assets/svg/points_white.svg'),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset('assets/svg/notification_yellow.svg'))
        ],
      ),
    );
  }

  Widget formInput() {
    return Column(
      children: [
        AppTextInput.input(
            fillColor: Colors.white,
            textColor: Colors.black,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            prefix: Padding(
                padding: const EdgeInsets.only(left: 10, right: 5),
                child: SvgPicture.asset(
                  'assets/svg/mail.svg',
                  width: 10,
                )),
            hintTextColor: AppColors.textGrey),
        const SizedBox(height: 15),
        AppTextInput.input(
          fillColor: Colors.white,
          textColor: Colors.black,
          hintText: 'Password',
          maxLines: 1,
          minLines: 1,
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          prefix: Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: SvgPicture.asset(
                'assets/svg/lock.svg',
                width: 10,
              )),
          hintTextColor: AppColors.textGrey,
        ),
      ],
    );
  }

  Widget loginComponents(context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText.text('Your Points ioi ',
                fontSize: 29,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: AppColors.secondary),
            AppText.text('Awaits!',
                fontSize: 29,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
                fontStyle: FontStyle.italic),
          ],
        ),
        const SizedBox(height: 23),
        formInput(),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () {},
          child:
              AppText.text('Forgot your password', fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 25),
        AppButton.button(
            backgroundColor: AppColors.secondary,
            widget: Center(
                child: AppText.text('Log in',
                    color: AppColors.gregDark,
                    fontSize: 17,
                    fontWeight: FontWeight.w600)),
            onPressed: () {}),
        const SizedBox(height: 20),
        AppButton.button(
            borderSide: const BorderSide(color: AppColors.gregDark, width: 2),
            backgroundColor: Colors.black,
            widget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Image(
                        image: AssetImage('assets/img/google-logo.png'),
                        height: 26,
                        width: 26,
                      )),
                  AppText.text('Log in with Google',
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                  const SizedBox(width: 50)
                ]),
            onPressed: () {}),
        const SizedBox(height: 20),
        AppButton.button(
            backgroundColor: Colors.white,
            widget: Center(
                child: AppText.text('Create Account',
                    color: AppColors.gregDark,
                    fontSize: 17,
                    fontWeight: FontWeight.w600)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const CreateProfileView()));
            }),
      ],
    );
  }
}
