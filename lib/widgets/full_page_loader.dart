import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app/utils/colors.dart';

class FullScreenLoader extends StatelessWidget {
  final Widget child;
  final bool isloading;
  final Color? color;
   const FullScreenLoader({ Key? key, required this.child, required this.isloading, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
                child,
               if(isloading) Container(height: MediaQuery.of(context).size.height,
                color: color ?? Colors.black45,
                child: Center(child:  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 20,
                    width: 20,
                    child: const CircularProgressIndicator(
                      strokeWidth: 1.4,
                      color: Colors.white,
                    ))),)

    ]);
  }
}
