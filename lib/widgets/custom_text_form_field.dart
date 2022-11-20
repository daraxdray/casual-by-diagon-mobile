import 'package:flutter/material.dart';

import '../app/utils/colors.dart';


class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
        this.keyboard,
      this.validator});

  TextFormFieldShape? shape;

  TextFormFieldPadding? padding;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextInputType? keyboard;
  TextEditingController? controller;

  FocusNode? focusNode;

  bool? isObscureText;

  TextInputAction? textInputAction;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: width ?? 0,
      margin: margin,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboard,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.InterMedium15:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: 
            15,

          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
      case TextFormFieldFontStyle.InterSemiBold20:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: 
            20,

          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.InterMedium15Black902:
        return TextStyle(
          color: AppColors.black902,
          fontSize: 
            15,

          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
        case TextFormFieldFontStyle.InterMedium15Grey:
        return TextStyle(
          color: AppColors.grey600,
          fontSize:
            15,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
        case TextFormFieldFontStyle.InterMedium20Black902:
        return TextStyle(
          color: AppColors.black902,
          fontSize: 
            20,

          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
      case TextFormFieldFontStyle.InterSemiBold17:
        return TextStyle(
          color: AppColors.black902,
          fontSize: 
            17,

          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      case TextFormFieldFontStyle.InterSemiBold15:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: 
            15,

          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      case TextFormFieldFontStyle.InterSemiBold12:
        return TextStyle(
          color: AppColors.bluegray600,
          fontSize: 
            12,

          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      case TextFormFieldFontStyle.InterSemiBold14:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: 
            14,

          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      default:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: 
            13,

          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      case TextFormFieldShape.CircleBorder15:
        return BorderRadius.circular(
          
            15.00,

        );
      default:
        return BorderRadius.circular(
          
            10.00,

        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.Outline:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.Outline_1:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.FillWhiteA700:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.UnderLineGray902:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.gray902,
          ),
        );
      case TextFormFieldVariant.FillBlack9004c:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case TextFormFieldVariant.FillWhiteA700:
        return AppColors.whiteA700;
      case TextFormFieldVariant.FillBlack9004c:
        return AppColors.black9004c;
      default:
        return null;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.GradientGray901Bluegray900:
        return false;
      case TextFormFieldVariant.Outline:
        return false;
      case TextFormFieldVariant.FillWhiteA700:
        return true;
      case TextFormFieldVariant.UnderLineGray902:
        return false;
      case TextFormFieldVariant.FillBlack9004c:
        return true;
      default:
        return false;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingAll18:
        return const EdgeInsets.all( 18,
        );
      case TextFormFieldPadding.PaddingAll22:
        return const EdgeInsets.all( 22,
        );
      case TextFormFieldPadding.PaddingT27:
        return const EdgeInsets.only(
          left: 26,
          top: 27,
          right: 26,
          bottom: 26,
        );
      case TextFormFieldPadding.PaddingT28:
        return const EdgeInsets.only(
          left: 23,
          top: 28,
          right: 23,
          bottom: 23,
        );
      case TextFormFieldPadding.PaddingT10:
        return const EdgeInsets.only(
          left: 8,
          top: 10,
          right: 8,
          bottom: 8,
        );
      case TextFormFieldPadding.PaddingB15:
        return const EdgeInsets.only(
          bottom: 15,
        );
      default:
        return const EdgeInsets.all(18);
    }
  }
}

enum TextFormFieldShape {
  RoundedBorder10,
  CircleBorder15,
}

enum TextFormFieldPadding {
  PaddingT23,
  PaddingAll22,
  PaddingT27,
  PaddingT28,
  PaddingT10,
  PaddingB15,
  PaddingAll21,
  PaddingT9,
  PaddingAll18,

}

enum TextFormFieldVariant {
  GradientGray901Bluegray900,
  Outline,
  FillWhiteA700,
  UnderLineGray902,
  FillBlack9004c,
  Outline_1
}

enum TextFormFieldFontStyle {
  InterSemiBold13,
  InterMedium15,
  InterMedium15Black902,
  InterMedium15Grey,
  InterMedium20Black902,
  InterSemiBold17,
  InterSemiBold15,
  InterSemiBold12,
  InterSemiBold14,
  InterSemiBold20
}
