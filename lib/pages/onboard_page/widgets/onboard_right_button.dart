import 'package:flutter/material.dart';

class RightButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLastPage;

  const RightButton({super.key, required this.onPressed, required this.isLastPage});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: isLastPage
          ? const Icon(Icons.skip_next)
          : const Icon(Icons.keyboard_double_arrow_right_sharp),
    );
  }
}