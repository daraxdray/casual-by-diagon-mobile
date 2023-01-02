import 'package:get/get.dart';
import '../../../widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'controller/select_avatar_controller.dart';
import './widgets/select_avatar_widget.dart';

class SelectAvatarScreen extends GetWidget<SelectAvatarController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: authAppBar("Choose Avatar"),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 40,
                    right: 20,
                  ),
                  child: StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                    primary: false,
                    crossAxisCount: 6,
                    crossAxisSpacing: 32.45,
                    mainAxisSpacing: 32.45,
                    staggeredTileBuilder: (index) {
                      return StaggeredTile.fit(2);
                    },
                    itemCount: controller
                        .selectAvatarItemList.length,
                    itemBuilder: (context, index) {

                      String image = controller.selectAvatarItemList
                      [index];
                      return SelectAvatarItemWidget(image);
                    },
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
