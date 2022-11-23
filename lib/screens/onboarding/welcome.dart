import 'package:casual/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../auth/add_username/add_username.dart';
import '../auth/login/login.dart';
import '../../widgets/index.dart';
import '../../widgets/index.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              // gradient: Lfin
                image: DecorationImage(
                    image: AssetImage('assets/img/Login.png'), fit: BoxFit.cover)),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top + 120),
                        child: SvgPicture.asset('assets/svg/casual_text.svg')),
                    Column(
                      children: [
                        // AppButton.button(
                        //     child: AppText.text('Create Account',
                        //         color: Colors.black,
                        //         fontWeight: FontWeight.w600,
                        //         fontSize: 15),
                        //     onPressed: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: ((context) => AddUsernameView())));
                        //     },
                        //     minimumSize:
                        //         Size(MediaQuery.of(context).size.width * 0.8, 55),
                        //     backgroundColor: Colors.white),
                        const SizedBox(height: 15),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: AppButton.button(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 17),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/svg/email_filled.svg',
                                          color: Colors.white,
                                          width: 24),
                                      AppText.text('Login with Email',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                      const SizedBox(width: 24),
                                    ]),
                                onPressed: () => Get.toNamed(DgRoutes.logInScreen),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.8, 55),
                                backgroundColor: Colors.white.withOpacity(0.4),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.5))),
                        const SizedBox(height: 23),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: AppText.text(
                                'By continuing, you agree that you are 18+ years old and you accept our Terms & Conditions and Privacy Policy',
                                textAlign: TextAlign.center,
                                fontSize: 11,
                                color: Colors.grey)),
                        const SizedBox(height: 50),
                      ],
                    )
                  ]))
        ]));
  }
}
