import 'package:flutter/material.dart';
import 'theme.dart';

class AppButton {
  AppButton._();

  static Widget button(
      {required Widget widget,
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
            minimumSize: minimumSize ?? const Size(0, 60),
            shape: RoundedRectangleBorder(
                side: borderSide ?? BorderSide.none,
                borderRadius: borderRadius ?? BorderRadius.circular(100)),
            padding: padding),
        onPressed: onPressed,
        child: isLoading != null && isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget,
                  if (isLoading)
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        height: 20,
                        width: 20,
                        child: const CircularProgressIndicator(
                          strokeWidth: 1.4,
                          color: Colors.white,
                        )),
                ],
              )
            : widget);
  }
}
