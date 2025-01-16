import 'package:flutter/material.dart';
import 'package:food_recipes_app/const/app_color.dart';
import 'package:get/get.dart';

class LoadingUtils extends StatelessWidget {
  const LoadingUtils({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: Colors.black.withOpacity(0.4),
      child: Center(
        child: SizedBox(
          height: Get.height * 0.07,
          width: Get.height * 0.07,
          child: const CircularProgressIndicator(
            color: AppColors.buttonColor,
            strokeWidth: 6,
          ),
        ),
      ),
    );
  }
}
