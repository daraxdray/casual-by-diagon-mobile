import 'package:casual/widgets/snackbar.dart';
import 'package:flutter/material.dart';

import '../app/utils/colors.dart';
import 'clickable.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.onTap,
      this.loading,
      this.width,
      this.margin,
      this.text});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  VoidCallback? onTap;

  double? width;
  bool? loading;
  EdgeInsetsGeometry? margin;

  String? text;

  @override
  Widget build(BuildContext context) {
    return DgClickable(
        onTap: loading == true
            ? () => successSnack("HEY!!!", "Please take it easy with me 😭 ")
            : onTap,
        child: Container(
            margin: margin,
            child: alignment != null
                ? Align(
                    alignment: alignment ?? Alignment.center,
                    child: _buildButtonWidget(),
                  )
                : _buildButtonWidget()));
  }

  _buildButtonWidget() {
    return Container(
      width: width ?? 0,
      padding: _setPadding(),
      decoration: _buildDecoration(),
      child: loading == true
          ? CircularProgressIndicator()
          : Text(
              text ?? "",
              textAlign: TextAlign.center,
              style: _setFontStyle(),
            ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      borderRadius: _setBorderRadius(),
      gradient: _setGradient(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll11:
        return const EdgeInsets.all(11);
      case ButtonPadding.PaddingAll8:
        return const EdgeInsets.all(8);
      case ButtonPadding.PaddingAll19:
        return EdgeInsets.all(
          19,
        );
      case ButtonPadding.PaddingAll24:
        return EdgeInsets.all(
          24,
        );
      case ButtonPadding.PaddingAll25:
        return EdgeInsets.all(
          25,
        );
      default:
        return EdgeInsets.all(
          16,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillBlack90035:
        return AppColors.black90035;
      case ButtonVariant.GradientFillBlack:
        return AppColors.black90000;
      case ButtonVariant.GradientCyan400Deeppurple300:
      case ButtonVariant.GradientLightblueA200IndigoA400:
      case ButtonVariant.GradientGreenA200Indigo602:
      case ButtonVariant.GradientLightblueA401Blue800:
      case ButtonVariant.GradientLightgreen700Lightgreen400:
      case ButtonVariant.GradientRedA701Lightblue800:
      case ButtonVariant.GradientRedA701Light800:
      case ButtonVariant.GradientBluegray400Indigo600:
      case ButtonVariant.GradientBluegray700Bluegray902:
      case ButtonVariant.OutlineBlack9003f:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder5:
        return BorderRadius.circular(
          5.00,
        );
      case ButtonShape.RoundedBorder15:
        return BorderRadius.circular(
          15.00,
        );
      case ButtonShape.RoundedBorder10:
        return BorderRadius.circular(
          10.00,
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          10.00,
        );
    }
  }

  _setGradient() {
    switch (variant) {
      case ButtonVariant.GradientLightblueA200IndigoA400:
        return LinearGradient(
          begin: Alignment(
            0.5,
            -3.0616171314629196e-17,
          ),
          end: Alignment(
            0.5,
            0.9999999999999999,
          ),
          colors: [
            AppColors.lightBlueA200,
            AppColors.indigoA400,
          ],
        );
      case ButtonVariant.GradientGreenA200Indigo602:
        return LinearGradient(
          begin: Alignment(
            0.42388061548870803,
            -0.24528298971341012,
          ),
          end: Alignment(
            0.45970153756043086,
            1.1698113278145634,
          ),
          colors: [
            AppColors.greenA200,
            AppColors.indigo602,
          ],
        );
      case ButtonVariant.GradientLightblueA401Blue800:
        return LinearGradient(
          begin: Alignment(
            0.4464831441517416,
            -0.34999982059812274,
          ),
          end: Alignment(
            0.6727828337519428,
            2.616666878061923,
          ),
          colors: [
            AppColors.lightBlueA401,
            AppColors.blue800,
          ],
        );
      case ButtonVariant.GradientBluegray700Bluegray902:
        return LinearGradient(
          begin: Alignment(
            0.3593750467963944,
            -0.06034485076747198,
          ),
          end: Alignment(
            0.6343750218768542,
            1.500000024433324,
          ),
          colors: [
            AppColors.bluegray700,
            AppColors.bluegray902,
          ],
        );
      case ButtonVariant.GradientLightgreen700Lightgreen400:
        return LinearGradient(
          begin: Alignment(
            0.37671237400848856,
            -0.5600001227395435,
          ),
          end: Alignment(
            0.6369862945031108,
            2.2599998729813464,
          ),
          colors: [
            AppColors.lightGreen700,
            AppColors.lightGreen400,
          ],
        );
      case ButtonVariant.GradientRedA701Lightblue800:
        return LinearGradient(
          begin: Alignment(
            0.37671234564364964,
            -0.560000034730276,
          ),
          end: Alignment(
            0.5015290203639831,
            2.083333361054436,
          ),
          colors: [
            AppColors.redA701,
            AppColors.lightBlue800,
          ],
        );
      case ButtonVariant.GradientRedA701Light800:
        return LinearGradient(
          begin: Alignment(
            0.9999999989265604,
            0.5000002026744177,
          ),
          end: Alignment(
            -1.0734393374178808e-9,
            0.5000001106504364,
          ),
          colors: [
            AppColors.redA200,
            AppColors.redA700,
          ],
        );
      case ButtonVariant.GradientBluegray400Indigo600:
        return LinearGradient(
          begin: Alignment(
            0.5,
            -3.0616171314629196e-17,
          ),
          end: Alignment(
            0.5,
            0.9999999999999999,
          ),
          colors: [
            AppColors.bluegray400,
            AppColors.indigo600,
          ],
        );
      case ButtonVariant.OutlineBlack9003f:
        return LinearGradient(
          begin: Alignment(
            0.5552238824413142,
            -0.1886792962251027,
          ),
          end: Alignment(
            0.6388060159337987,
            1.5094337213749918,
          ),
          colors: [
            AppColors.deepPurpleA400,
            AppColors.purple800,
          ],
        );
      case ButtonVariant.FillBlack90035:
      case ButtonVariant.GradientAmberA100AmberA400:
        return LinearGradient(
          begin: Alignment(
            -0.08333334399038678,
            0.49999999662292566,
          ),
          end: Alignment(
            0.6901407967375417,
            1.000000004370707,
          ),
          colors: [
            AppColors.amberA100,
            AppColors.amberA400,
          ],
        );
      case ButtonVariant.Outline:
      case ButtonVariant.FillWhiteA700:
        return null;
      default:
        return LinearGradient(
          begin: Alignment(
            -0.09139784061283085,
            -0.1500000421841361,
          ),
          end: Alignment(
            0.7934782470323143,
            1.1666667964435722,
          ),
          colors: [
            AppColors.cyan400,
            AppColors.deepPurple300,
          ],
        );
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case ButtonVariant.OutlineBlack9003f:
        return [
          BoxShadow(
              color: AppColors.black9003f,
              spreadRadius: 2.00,
              blurRadius: 2.00,
              offset: Offset(
                0,
                4,
              ))
        ];
      case ButtonVariant.GradientCyan400Deeppurple300:
      case ButtonVariant.GradientLightblueA200IndigoA400:
      case ButtonVariant.GradientGreenA200Indigo602:
      case ButtonVariant.GradientLightblueA401Blue800:
      case ButtonVariant.GradientLightgreen700Lightgreen400:
      case ButtonVariant.GradientRedA701Lightblue800:
      case ButtonVariant.GradientRedA701Light800:
      case ButtonVariant.GradientBluegray700Bluegray902:
      case ButtonVariant.GradientBluegray400Indigo600:
      case ButtonVariant.FillBlack90035:
      case ButtonVariant.GradientFillBlack:
      case ButtonVariant.GradientAmberA100AmberA400:
      case ButtonVariant.Outline:
      case ButtonVariant.FillWhiteA700:
        return null;
      default:
        return null;
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.InterMedium11:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: 11,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.InterMedium13:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: 13,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.InterBold18:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: 18,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.InterBold20:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: 18,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.InterSemiBold15:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: 15,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.InterSemiBold20:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: 20,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.InterSemiBold17:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: 17,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.InterSemiBold18:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: 18,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.InterSemiBold14:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: 18,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.InterMedium14:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.InterSemiBold18Cyan901:
        return TextStyle(
          color: AppColors.cyan901,
          fontSize: 18,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: AppColors.whiteA700,
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder8,
  RoundedBorder5,
  RoundedBorder10,
  RoundedBorder15,
  CircleBorder32,
}

enum ButtonPadding {
  PaddingAll16,
  PaddingAll11,
  PaddingAll8,
  PaddingAll19,
  PaddingAll24,
  PaddingAll25,
}

enum ButtonVariant {
  GradientCyan400Deeppurple300,
  GradientLightblueA200IndigoA400,
  GradientGreenA200Indigo602,
  GradientLightblueA401Blue800,
  GradientLightgreen700Lightgreen400,
  GradientRedA701Lightblue800,
  GradientRedA701Light800,
  GradientBluegray400Indigo600,
  FillBlack90035,
  GradientFillBlack,
  OutlineBlack9003f,
  GradientBluegray700Bluegray902,
  GradientAmberA100AmberA400,
  Outline,
  FillWhiteA700,
}

enum ButtonFontStyle {
  InterBold16,
  InterMedium11,
  InterMedium13,
  InterBold18,
  InterBold20,
  InterSemiBold15,
  InterSemiBold20,
  InterMedium14,
  InterSemiBold17,
  InterSemiBold18,
  InterSemiBold14,
  InterSemiBold18Cyan901
}
