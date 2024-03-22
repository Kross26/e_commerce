import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/ui/screens.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductDetail product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      //TODO AGREGAR FLOATINGACTIONBUTTON :::)))))
      // CounterButton(icon: (Icons.add), onPressed: () {},),
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
                ),
              ],
            ),
            Expanded(
              child: CachedNetworkImage(
                width: screenWidht * 0.9,
                imageUrl: widget.product.image,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
                      widget.product.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidht * 0.04,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "\$${widget.product.price}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidht * 0.03,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      widget.product.description,
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
