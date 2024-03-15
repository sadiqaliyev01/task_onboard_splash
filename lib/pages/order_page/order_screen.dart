import 'package:flutter/material.dart';
import 'package:task_onboard_splash/pages/order_page/widgets/order_app_bar_text.dart';
import 'package:task_onboard_splash/pages/order_page/widgets/order_scaffold_body.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const OrderAppBarText(),
        ),
        body: const OrderScaffoldBody(),
      ),
    );
  }
}
