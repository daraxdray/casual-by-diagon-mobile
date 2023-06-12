import 'package:get/get.dart';
import 'package:flutter/material.dart';

void  successSnack(title,message, {duration = 3}) => Get.snackbar(title, message, colorText: Colors.white,icon: Icon(Icons.check_circle,color: Colors.white,),duration: Duration(seconds: duration), backgroundColor: Colors.green);

void  failedSnack(title,message) => Get.snackbar(title, message, colorText: Colors.white,backgroundColor: Colors.redAccent,shouldIconPulse: true,
icon: Icon(Icons.dangerous));
void  warningSnack(title,message) => Get.snackbar(title, message, colorText: Colors.white, backgroundColor: Colors.orangeAccent,icon: Icon(Icons.info_outline));
void  infoSnack(title,message) => Get.snackbar(title, message, colorText: Colors.white, backgroundColor: Colors.blueAccent, duration: const Duration(seconds: 5));