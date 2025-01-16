import 'package:flutter/material.dart';
import 'package:food_recipes_app/manager/food_list_manager.dart';
import 'package:food_recipes_app/ui/home/controller/home_screen_controller.dart';
import 'package:food_recipes_app/ui/home/model/food_list_model.dart';
import 'package:food_recipes_app/ui/home/widget/food_item_widget.dart';
import 'package:get/get.dart';

class FoodListWidget extends StatelessWidget {
  const FoodListWidget({super.key, required this.homeScreenController});
  final HomeScreenController homeScreenController;
  @override
  Widget build(BuildContext context) {
    List<FoodListModel> newList = FoodListManager.foodList
        .where((element) => element.rating > 8.8)
        .toList();
    return Padding(
      padding: EdgeInsets.only(
          left: Get.width * 0.06,
          right: Get.width * 0.06,
          top: Get.height * 0.03),
      child: Column(
        children: [
          for (int i = 0; i < (newList.length / 4).ceil(); i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    FoodItemWidget(
                      foodListModel: newList[i * 4],
                      isLargerItem: true,
                    ),
                    newList.length - 1 < i * 4 + 2
                        ? const SizedBox()
                        : FoodItemWidget(
                            foodListModel: newList[i * 4 + 2],
                          )
                  ],
                ),
                Column(
                  children: [
                    newList.length - 1 < i * 4 + 1
                        ? const SizedBox()
                        : FoodItemWidget(
                            foodListModel: newList[i * 4 + 1],
                          ),
                    newList.length - 1 < i * 4 + 3
                        ? const SizedBox()
                        : FoodItemWidget(
                            foodListModel: newList[i * 4 + 3],
                            isLargerItem: true,
                          )
                  ],
                )
              ],
            ),
        ],
      ),
    );
  }
}
