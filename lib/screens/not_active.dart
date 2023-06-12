import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../widgets/common_image_view.dart';
import '../../../widgets/index.dart';
import '../app/routes/routes.dart';
import '../app/services/auth_service.dart';
import '../app/utils/styles.dart';
// import '../../app/utils/theme.dart';


class AccountDeactivated extends StatelessWidget {
  const AccountDeactivated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: authAppBar(""),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 20),
                child: AppText.text('Your Account is Locked!',
                    style: AppStyle.txtInterBold25)),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20,right:20),
                child: AppText.text("The system has noticed an illicit activity in your account, please contact the admin to \n re-activate your account.",
                    style: AppStyle.txtInterLight18,textAlign: TextAlign.center),),
            Lottie.asset('assets/loatify/locked-account.json',width: 300, height:300),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: InkWell(
                onTap: ()=> DgAuthService.launchURL('https://t.me/diagonio',launchMode: LaunchMode.externalApplication),
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
                      child: AppText.text('Contact Admin',
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),),
              )
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: InkWell(
                onTap: ()=> Get.toNamed(DgRoutes.logInScreen),
                  child: Container(
                      constraints: BoxConstraints(
                          minWidth:
                          MediaQuery.of(context).size.width,
                          minHeight: 55.0),
                      alignment: Alignment.center,
                      child: AppText.text('Login',
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
              )
            )

            ])));
  }

}
