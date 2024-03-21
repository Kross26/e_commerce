import 'package:e_commerce/domain/entities/product_detail.dart';
import 'package:e_commerce/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

class ProductCardReusable extends StatelessWidget {
  const ProductCardReusable({
    super.key,
    required this.product,
  });

  final ProductDetail product;
//todo hacer tamaño responisvooo
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                        product: product,
                      )));
        },
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: screenHeight * 0.10,
                  width: screenWidht * 0.18,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.network(
                    product.image,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${product.title}",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: screenWidht * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidht * 0.03,
                      ),
                    ),
                    IconButton(
                      iconSize: screenWidht * 0.04,
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border_rounded),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
