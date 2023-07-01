import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class AppTextInput {
  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  static Widget input(
      {TextEditingController? controller,
      Function(String val)? onChanged,
      String? labelText,
      String? hintText,
      String? initialValue,
      TextInputType? keyboardType,
      bool? autofocus,
      bool? autocorrect,
      bool? obscureText,
      bool? enabled,
      int? minLines,
      int? maxLines,
      Widget? prefix,
      Widget? surfix,
      Color? fillColor,
      Color? hintTextColor,
      Color? borderColor,
      Color? activeBorderColor,
      int? maxLength,
      double? borderRadius,
      Color? textColor,
      List<TextInputFormatter>? inputFormatters}) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: AppColors.primary,
      enableSuggestions: false,
      autofocus: autofocus ?? false,
      autocorrect: autocorrect ?? false,
      obscureText: obscureText ?? false,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      minLines: minLines,
      enabled: enabled,
      maxLength: maxLength,

      style: TextStyle(
          color: textColor ?? Colors.white,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
          decoration: TextDecoration.none),
      decoration: InputDecoration(
        fillColor: fillColor ?? AppColors.inputDark,
        filled: true,
        prefixIcon: prefix,
        suffix: surfix,

        counterStyle: const TextStyle(color: Colors.white, fontFamily: 'Inter'),

        // prefix: prefix,
        labelText: labelText,

        labelStyle: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: AppColors.white),
        hintText: hintText,
        hintStyle: TextStyle(
            color: hintTextColor ?? AppColors.white.withOpacity(0.7),
            fontWeight: FontWeight.w500),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
          borderSide:
              BorderSide(color: activeBorderColor ?? Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
          borderSide: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
          borderSide: BorderSide(color: borderColor ?? Colors.transparent),
        ),
      ),

      // validator: (value) =>
      //     state.isValidUsername ? null : 'Fullname is too short',
      onChanged: onChanged,
    );
  }
}
