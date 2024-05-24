import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CounterButton({super.key, required this.icon, required this.onPressed});

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  bool agregadoAlCarrito = false;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        setState(() {
          // cambiar el estado al presionar el botón
        });
      },
      label: Text(agregadoAlCarrito
          ? 'Already added'
          : 'add to cart'), // cambia a ya agregado
      icon: Icon(agregadoAlCarrito ? Icons.done : Icons.add), // cambia el icono
    );
  }
}
