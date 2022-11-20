import 'package:get/get.dart';
import 'package:flutter/material.dart';

void  successSnack(title,message) => Get.snackbar(title, message, colorText: Colors.white);

void  failedSnack(title,message) => Get.snackbar(title, message, colorText: Colors.white);
void  warningSnack(title,message) => Get.snackbar(title, message, colorText: Colors.white);
void  infoSnack(title,message) => Get.snackbar(title, message, colorText: Colors.white);