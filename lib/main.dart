import 'package:casual/app/services/firebase_service.dart';
import 'package:casual/screens/onboarding/splash_diagon.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:casual/screens/onboarding/welcome.dart';
import 'package:casual/app/routes/routes.dart';
import 'package:casual/app/services/auth_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'app/localization/app_localization.dart';
// import 'app/providers/user_provider.dart';
// import './app/localization/app_localization.dart';
import 'app/routes/routes.dart';

void main() async{
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp();
  await GetStorage.init();
  initiateServices();
  runApp( MyApp());
}


Future<void> initiateServices() async {
  Get.putAsync<DgAuthService>(() async => DgAuthService());
}


class MyApp extends StatelessWidget {
   MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseService().registerNotification(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Casual',
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: const Locale('en', 'US'),
      getPages: DgRoutes.pages,
      initialRoute: DgRoutes.initialRoute,
      theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(
      accentColor:  Colors.grey, // but now it should be declared like this
    ),),
      home:  SplashScreen(),


    );
  }
}
