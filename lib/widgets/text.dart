import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../app/utils/theme.dart';

class AppText {
  AppText._();

  static text(String text,
      {Color? color,
      double? fontSize,
      FontWeight? fontWeight,
      TextDecoration? decoration,
      String? fontFamily,
      TextAlign? textAlign,
      TextOverflow? overflow,
      TextStyle? style}) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.left,
        style:   style ?? TextStyle(
          fontFamily: 'Inter',
            color: color ?? AppColors.visibleText,
            fontSize: fontSize ?? 14,
            fontWeight: fontWeight ?? FontWeight.normal,
            decoration: decoration ?? TextDecoration.none,
          ),
      overflow: overflow,
        );
  }

  static textSpan(
    String text, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    String? fontFamily,
    Function()? onTap,
  }) {
    return TextSpan(
      text: text,
      recognizer: TapGestureRecognizer()..onTap = onTap,
      style: TextStyle(
        color: color ?? AppColors.visibleText,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        decoration: decoration ?? TextDecoration.none,
        fontFamily: fontFamily ?? 'Inter',
      ),
    );
  }
}
