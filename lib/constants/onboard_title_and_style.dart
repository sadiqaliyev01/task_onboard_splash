import 'package:flutter/material.dart';
import 'package:task_onboard_splash/constants/color_constants.dart';

class OnboardTitleAndStyle extends StatelessWidget {
  final String title;

  const OnboardTitleAndStyle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: ColorConstants().white,
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
