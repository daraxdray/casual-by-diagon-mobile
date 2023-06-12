import 'package:casual/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app/services/auth_service.dart';
import '../app/utils/index.dart';

class InfoBox extends StatelessWidget {
  final String message, title;
  const InfoBox({Key? key, required this.message, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ()=> infoSnack("INFO!!!", "Double tap on the alert box to visit the website"),
      onDoubleTap: ()=>DgAuthService.launchURL('https://www.diagon.io',launchMode: LaunchMode.externalApplication),
      child: Container(
        color:  AppColors.bluegray800Cc,
        width: MediaQuery.of(context).size.width * 0.9,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              width: 50,
              height:50,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius:  BorderRadius.all( Radius.circular(90)),
                color:Colors.red,
              ),
              child: SvgPicture.asset('assets/svg/notification_bell.svg', height: 6, width: 6),
            ),
            const SizedBox(width:15),
            Expanded(
              child:  Container(
                width:80,
                alignment: Alignment.topLeft,
                child:  Text.rich(TextSpan(text:"$title ",style: AppStyle.txtInterSemiBold13, children:[
                  TextSpan(text:message, style: AppStyle.txtInterRegular13Bluegray400.copyWith(color:Colors.white))
                ])),
              ),
            )

          ],
        ),
      ),
    );
  }
}
