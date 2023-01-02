import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../widgets/common_image_view.dart';
import '../../../widgets/index.dart';
import '../app/routes/routes.dart';
import '../app/utils/styles.dart';
// import '../../app/utils/theme.dart';


class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: authAppBar(""),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
          child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(

                    left: 20),
                child: AppText.text('Internet Failure',
                    style: AppStyle.txtInterBold25)),
            Lottie.asset('assets/loatify/no_internet.json'),
            InkWell(
              onTap: ()=>Get.offAllNamed(Get.arguments ?? DgRoutes.gameHomeScreen),
                child: Padding(
                padding: EdgeInsets.only(

                    left: 20),
                child: AppText.text('Retry',
                    style: AppStyle.txtInterRegular15)),)
            ])));
  }

}
