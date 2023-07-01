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
          width: MediaQuery.of(context).size.width,
          child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(

                    left: 20),
                child: AppText.text('Something Went Wrong',
                    style: AppStyle.txtInterBold25)),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20),
                child: AppText.text(Get.arguments != null && Get.arguments["message"] != null ? Get.arguments["message"]: "Issue untracked!",
                    style: AppStyle.txtInterLight18)),
            Lottie.asset('assets/loatify/no_internet.json',width: 300, height:300),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: InkWell(
                onTap: (){
                  Get.offAllNamed( DgRoutes.gameHomeScreen); },
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
                      child: AppText.text('Retry',
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),),
              )
            )

            ])));
  }

}
