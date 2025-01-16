import 'package:flutter/material.dart';
import 'package:food_recipes_app/const/app_color.dart';
import 'package:food_recipes_app/utils/text_style_utils.dart';
import 'package:get/get.dart';

class TextfieldUtils extends StatelessWidget {
  const TextfieldUtils(
      {super.key,
      required this.text,
      required this.hinttext,
      required this.textEditingController,
      this.maxLines});
  final String text;
  final String hinttext;
  final TextEditingController textEditingController;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
        ),
        Padding(
          padding: EdgeInsets.only(top: Get.height * 0.01),
          child: TextFormField(
            maxLines: maxLines,
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: hinttext,
              hintStyle: TextStyleUtils.generalPoppinLightTextStyle(
                  12, AppColors.textfieldBordergrey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.textfieldBordergrey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.textfieldBordergrey,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.textfieldBordergrey,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
