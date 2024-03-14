import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_onboard_splash/pages/onboard_page.dart';
import 'package:task_onboard_splash/pages/order_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isOrder;

  void getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isOrder = prefs.getBool("Order");
    setState(() {});
  }

  @override
  void initState(){
    super.initState();
    getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isOrder == true ? const OrderPage(): const OnboardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
