import 'package:flutter/material.dart';
import 'package:food_recipes_app/const/app_color.dart';
import 'package:food_recipes_app/manager/favorite_food_manager.dart';
import 'package:food_recipes_app/ui/food_detail/controller/food_detail_controller.dart';
import 'package:food_recipes_app/utils/image_utils.dart';
import 'package:food_recipes_app/utils/text_style_utils.dart';
import 'package:get/get.dart';

class FoodDetailView extends StatelessWidget {
  const FoodDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    final FoodDetailController foodDetailController =
        Get.put(FoodDetailController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  foodDetailController.foodListModel.image
                          .contains("assets/images")
                      ? ImageUtil.assetImageUtilv2(
                          imageName: foodDetailController.foodListModel.image,
                          width: Get.width,
                          height: Get.height * 0.35,
                        )
                      : Image.network(
                          foodDetailController.foodListModel.image,
                          width: Get.width,
                          height: Get.height * 0.35,
                          fit: BoxFit.cover,
                        ),
                  Positioned(
                    top: Get.height * 0.02,
                    right: Get.height * 0.02,
                    child: InkWell(
                      onTap: () {
                        foodDetailController.addFavorite();
                      },
                      child: Card(
                        elevation: 4,
                        shape: const CircleBorder(),
                        margin: EdgeInsets.zero,
                        color: Colors.black.withOpacity(0.2),
                        child: Container(
                          height: Get.height * 0.06,
                          width: Get.height * 0.06,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Obx(
                            () => Icon(
                              FavoriteFoodManager.favoriteFoodList.value
                                      .contains(
                                foodDetailController.foodListModel,
                              )
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: const Color.fromARGB(255, 227, 29, 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.06,
                    right: Get.width * 0.06,
                    top: Get.height * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: AppColors.buttonColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: Get.height * 0.025,
                              child: FittedBox(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: Get.height * 0.01,
                                      bottom: Get.height * 0.01,
                                      left: Get.width * 0.03),
                                  child: const Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: Get.width * 0.01,
                                  right: Get.width * 0.03),
                              child: Text(
                                "${foodDetailController.foodListModel.rating}",
                                style: TextStyleUtils
                                    .generalPoppinRegularTextStyle(
                                        12, Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Text(
                      foodDetailController.foodListModel.name,
                      style: TextStyleUtils.generalPoppinMediumTextStyle(
                        15,
                        Colors.black,
                      ),
                    ),
                    Text(
                      foodDetailController.foodListModel.category,
                      style: TextStyleUtils.generalPoppinMediumTextStyle(
                        15,
                        Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Text(
                      "Tarif:",
                      style: TextStyleUtils.generalPoppinBoldTextStyle(
                        18,
                        Colors.black,
                      ),
                    ),
                    Text(
                      foodDetailController.foodListModel.recipe ?? "",
                      style: TextStyleUtils.generalPoppinRegularTextStyle(
                        15,
                        Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
