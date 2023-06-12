import 'package:casual/app/providers/user_provider.dart';
import 'package:casual/widgets/clickable.dart';
import 'package:casual/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app/routes/routes.dart';
import '../app/utils/icons.dart';


class DgAppBar extends GetWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
AppBar authAppBar (String title) => AppBar(
  elevation: 0,
  backgroundColor: Colors.transparent,
  centerTitle: true,
  leading: CustomIconButton(
      height: 30,
      width: 30,
      onTap: () => Get.toNamed(DgRoutes.startPage),
      child: const Icon(DgIcons.arrowleft,size: 12,)),
  title: AppText.text(title,
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
);


Widget homeAppBar(context,) {
  final UserProvider userProvider = UserProvider();
  return FutureBuilder(

      builder: (contexts,snapshot)=>Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
            width: 43,
            height: 33,
            child: Stack(
              children: [
                Positioned(
                    width: 33,
                    top: 0,
                    right: 0,
                    child: DgClickable(child:
                    ClipRRect(borderRadius: BorderRadius.circular(20), child:
                    CommonImageView(
                        url: userProvider.dgAuthService.getAvatar(),
                        placeHolder: 'assets/img/avatars/avatar72.png',
                        height: 33,
                        width: 33),),
                      onTap: ()=>Get.toNamed(DgRoutes.authRoute(DgRoutes.profileSettingsScreen)),)),

                Positioned(
                    top: 9,
                    left: 0,
                    child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: const Color(0xFF142261),
                              strokeAlign: BorderSide.strokeAlignOutside),
                          borderRadius: BorderRadius.circular(100),
                          gradient: const LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color(0xFFFF8383),
                              Color(0xFFFF1A1A),
                            ],
                          ),
                        ),
                        child: Center(
                            child: Text("${userProvider.dgAuthService.getAuthProfile().getRank().level}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold)))))
              ],
            )),
        DgClickable(onTap: ()=>Get.toNamed(DgRoutes.authRoute(DgRoutes.userProfileScreen)), child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/ticket.png',
                  height: 18,
                ),
                const SizedBox(width: 5),
                Text("${userProvider.dgAuthService.getAuthProfile().getTicketCp}",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/img/dgn.png',
                  height: 18,
                  width: 18,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 5),
                Text("${userProvider.dgAuthService.getAuthProfile().getDgnCp}",
                    style:const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))
              ],
            )))
      ])));
}


Widget backBalanceProfileAppBar(context, UserProvider userProvider) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CustomIconButton(
            height: 30,
            width: 30,
            onTap: () => Get.back(),
            // variant: IconButtonVariant.Transparent,
            child: const Icon(DgIcons.arrowleft,size: 12, color: Colors.white,)),
        DgClickable(onTap: ()=>Get.toNamed(DgRoutes.authRoute(DgRoutes.userProfileScreen)), child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/ticket.png',
                  height: 18,
                ),
                const SizedBox(width: 5),

                Text("${userProvider.dgAuthService.getAuthProfile().getTicketCp}",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/img/dgn.png',
                  height: 18,
                  width: 18,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 5),

                const SizedBox(width: 5),
                Text("${userProvider.dgAuthService.getAuthProfile().getDgnCp ?? 0}",
                    style:const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))
              ],
            ))),
        DgClickable(onTap: ()=>Get.toNamed(DgRoutes.authRoute(DgRoutes.userProfileScreen)), child: SizedBox(
            width: 43,
            height: 33,
            child: Stack(
              children: [
                 Positioned(
                    width: 33,
                    top: 0,
                    right: 0,
                    child:ClipRRect(borderRadius: BorderRadius.circular(20), child:  CommonImageView(
                        url: userProvider.dgAuthService.getAvatar(),
                        placeHolder: 'assets/img/avatars/avatar72.png',
                        height: 33,
                        width: 33),)),
                Positioned(
                    top: 9,
                    left: 0,
                    child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: const Color(0xFF142261),
                              strokeAlign: BorderSide.strokeAlignOutside),
                          borderRadius: BorderRadius.circular(100),
                          gradient: const LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color(0xFFFF8383),
                              Color(0xFFFF1A1A),
                            ],
                          ),
                        ),
                        child:  Center(
                            child: Text("${userProvider.dgAuthService.getAuthProfile().getRank().level}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold)))))
              ],
            ))),
      ]));
}


Widget backProfileAppBar(context, UserProvider userProvider) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CustomIconButton(
            height: 30,
            width: 30,
            onTap: () => Get.back(),
            // variant: IconButtonVariant.Transparent,
            child: const Icon(DgIcons.arrowleft,size: 12, color: Colors.white,)),

        DgClickable(onTap: ()=>Get.toNamed(DgRoutes.authRoute(DgRoutes.userProfileScreen)), child: SizedBox(
            width: 43,
            height: 33,
            child: Stack(
              children: [
                 Positioned(
                    width: 33,
                    top: 0,
                    right: 0,
                    child:ClipRRect(borderRadius: BorderRadius.circular(20), child:  CommonImageView(
                        url: userProvider.dgAuthService.getAvatar(),
                        placeHolder: 'assets/img/avatars/avatar72.png',
                        height: 33,
                        width: 33),)),
                Positioned(
                    top: 9,
                    left: 0,
                    child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: const Color(0xFF142261),
                              strokeAlign: BorderSide.strokeAlignOutside),
                          borderRadius: BorderRadius.circular(100),
                          gradient: const LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color(0xFFFF8383),
                              Color(0xFFFF1A1A),
                            ],
                          ),
                        ),
                        child:  Center(
                            child: Text("${userProvider.dgAuthService.getAuthProfile().getRank().level}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold)))))
              ],
            ))),
      ]));
}


Widget referalCodeAppBar(context, ) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
       SizedBox(width: 30,),
        AppText.text("Referral",
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        CustomIconButton(
            height: 30,
            width: 30,
            onTap: () => Get.back(),
            // variant: IconButtonVariant.Transparent,
            child: const Icon(DgIcons.cancel_circle,size: 16, color: Colors.white,)),


      ]));
}
