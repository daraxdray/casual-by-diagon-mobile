import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../routes/routes.dart';
import '../services/auth_service.dart';

class AuthGuard extends GetMiddleware {
//   Get the auth service
  final dgAuthService = Get.find<DgAuthService>();

//   The default is 0 but you can update it to any number. Please ensure you match the priority based
//   on the number of guards you have.
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    // Navigate to login if client is not authenticated other wise continue
    if (dgAuthService.isAuthenticated() == false) return RouteSettings(name: DgRoutes.logInScreen);
    if (dgAuthService.hasUsername() == false) return RouteSettings(name: DgRoutes.addUsername,arguments: "update");
    if (dgAuthService.isVerified() == false)return RouteSettings(name: DgRoutes.verifyEmail);
    if(dgAuthService.getAuthProfile().active == null  || dgAuthService.getAuthProfile().active == false)return RouteSettings(name:DgRoutes.accountDeactivated);

    return null;
  }
  //
  //
  // @override
  // GetPage? onPageCalled(GetPage? page) {
  //   // TODO: implement onPageCalled
  //   return super.onPageCalled(page);
  // }
  //
  // @override
  // GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
  //   // TODO: implement onPageBuildStart
  //   return super.onPageBuildStart(page);
  // }
  //
  // @override
  // List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
  //   // TODO: implement onBindingsStart
  //   return super.onBindingsStart(bindings);
  // }
  //
  // @override
  // Widget onPageBuilt(Widget page) {
  //   // TODO: implement onPageBuilt
  //   return super.onPageBuilt(page);
  // }
  //
  // @override
  // void onPageDispose() {
  //   // TODO: implement onPageDispose
  //   super.onPageDispose();
  // }
}