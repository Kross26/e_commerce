import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CounterButton({super.key, required this.icon, required this.onPressed});

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _isChecked = !_isChecked; // Cambia el estado del icono
        });
        widget
            .onPressed(); // Llama a la función onPressed definida en CounterButton
      },
      child: _isChecked
          ? const Icon(Icons.check)
          : Icon(widget.icon), // Cambia el icono según el estado
    );
  }
}
