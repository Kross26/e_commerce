import 'package:e_commerce/ui/screens.dart';
import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CounterButton({super.key, required this.icon, required this.onPressed});

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CartView()),
        );
      },
      label: const Text('add to cart'),
      icon: const Icon(Icons.add),
    );
  }
}
