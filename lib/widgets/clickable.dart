import 'package:flutter/material.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';
import 'package:get/get.dart';

// class ClickableController extends GetxController with GetSingleTickerProviderStateMixin {
//   AnimationController? animController;
//   late Rx<Animation<double>>  tw;
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     animController = AnimationController(
//       vsync: this,
//       duration: const Duration(
//         milliseconds: 2500,
//       ),
//     );
//      tw = Tween(begin: 1,end: 10).animate(animController!) as Rx<Animation<double>>;
//   }
//   void shrinkWidget(){
//     animController?.forward();
//   }
// }
//
// class DgClickable extends GetWidget<ClickableController>{
//   final ClickableController controller = Get.put(ClickableController());
//
//   DgClickable({this.onTap, this.child, this.height, this.width});
//   final Function? onTap;
//   final Widget? child;
//   final double? height;
//   final double? width;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration:const BoxDecoration(
//         shape: BoxShape.circle,
//       ),
//       child: Material(
//         color:Colors.transparent,
//         shape: const CircleBorder(),
//         child: InkWell(
//           onTap:(){
//             controller.shrinkWidget();
//             onTap!();},
//           customBorder: const CircleBorder(),
//           child: child,
//         ),
//       ),
//     ).animate(controller: controller.animController);
//   }
//
// }

class DgClickable extends StatefulWidget {
  VoidCallback? onTap;
  bool? animate;
  Widget child;

   DgClickable({required this.onTap, required this.child, this.animate,Key? key,}) : super(key: key);

  @override
  State<DgClickable> createState() => _DgClickableState();
}

class _DgClickableState extends State<DgClickable> with SingleTickerProviderStateMixin {
  AnimationController? ctr;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    ctr = AnimationController(vsync: this, duration: Duration(seconds: 3));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return Container(
      // decoration:const BoxDecoration(
      //   shape: BoxShape.circle,
      // ),
      child: Material(
        color:Colors.transparent,
        // shape: const CircleBorder(),
        child: InkWell(
          splashColor: Colors.transparent,
          onTapDown: (details){
            ctr?.forward(from: 0.7);
          },
          onTap:(){
            widget.onTap!();},
          customBorder: const CircleBorder(),
          child: widget.child,
        ),
      ),
    ).animate(controller: ctr).scale(duration: Duration(milliseconds: 500),);
  }
}


