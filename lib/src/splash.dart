import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intuition/src/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "INTUITION",
          style: TextStyle(fontSize: 32, letterSpacing: 3),
        ),
      ),
    );
  }
}
