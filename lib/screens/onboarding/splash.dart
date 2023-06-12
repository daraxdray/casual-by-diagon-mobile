// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// class SplashView extends StatelessWidget {
//   const SplashView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black,
//         body: Stack(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               decoration: const BoxDecoration(
//                   // gradient: Lfin
//                   image: DecorationImage(
//                       image: AssetImage('assets/img/welcome_bg.png'),
//                       fit: BoxFit.cover)),
//             ),
//             Container(
//                 height: MediaQuery.of(context).size.height,
//                 decoration: BoxDecoration(
//                     gradient: RadialGradient(
//                   radius: 2,
//                   colors: [
//                     const Color(0xFF0066FF).withOpacity(0.2),
//                     const Color(0xFFFF0000).withOpacity(0.3),
//                     const Color(0xFFFF0000).withOpacity(0.5),
//                   ],
//                 ))),
//             const Align(
//                 alignment: Alignment.center,
//                 child: Image(image: AssetImage('assets/img/logo.png'))),
//             Opacity(
//                 opacity: 0,
//                 child: Align(
//                     alignment: Alignment.center,
//                     child: SvgPicture.asset('assets/svg/casual.svg'))),
//             Positioned(
//               width: MediaQuery.of(context).size.width,
//               bottom: 50,
//               child: Opacity(
//                   opacity: 0,
//                   child: Center(
//                       child: SvgPicture.asset('assets/svg/by_diagon.svg'))),
//             )
//           ],
//         ));
//   }
// }
