import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../order_page/order_screen.dart';

class OnboardSkipButton extends StatelessWidget {
  const OnboardSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        SharedPreferences prefsOrder = await SharedPreferences.getInstance();
        SharedPreferences prefsSplash = await SharedPreferences.getInstance();
        await prefsSplash.setBool('Splash', false);
        await prefsOrder.setBool('Order', true).then((value) {
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
