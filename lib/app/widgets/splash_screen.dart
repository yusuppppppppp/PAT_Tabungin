import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFEC2028),
        body: Center(
          child: SizedBox(
            width: Get.width * 0.5,
            height: Get.width * 0.5,
            child: Image.asset("assets/image/splash_screen/tabungin.png"),
          ),
        ),
      ),
    );
  }
}