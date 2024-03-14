import 'package:flutter/material.dart';

import '../../colors/color_constants.dart';

class OnboardDescriptionAndStyle extends StatelessWidget {

  final String description;

  const OnboardDescriptionAndStyle({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        color: ColorConstants().white,
        fontSize: 24,
        fontWeight: FontWeight.w300,
      ),
      textAlign: TextAlign.center,
    );
  }
}
