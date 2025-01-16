import 'package:flutter/material.dart';
import 'package:food_recipes_app/const/app_color.dart';
import 'package:food_recipes_app/utils/text_style_utils.dart';
import 'package:get/get.dart';

class ButtonUtils {
  Widget defaultButton({required String text, required void Function() onPressed, double? height, double? width}) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: height ?? Get.height * 0.07,
        width: width ?? Get.width * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.buttonColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyleUtils.generalPoppinMediumTextStyle(
              13,
              Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
