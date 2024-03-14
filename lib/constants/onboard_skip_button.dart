import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/order_page/order_screen.dart';

class OnboardSkipButton extends StatelessWidget {
  const OnboardSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('Order', true).then((value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const OrderPage()),
          );
        });
      },
      child: const Text(
        "Skip",
      ),
    );
  }
}
