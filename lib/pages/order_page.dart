import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Order Page'),
      ),
      body: const Center(
        child: Text(
          "So what? Did you really think you could order it? HAHA-HA I wasn't excepting to laugh so hard. These sushi are only for special people, man, not for losers like you!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    ));
  }
}
