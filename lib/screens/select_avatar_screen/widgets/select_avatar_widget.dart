
import '../../../widgets/clickable.dart';
import '../../../widgets/common_image_view.dart';
import '../../../widgets/snackbar.dart';
import '../controller/select_avatar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "../../../app/utils/index.dart";

// ignore: must_be_immutable
class SelectAvatarItemWidget extends StatelessWidget {
final String? image;
SelectAvatarItemWidget(this.image);


  var controller = Get.find<SelectAvatarController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: AppColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(45),
      ),
      child:  image != ""?  InkWell(child: CommonImageView(
        imagePath: image,) ,onTap: ()=>Get.back(result:image),)
          : InkWell(child: Container(
        height: 90.00,
        width: 90.00,
        decoration: BoxDecoration(color:AppColors.grey600, borderRadius: BorderRadius.circular(45),),
        child: Stack(
          children: const [
          Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.only(
                    left: 31,
                    top: 29,
                    right: 28,
                    bottom: 30,
                  ),
                  child: Icon(DgIcons.camera, size:26, color: Colors.white,)
              ),
            ),
          ],
        ),
      ),
        onTap: ()=>infoSnack("Info","Not available on this version"),),
    );
  }
}
