import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app/utils/colors.dart';

class DgFullScreenLoader extends StatelessWidget {
  final Widget child;
  final bool isloading;
  final Color? color;
   const DgFullScreenLoader({ Key? key, required this.child, required this.isloading, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
                child,
               if(isloading) Container(height: MediaQuery.of(context).size.height,
                color: color ?? Colors.black45,
                child: Center(child:  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 30,
                    width: 30,
                    child: const CircularProgressIndicator(
                      strokeWidth: 3.4,
                      color: Colors.white,
                    ))),)

    ]);
  }
}
