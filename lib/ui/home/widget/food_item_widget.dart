import 'package:flutter/material.dart';
import 'package:food_recipes_app/const/app_color.dart';
import 'package:food_recipes_app/ui/food_detail/view/food_detail_view.dart';
import 'package:food_recipes_app/ui/home/controller/home_screen_controller.dart';
import 'package:food_recipes_app/ui/home/model/food_list_model.dart';
import 'package:food_recipes_app/utils/image_utils.dart';
import 'package:food_recipes_app/utils/text_style_utils.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class FoodItemWidget extends StatelessWidget {
  FoodItemWidget(
      {super.key, required this.foodListModel, this.isLargerItem = false});
  final FoodListModel foodListModel;
  bool isLargerItem = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(FoodDetailView(), arguments: foodListModel);
      },
      child: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.025),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: foodListModel.image.contains("assets/images")
                      ? ImageUtil.assetImageUtilv2(
                          imageName: foodListModel.image,
                          height: isLargerItem
                              ? Get.height * 0.26
                              : Get.height * 0.19,
                          width: Get.width * 0.4,
                        )
                      : Image.network(
                          foodListModel.image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            color: Colors.grey,
                            height: isLargerItem
                                ? Get.height * 0.26
                                : Get.height * 0.19,
                            width: Get.width * 0.4,
                          ),
                          height: isLargerItem
                              ? Get.height * 0.26
                              : Get.height * 0.19,
                          width: Get.width * 0.4,
                        ),
                ),
                Positioned(
                  top: Get.height * 0.005,
                  left: Get.height * 0.005,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: AppColors.buttonColor),
                    child: Row(
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
                              left: Get.width * 0.01, right: Get.width * 0.03),
                          child: Text(
                            "${foodListModel.rating}",
                            style: TextStyleUtils.generalPoppinRegularTextStyle(
                                12, Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.016),
              child: SizedBox(
                width: Get.width * 0.4,
                child: Text(
                  foodListModel.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleUtils.generalPoppinMediumTextStyle(
                      15, Colors.black),
                ),
              ),
            ),
            SizedBox(
              width: Get.width * 0.4,
              child: Text(
                foodListModel.category,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyleUtils.generalPoppinLightTextStyle(12, Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
