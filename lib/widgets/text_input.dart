import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app/utils/colors.dart';

class AppTextInput {
  static Widget input(
      {TextEditingController? controller,
        GlobalKey? key,
      Function(String val)? onChanged,
      FormFieldValidator<String>? validator,
      String? labelText,
      String? hintText,
      TextInputType? keyboardType,
      bool? autofocus,
      bool? autocorrect,
      bool? obscureText,
      int? minLines,
      int? maxLines,
      Widget? prefix,
        FocusNode? focusNode,
        Color? fillColor,
        Color? cursorColor,
        Color? textColor,
      List<TextInputFormatter>? inputFormatters}) {
    return TextFormField(
      key: key,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: cursorColor ?? Colors.black,
      focusNode: focusNode,
      enableSuggestions: false,
      autofocus: autofocus ?? false,
      autocorrect: autocorrect ?? false,
      obscureText: obscureText ?? false,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      minLines: minLines,
      validator: validator,
      onChanged: onChanged,
      style:  TextStyle(
          color: textColor ?? Colors.black,
          // fontFamily: 'Lato',

          decoration: TextDecoration.none,
          fontFamily: 'Inter'),
      decoration: InputDecoration(
        fillColor: fillColor ?? Colors.white,
        filled: true,
        prefixIcon: prefix,
        // prefix: prefix,
        labelText: labelText,
        labelStyle: const TextStyle(
            // fontFamily: 'Lato',
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: Color(0xFF666161)),
        hintText: hintText,
        helperStyle:
            TextStyle(color: const Color(0xFF050529).withOpacity(0.25)),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // borderSide: BorderSide(width: 1, color: Color(0xFF050529)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // borderSide: BorderSide(color: Color(0xFFF3F3F3)),
        ),
      ),

      // validator: (value) =>
      //     state.isValidUsername ? null : 'Fullname is too short',
    );
  }
}
