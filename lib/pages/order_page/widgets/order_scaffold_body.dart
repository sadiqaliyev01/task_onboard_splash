import 'package:flutter/material.dart';

class OrderScaffoldBody extends StatelessWidget {
  const OrderScaffoldBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "So what? Did you really think you could order it? HAHA-HA I wasn't excepting to laugh so hard. These sushi are only for special people, man, not for losers like you!",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
