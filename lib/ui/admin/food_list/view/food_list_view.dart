import 'package:flutter/material.dart';
import 'package:food_recipes_app/const/app_color.dart';
import 'package:food_recipes_app/core/controller/user_controller.dart';
import 'package:food_recipes_app/manager/food_list_manager.dart';
import 'package:food_recipes_app/manager/user_manager.dart';
import 'package:food_recipes_app/ui/admin/add_food/view/add_food_view.dart';
import 'package:food_recipes_app/ui/auth/welcome_screen/view/welcome_screen_view.dart';
import 'package:food_recipes_app/ui/home/widget/food_item_widget.dart';
import 'package:food_recipes_app/utils/button_utils.dart';
import 'package:food_recipes_app/utils/text_style_utils.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodListView extends StatelessWidget {
  const FoodListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.05),
                  child: SizedBox(
                    width: Get.width,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Text(
                          "Tarifler",
                          style: TextStyleUtils.generalPoppinMediumTextStyle(
                              25, Colors.black),
                        ),
                        Positioned(
                          top: -Get.height * 0.03,
                          right: Get.width * 0.03,
                          child: InkWell(
                            onTap: () async {
                              Get.to(WelcomeScreenView());
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.remove("mail");
                              UserManager.userModel = null;
                            },
                            child: Container(
                              height: Get.height * 0.05,
                              width: Get.height * 0.05,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.buttonColor,
                              ),
                              child: Center(
                                child: Text(
                                  "A",
                                  style: TextStyleUtils
                                      .generalPoppinMediumTextStyle(
                                    22,
                                    Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.02),
                  child: ButtonUtils().defaultButton(
                    width: Get.width * 0.88,
                    text: "Tarif Ekle",
                    onPressed: () {
                      Get.to(const AddFoodView());
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Get.width * 0.06,
                      right: Get.width * 0.06,
                      top: Get.height * 0.02),
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
                                FoodListManager.foodList.length - 1 < i * 4 + 2
                                    ? const SizedBox()
                                    : FoodItemWidget(
                                        foodListModel:
                                            FoodListManager.foodList[i * 4 + 2],
                                      )
                              ],
                            ),
                            Column(
                              children: [
                                FoodListManager.foodList.length - 1 < i * 4 + 1
                                    ? const SizedBox()
                                    : FoodItemWidget(
                                        foodListModel:
                                            FoodListManager.foodList[i * 4 + 1],
                                      ),
                                FoodListManager.foodList.length - 1 < i * 4 + 3
                                    ? const SizedBox()
                                    : FoodItemWidget(
                                        foodListModel:
                                            FoodListManager.foodList[i * 4 + 3],
                                        isLargerItem: true,
                                      )
                              ],
                            )
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
