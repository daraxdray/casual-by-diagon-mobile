import 'package:get/get.dart';
import '../../widgets/common_image_view.dart';
import '../past_activity_screen/widgets/past_activity_item_widget.dart';
import 'controller/past_activity_controller.dart';
import 'models/past_activity_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PastActivityScreen extends GetWidget<PastActivityController> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: rankWalletAppBar(),
        backgroundColor: DgColors.transparent,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              margin: getMargin(top: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 20,
                      top: 50,
                      right: 20,
                    ),
                    child: Text(
                      "lbl_past_activity".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterBold25.copyWith(),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 20,
                      top: 8,
                      right: 20,
                    ),
                    child: Text(
                      "msg_check_your_past".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterRegular13.copyWith(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        left: 16,
                        top: 24,
                        right: 16,
                        bottom: 75,
                      ),
                      child: Obx(
                        () =>controller.pastActivityList.value
                            .length > 0 && controller.lastPage == false?  LazyLoadScrollView(
                            onEndOfPage: controller.loadNextPage,
                            isLoading: controller.lastPage,
                            child: ListView.builder(
                          shrinkWrap: true,
                          physics: PageScrollPhysics(),
                          itemCount: controller.pastActivityList.value
                              .length,
                          itemBuilder: (context, index) {
                            PastActivityItemModel model = controller
                                .pastActivityList
                                .value
                                [index];
                            return PastActivityItemWidget(
                              pastActivityItemModelObj: model,
                            );
                          },
                        )):
                        ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return PastActivityItemWidget();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
