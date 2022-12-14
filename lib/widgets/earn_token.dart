import 'package:flutter/material.dart';

class EarnTokenView extends StatelessWidget {
   EarnTokenView({Key? key}) : super(key: key);
  List<String> images = [
    "assets/img/raffles/raffle.png",
    "assets/img/raffles/d_miss_out.png",
    "assets/img/raffles/bitcoin.png",

  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Don\'t Miss out',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25))),
        const SizedBox(height: 15),
        SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                separatorBuilder: (context, index) => const SizedBox(width: 14),
                itemCount: images.length,
                itemBuilder: (context, index) => GestureDetector(
                        child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(images[index],
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width * 0.8,
                            fit: BoxFit.cover),
                      ),
                      // Positioned(
                      //     right: 20,
                      //     top: 16,
                      //     child: TextButton(
                      //         style: TextButton.styleFrom(
                      //             shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(20),
                      //             ),
                      //             backgroundColor: Colors.white,
                      //             foregroundColor: Colors.black,
                      //             minimumSize: const Size(100, 0)),
                      //         onPressed: () {},
                      //         child: Column(
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             const Text(
                      //               '1st PRIZE ',
                      //             ),
                      //             Row(
                      //               children: [
                      //                 Image.asset('assets/img/ticket.png'),
                      //                 const Text('100',
                      //                     style: TextStyle(
                      //                         fontWeight: FontWeight.bold,
                      //                         fontSize: 20))
                      //               ],
                      //             )
                      //           ],
                      //         ))),
                      // Positioned(
                      //     bottom: 0,
                      //     child: Container(
                      //         width: MediaQuery.of(context).size.width - 20,
                      //         padding: const EdgeInsets.all(20),
                      //         decoration: BoxDecoration(
                      //             color: Colors.black.withOpacity(0.4),
                      //             borderRadius: const BorderRadius.vertical(
                      //                 bottom: Radius.circular(20))),
                      //         child: Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Column(
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: const [
                      //                     Text('Table Tennis',
                      //                         style: TextStyle(
                      //                             color: Colors.white,
                      //                             fontWeight: FontWeight.bold,
                      //                             fontSize: 20)),
                      //                     SizedBox(height: 8),
                      //                     Text('Closed',
                      //                         style: TextStyle(
                      //                           color: Colors.white,
                      //                           fontWeight: FontWeight.bold,
                      //                         )),
                      //                   ]),
                      //               Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.end,
                      //                 children: [
                      //                   Container(
                      //                     padding: const EdgeInsets.symmetric(
                      //                         horizontal: 10, vertical: 8),
                      //                     decoration: BoxDecoration(
                      //                       color: const Color(0xFFEB4F47),
                      //                       borderRadius:
                      //                           BorderRadius.circular(20),
                      //                     ),
                      //                     child: const Text('LIVE',
                      //                         style: TextStyle(
                      //                             color: Colors.white)),
                      //                   ),
                      //                   const SizedBox(height: 8),
                      //                   const Text('1 Playing',
                      //                       style: TextStyle(
                      //                           color: Colors.white,
                      //                           fontWeight: FontWeight.w500,
                      //                           fontSize: 16))
                      //                 ],
                      //               )
                      //             ])))
                    ]))))
      ],
    );
  }
}
