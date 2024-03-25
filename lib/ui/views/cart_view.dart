import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../screens.dart';

class CartView extends StatelessWidget {
  const CartView({super.key, required this.product});

  final ProductDetail product;

  @override
  Widget build(BuildContext context) {
    double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CachedNetworkImage(
              width: screenWidht * 0.9,
              imageUrl: product.image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Row(
              children: [
                Text(
                  "\$${product.title}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidht * 0.03,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
