import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_onboard_splash/pages/onboard_page/onboard_screen.dart';
import 'package:task_onboard_splash/pages/order_page/order_screen.dart';
import 'package:task_onboard_splash/pages/splash_page/splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isOrder;
  bool? isSplash;

  void getInstanceOrder() async {
    SharedPreferences prefsOrder = await SharedPreferences.getInstance();
    isOrder = prefsOrder.getBool("Order");
    setState(() {});
  }

  void getInstanceSplash() async {
    SharedPreferences prefsSplash = await SharedPreferences.getInstance();
    isSplash = prefsSplash.getBool('Splash');
  }

  @override
  void initState() {
    super.initState();
    getInstanceOrder();
    getInstanceSplash();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isOrder == true
          ? const OrderPage()
          : isSplash == false
              ? const SplashPage()
              : const OnboardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
