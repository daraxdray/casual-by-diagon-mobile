
import 'package:flutter/material.dart';
import '../app/utils/theme.dart';

class AppButton {
  AppButton._();

  static Widget button(
      {required Widget child,
      required Function() onPressed,
      Color? backgroundColor,
      Size? minimumSize,
      bool? isLoading,
      BorderSide? borderSide,
      BorderRadiusGeometry? borderRadius,
      EdgeInsetsGeometry? padding}) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColors.primary,
            minimumSize: minimumSize ?? const Size(0, 55),
            shape: RoundedRectangleBorder(
                side: borderSide ?? BorderSide.none,
                borderRadius: borderRadius ?? BorderRadius.circular(10)),
            padding: padding),
        onPressed: onPressed,
        child: isLoading != null && isLoading
            ?   Container(
            margin: const EdgeInsets.only(left: 10),
            height: 20,
            width: 20,
            child: const CircularProgressIndicator(
              strokeWidth: 1.4,
              color: Colors.white,
            ))
            : child);
  }
}
