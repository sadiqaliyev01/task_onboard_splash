import 'package:flutter/material.dart';

class LeftButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LeftButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Icon(Icons.keyboard_double_arrow_left_sharp),
    );
  }
}