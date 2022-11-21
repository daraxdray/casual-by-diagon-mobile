import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../utils/colors.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/math_utils.dart';
import '../../../widgets/common_image_view.dart';
import '../controller/past_activity_controller.dart';
import '../models/past_activity_item_model.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:timeago/timeago.dart' as timeago;
// ignore: must_be_immutable
class PastActivityItemWidget extends StatelessWidget {
  PastActivityItemWidget({this.pastActivityItemModelObj});

  PastActivityItemModel? pastActivityItemModelObj;

  var controller = Get.find<PastActivityController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child:  pastActivityItemModelObj != null? Container(
        margin: getMargin(
          top: 5.0,
          bottom: 5.0,
        ),
        decoration: AppDecoration.outline.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder10,
        ),
        child: OutlineGradientButton(
          padding: EdgeInsets.only(
            left: getHorizontalSize(
              2.00,
            ),
            top: getVerticalSize(
              2.00,
            ),
            right: getHorizontalSize(
              2.00,
            ),
            bottom: getVerticalSize(
              2.00,
            ),
          ),
          strokeWidth: getHorizontalSize(
            2.00,
          ),
          gradient: LinearGradient(
            begin: Alignment(
              0.374626935949973,
              -0.2718447422566994,
            ),
            end: Alignment(
              0.43880597065005017,
              0.5825242831542008,
            ),
            colors: [
              DgColors.cyan900,
              DgColors.purpleA70000,
            ],
          ),
          corners: Corners(
            topLeft: Radius.circular(
              10,
            ),
            topRight: Radius.circular(
              10,
            ),
            bottomLeft: Radius.circular(
              10,
            ),
            bottomRight: Radius.circular(
              10,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(children: [
              Padding(
                padding: getPadding(
                  left: 13,
                  top: 13,
                  bottom: 13,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      10.00,
                    ),
                  ),
                  child: CommonImageView(
                    imagePath: ImageConstant.imgEllipse7,
                    height: getSize(
                      41.00,
                    ),
                    width: getSize(
                      41.00,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 7,
                  top: 16,
                  right: 15,
                  bottom: 15,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: getMargin(
                        top: 3,
                        bottom: 2,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${pastActivityItemModelObj?.name}",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterBold15.copyWith(),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 3,
                              right: 10,
                            ),
                            child: Text(
                              timeago.format(DateTime.parse('${pastActivityItemModelObj?.date}')),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterMedium12Bluegray400
                                  .copyWith(),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],),
              Container(
                margin: getMargin(
                  left: 40,
                ),
                decoration:
                AppDecoration.fillWhiteA700.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder10,
                ),
                child: Align(alignment: Alignment.centerRight, child:Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: getPadding(
                        left: 11,
                        top: 8,
                        bottom: 6,
                      ),
                      child: CommonImageView(
                        imagePath: ImageConstant.imgCoin,
                        height: getVerticalSize(
                          21.00,
                        ),
                        width: getHorizontalSize(
                          17.00,
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 4,
                        top: 10,
                        right: 16,
                        bottom: 8,
                      ),
                      child: Text(
                        "${pastActivityItemModelObj?.points}",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterSemiBold17Black902
                            .copyWith(),
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      )
      :  Container(
    height: 70,
    margin: getMargin(
    top: 5.0,
    bottom: 5.0,
    ), child:ClipRRect(
    borderRadius: BorderRadius.circular(22),
    child: LinearProgressIndicator(
    color: Colors.grey.shade800,
    backgroundColor: Colors.grey.shade900,
    )),
    ));
  }
}
