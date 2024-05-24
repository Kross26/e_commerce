import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  static const String name = 'slider_screen';
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidht = MediaQuery.of(context).size.width;
    return Placeholder();
    // return Scaffold(
    //     backgroundColor: Colors.white,
    //     body: Column(
    //       children: [
    //         // CachedNetworkImage(
    //         //   width: screenWidht * 0.9,
    //         //   imageUrl: '',
    //         //   progressIndicatorBuilder: (context, url, downloadProgress) =>
    //         //       CircularProgressIndicator(value: downloadProgress.progress),
    //         //   errorWidget: (context, url, error) => const Icon(Icons.error),
    //         // ),
    //         Row(
    //           children: [
    //             Text(
    //               '',
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: screenWidht * 0.03,
    //               ),
    //             )
    //           ],
    //         )
    //       ],
    //     ));
  }
}
