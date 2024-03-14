import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  final VoidCallback onLeftButtonPressed;
  final VoidCallback onRightButtonPressed;
  final bool isLastPage;

  const CustomButtons({
    super.key,
    required this.onLeftButtonPressed,
    required this.onRightButtonPressed,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: onLeftButtonPressed,
          child: const Icon(Icons.keyboard_double_arrow_left_sharp),
        ),
        ElevatedButton(
          onPressed: onRightButtonPressed,
          child: isLastPage
              ? const Icon(Icons.skip_next)
              : const Icon(Icons.keyboard_double_arrow_right_sharp),
        ),
      ],
    );
  }
}
