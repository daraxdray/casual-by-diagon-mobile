
import 'package:flutter/material.dart';

import '../app/utils/colors.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.height,
      this.width,
      this.child,
      this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? height;

  double? width;

  Widget? child;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.topCenter,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        constraints: BoxConstraints(
          minHeight: height ?? 0,
          minWidth: width ?? 0,
        ),
        padding: EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: width ?? 0,
          height: height ?? 0,
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      gradient: _setGradient(),
    );
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.PaddingAll4:
        return const EdgeInsets.all( 4);
      case IconButtonPadding.PaddingAll21:
        return const EdgeInsets.all(21);
      case IconButtonPadding.PaddingAll7:
        return const EdgeInsets.all(7);
      case IconButtonPadding.PaddingAll3:
        return  const EdgeInsets.all(3);
        case IconButtonPadding.PaddingAll0:
        return const EdgeInsets.all(0);
      default:
        return const EdgeInsets.all( 10);
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.FillBlack9007f1:
        return AppColors.black9007f1;
      case IconButtonVariant.OutlineBlack902:
        return AppColors.whiteA700;
      case IconButtonVariant.FillLightblue500:
        return AppColors.lightBlue500;
      case IconButtonVariant.FillBlack90034:
        return AppColors.black90034;
        case IconButtonVariant.Transparent:
        return Colors.transparent;
      case IconButtonVariant.GradientRedA100Red700:
      case IconButtonVariant.OutlineIndigo601:
      case IconButtonVariant.GradientLightblueA402Lightblue900:
      case IconButtonVariant.GradientLightgreen700Lightgreen400:
      case IconButtonVariant.OutlineBlack9021_2:
      case IconButtonVariant.GradientAmberA100AmberA402:
        return null;
      default:
        return AppColors.black90033;
    }
  }

  _setBorder() {
    switch (variant) {
      case IconButtonVariant.OutlineRed500:
        return Border.all(
          color: AppColors.red500,
          width: 
            0.00
        );
      case IconButtonVariant.OutlineIndigo601:
        return Border.all(
          color: AppColors.indigo601,
          width:0.00,);
      case IconButtonVariant.OutlineBlack902:
        return Border.all(
          color: AppColors.black902,
          width: 
            4.00,
        );
      case IconButtonVariant.OutlineBlack9021_2:
        return Border.all(
          color: AppColors.black902,
          width: 
            3.00,
        );
      case IconButtonVariant.FillBlack90033:
      case IconButtonVariant.FillBlack9007f1:
      case IconButtonVariant.GradientRedA100Red700:
      case IconButtonVariant.GradientLightblueA402Lightblue900:
      case IconButtonVariant.GradientLightgreen700Lightgreen400:
      case IconButtonVariant.FillLightblue500:
      case IconButtonVariant.FillBlack90034:
      case IconButtonVariant.GradientAmberA100AmberA402:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {

      case IconButtonShape.CircleBorder12:
        return BorderRadius.circular(
          
            12.00
        );
      case IconButtonShape.RoundedBorder19:
        return BorderRadius.circular(
          
            19.50,

        );
      case IconButtonShape.CircleBorder47:
        return BorderRadius.circular(
          
            47.00,

        );
      case IconButtonShape.CustomBorderLR10:
        return BorderRadius.only(
          topLeft: Radius.circular(
            
              0.00,

          ),
          topRight: Radius.circular(
            
              10.00,
          ),
          bottomLeft: Radius.circular(
            
              0.00,

          ),
          bottomRight: Radius.circular(
            
              10.00,

          ),
        );
      default:
        return BorderRadius.circular(
            15.00,
        );
    }
  }

  _setGradient() {
    switch (variant) {
      case IconButtonVariant.GradientBluegray700Bluegray902:
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
            AppColors.greenA200,
            AppColors.bluegray902,
          ],
        );
      case IconButtonVariant.GradientRedA100Red700:
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
            AppColors.redA100,
            AppColors.red700,
          ],
        );
      case IconButtonVariant.GradientLightblueA402Lightblue900:
        return LinearGradient(
          begin: Alignment(
            0.5,
            0,
          ),
          end: Alignment(
            0.7250000017881393,
            1.0749999845772984,
          ),
          colors: [
            AppColors.lightBlueA402,
            AppColors.lightBlue900,
          ],
        );
        case IconButtonVariant.GradientLightgreen700Lightgreen400:
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
      case IconButtonVariant.OutlineBlack9021_2:
        return LinearGradient(
          begin: Alignment(
            0.5,
            0,
          ),
          end: Alignment(
            0.2631579022067587,
            1.2564102537771378,
          ),
          colors: [
            AppColors.yellowA700,
            AppColors.orange900,
          ],
        );
      case IconButtonVariant.GradientAmberA100AmberA402:
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
            AppColors.amberA402,
          ],
        );
      case IconButtonVariant.FillBlack90033:
      case IconButtonVariant.FillBlack9007f1:
      case IconButtonVariant.OutlineIndigo601:
      case IconButtonVariant.OutlineBlack902:
      case IconButtonVariant.FillLightblue500:
      case IconButtonVariant.FillBlack90034:
      case IconButtonVariant.FillBlack90033:
      case IconButtonVariant.FillWhiteA700:
      case IconButtonVariant.OutlineRed500:
        return null;
      default:
        return null;
    }
  }
}

enum IconButtonShape {
  CircleBorder15,
  CircleBorder12,
  RoundedBorder19,
  CircleBorder47,
  CustomBorderLR10,
}

enum IconButtonPadding {
  PaddingAll10,
  PaddingAll4,
  PaddingAll21,
  PaddingAll22,
  PaddingAll7,
  PaddingAll3,
  PaddingAll0,
}

enum IconButtonVariant {
  FillBlack90033,
  FillBlack9007f1,
  GradientRedA100Red700,
  OutlineIndigo601,
  OutlineBlack902,
  GradientLightblueA402Lightblue900,
  GradientLightgreen700Lightgreen400,
  OutlineBlack9021_2,
  FillLightblue500,
  FillBlack90034,
  Transparent,
  GradientAmberA100AmberA402,
  GradientAmberA100AmberA400,
  GradientBluegray700Bluegray902,
  FillWhiteA700,
  OutlineRed500,

}
