import 'package:flutter/material.dart';
import 'package:food_recipes_app/ui/splash/controller/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreenView extends StatelessWidget {
  SplashScreenView({super.key});
  final SplashScreenController splashScreenController = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
