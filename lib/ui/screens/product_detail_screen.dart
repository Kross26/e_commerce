import 'package:e_commerce/domain/entities/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductDetail product;

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_bag_outlined),
                )
              ],
            ),
            Expanded(child: Image.network("${product.image}")),
            Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.grey.shade300,
              ),
              child: Column(
                children: [
                  Text(
                    "${product.title}",
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidht * 0.04,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidht * 0.03,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    "${product.description}",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidht * 0.032,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
