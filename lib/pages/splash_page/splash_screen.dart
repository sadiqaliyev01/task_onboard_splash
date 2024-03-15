import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:task_onboard_splash/constants/color_constants.dart';
import 'package:task_onboard_splash/pages/onboard_page/onboard_screen.dart';
import 'package:task_onboard_splash/pages/splash_page/widgets/splash_title.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).whenComplete(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants().transparent,
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const SplashTitle(),
            Center(
              child: FadeInLeft(
                child: Image.asset("assets/png_images/sushi_splash.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
