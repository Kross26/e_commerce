import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/ui/screens.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductDetail product;

  @override
  Widget build(BuildContext context) {
    double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      // boton
      floatingActionButton: CounterButton(
        icon: Icons.add,
        onPressed: () {},
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButton(),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, CartView.name); // navegacion a otra pantalla
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
            ),
            // cachednetworkimage package
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  width: screenWidht * 0.9,
                  imageUrl: product.image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      product.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidht * 0.04,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "\$${product.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidht * 0.03,
                          ),
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.favorite_border_outlined,
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      product.description,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidht * 0.032,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
