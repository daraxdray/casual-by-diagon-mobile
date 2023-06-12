import 'package:casual/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../app/utils/index.dart';
import 'button.dart';

class DgFullScreenLoader extends StatelessWidget {
  final Widget child;
  final bool isloading;
  final Color? color;
  final bool? error;
  final Function? callback;
   const DgFullScreenLoader({ Key? key, required this.child, required this.isloading, this.color, this.error, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(error);
    print(isloading);
    return Stack(
        children:[
          error == true? Center(child:  Container (
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: 40,
              width: MediaQuery.of(context).size.width * 0.3,
              child:   InkWell(
                          child: Container(
                              constraints: BoxConstraints(
                                  minWidth: MediaQuery.of(context).size.width,
                                  minHeight: 55.0),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/svg/reload_icon.svg'),
                                  const SizedBox(width: 5),
                                  AppText.text('Reload',
                                      fontSize: 15, fontWeight: FontWeight.w600)
                                ],
                              )),
                      onTap: ()=>callback!()))) : child ,
               if(isloading) Container(height: MediaQuery.of(context).size.height,
                color: color ?? Colors.black45,
                child: Center(child:  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 30,
                    width: 30,
                    child: const CircularProgressIndicator(
                      strokeWidth: 3.4,
                      color: Colors.white,
                    ))),),



    ]);
  }
}
