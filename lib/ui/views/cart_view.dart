import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  static const String name = 'cart_view';
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.green,
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: const Placeholder(),
    );
  }
}
