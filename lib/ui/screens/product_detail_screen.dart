import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../domain/blocs/bloc_cart/cart_bloc.dart';
import '../screens.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductDetail product;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeith = MediaQuery.of(context).size.height;

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => context.go('/cart'),
      //   child: BlocBuilder<CartBloc, CartState>(
      //     builder: (context, state) {
      //       return Badge(
      //         value: state.products.length.toString(),
      //         child: const Icon(Icons.shopping_cart),
      //       );
      //     },
      //   ),
      // ),
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        elevation: 0,
        toolbarHeight: 75,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.ios_share_outlined),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: screenWidth * 0.8,
                height: screenHeith * 0.4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    width: screenWidth * 0.9,
                    imageUrl: product.image,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 50),
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
                      product.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 0.05,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            "\$${product.price}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border_outlined),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    // TODO
                    // btn que añade productos al carrito
                    ButtonCartWidget(
                      label: 'add',
                      icon: Icons.add,
                      onPressed: () {
                        context.read<CartBloc>().add(AddProductToCart(product));
                      },
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          product.description,
                          maxLines: 8,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 0.032,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// numero de productos dentro del carrito que se muestra en icon
// class Badge extends StatelessWidget {
//   final String value;
//   final Widget child;

//   const Badge({super.key, required this.value, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         child,
//         Positioned(
//           right: 0,
//           child: CircleAvatar(
//             radius: 0,
//             backgroundColor: Colors.red,
//             child: Text(
//               value,
//               style: const TextStyle(fontSize: 12, color: Colors.white),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
