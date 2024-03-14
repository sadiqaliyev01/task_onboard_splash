import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';

class SplashTitle extends StatelessWidget {
  const SplashTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Welcome to the World of the Flavors!",
      style: TextStyle(
        color: ColorConstants().white,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
