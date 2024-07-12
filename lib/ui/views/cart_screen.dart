import 'package:e_commerce/domain/entities/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/blocs/bloc_cart/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  static const String name = 'cart_view';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          elevation: 0.0,
          toolbarHeight: 75,
          backgroundColor: Colors.white,
          title: const Text('Cart'),
          centerTitle: true,
        ),
        extendBody: false,
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state.products.isEmpty) {
              return const Center(
                child: Text('No products in cart'),
              );
            }
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                ProductDetail product = state.products[index];
                return ListTile(
                  leading: Image.network(product.image),
                  title: Text(product.title),
                  subtitle: Text("\$${product.price}"),
                  onTap: () {},
                );
              },
            );
          },
        ));
  }
}
