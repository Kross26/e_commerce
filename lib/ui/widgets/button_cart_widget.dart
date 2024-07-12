import 'package:flutter/material.dart';

class ButtonCartWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isAdded;
  final VoidCallback? onPressed;

  const ButtonCartWidget({
    super.key,
    required this.icon,
    required this.label,
    this.isAdded = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: isAdded ? Colors.green : Colors.white,
      ),
    );
  }
}
