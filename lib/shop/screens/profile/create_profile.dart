import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:casual/shop/theme/text_field.dart';
import 'package:casual/shop/theme/theme.dart';

import 'edit_profile.dart';

class CreateProfileView extends StatelessWidget {
  const CreateProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          children: [
            appBar(context),
            Expanded(
                child: SingleChildScrollView(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 80, bottom: 30),
                    child: Column(
                      children: [registrationComponents(context)],
                    )))
          ],
        )));
  }

  Widget appBar(context) {
    return Container(
      color: AppColors.gregDark,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SvgPicture.asset('assets/svg/back_icon.svg'))),
          AppText.text('Create Profile',
              fontSize: 16, fontWeight: FontWeight.w600),
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
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            hintTextColor: AppColors.textGrey),
        const SizedBox(height: 15),
        AppTextInput.input(
          hintText: 'Enter Password',
          maxLines: 1,
          minLines: 1,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          hintTextColor: AppColors.textGrey,
        ),
        const SizedBox(height: 10),
        note(),
        const SizedBox(height: 15),
        AppTextInput.input(
          hintText: 'Confirm Password',
          maxLines: 1,
          minLines: 1,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          hintTextColor: AppColors.textGrey,
        ),
        const SizedBox(height: 15),
        AppTextInput.input(
            hintText: 'Enter referral code',
            keyboardType: TextInputType.emailAddress,
            hintTextColor: AppColors.textGrey),
      ],
    );
  }

  Widget note() {
    return AppText.text(
        'Note: \nPassword must contain minimum of 8 characters with upper case, lower case, numbers ',
        color: AppColors.textGrey);
  }

  Widget termsAndPrivacy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppText.text('By proceeding, you agree with our',
            color: AppColors.textGrey),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                child: AppText.text('Terms & Conditions ',
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline)),
            AppText.text('and ', color: AppColors.textGrey),
            GestureDetector(
                child: AppText.text('Privacy Policy',
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline))
          ],
        )
      ],
    );
  }

  Widget newsLetterSubscription() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset('assets/svg/unchecked.svg'),
        ),
        const SizedBox(width: 15),
        Expanded(
            child: AppText.text(
                'Add me to the newsletter to receive news about new products and features.',
                color: AppColors.textGrey))
      ],
    );
  }

  Widget registrationComponents(context) {
    return Column(
      children: [
        const SizedBox(height: 23),
        formInput(),
        const SizedBox(height: 15),
        newsLetterSubscription(),
        const SizedBox(height: 15),
        AppButton.button(
            // backgroundColor: AppColors.secondary,
            widget: Center(
                child: AppText.text('Log in',
                    fontSize: 17, fontWeight: FontWeight.w600)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const EditProfileView()));
            }),
        const SizedBox(height: 15),
        termsAndPrivacy()
      ],
    );
  }
}
