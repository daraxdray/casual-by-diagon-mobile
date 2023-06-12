import 'package:casual/app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShimmerShape extends StatelessWidget{
  double? height, width;
  ShimmerShape({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: LinearProgressIndicator(
        color: AppColors.black90033,
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }

}