import 'package:flutter/material.dart';
import 'package:food_recipes_app/const/app_color.dart';
import 'package:food_recipes_app/utils/text_style_utils.dart';
import 'package:get/get.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * 0.13, right: Get.width * 0.13, top: Get.height * 0.06),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: Get.width * 0.04),
            suffixIconConstraints: BoxConstraints(maxWidth: Get.height * 0.04 + Get.width * 0.03),
            suffixIcon: Container(
              height: Get.height * 0.04,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.buttonColor,
              ),
              child: const Center(
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
            hintText: "Tarif Ara",
            hintStyle: TextStyleUtils.generalPoppinLightTextStyle(12, AppColors.textfieldBordergrey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.textfieldBordergrey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: AppColors.textfieldBordergrey,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: AppColors.textfieldBordergrey,
                width: 1,
              ),
            )),
      ),
    );
  }
}
