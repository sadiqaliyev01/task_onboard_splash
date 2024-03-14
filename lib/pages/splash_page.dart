import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:task_onboard_splash/constants/colors/color_constants.dart';
import 'package:task_onboard_splash/pages/onboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants().transparent,
        body: Column(
          children: [
            const SizedBox(height: 30,),
            Text(
              "Welcome to the World of the Flavors!",
              style: TextStyle(
                color: ColorConstants().white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
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

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).whenComplete(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }
}
