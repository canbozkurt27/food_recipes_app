import 'package:flutter/material.dart';
import 'package:food_recipes_app/manager/food_list_manager.dart';
import 'package:food_recipes_app/ui/home/widget/food_item_widget.dart';
import 'package:food_recipes_app/utils/text_style_utils.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tüm Tarifler",
                    style: TextStyleUtils.generalPoppinMediumTextStyle(
                        25, Colors.black),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.06,
                        right: Get.width * 0.06,
                        top: Get.height * 0.03),
                    child: Column(
                      children: [
                        for (int i = 0;
                            i < (FoodListManager.foodList.length / 4).ceil();
                            i++)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  FoodItemWidget(
                                    foodListModel:
                                        FoodListManager.foodList[i * 4],
                                    isLargerItem: true,
                                  ),
                                  FoodListManager.foodList.length - 1 <
                                          i * 4 + 2
                                      ? const SizedBox()
                                      : FoodItemWidget(
                                          foodListModel: FoodListManager
                                              .foodList[i * 4 + 2],
                                        )
                                ],
                              ),
                              Column(
                                children: [
                                  FoodListManager.foodList.length - 1 <
                                          i * 4 + 1
                                      ? const SizedBox()
                                      : FoodItemWidget(
                                          foodListModel: FoodListManager
                                              .foodList[i * 4 + 1],
                                        ),
                                  FoodListManager.foodList.length - 1 <
                                          i * 4 + 3
                                      ? const SizedBox()
                                      : FoodItemWidget(
                                          foodListModel: FoodListManager
                                              .foodList[i * 4 + 3],
                                          isLargerItem: true,
                                        )
                                ],
                              )
                            ],
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
