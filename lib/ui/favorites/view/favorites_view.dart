import 'package:flutter/material.dart';
import 'package:food_recipes_app/const/app_color.dart';
import 'package:food_recipes_app/manager/favorite_food_manager.dart';
import 'package:food_recipes_app/ui/food_detail/view/food_detail_view.dart';
import 'package:food_recipes_app/utils/image_utils.dart';
import 'package:food_recipes_app/utils/text_style_utils.dart';
import 'package:get/get.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.05),
                child: Text(
                  "Favori Tarifler",
                  style: TextStyleUtils.generalPoppinMediumTextStyle(
                      25, Colors.black),
                ),
              ),
              for (int i = 0;
                  i < FavoriteFoodManager.favoriteFoodList.value.length;
                  i++)
                InkWell(
                  onTap: () {
                    Get.to(FoodDetailView(),
                        arguments:
                            FavoriteFoodManager.favoriteFoodList.value[i]);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.02),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: FavoriteFoodManager
                                  .favoriteFoodList.value[i].image
                                  .contains("assets/images")
                              ? ImageUtil.assetImageUtilv2(
                                  imageName: FavoriteFoodManager
                                      .favoriteFoodList.value[i].image,
                                  height: Get.height * 0.19,
                                  width: Get.width * 0.86,
                                )
                              : Image.network(
                                  FavoriteFoodManager
                                      .favoriteFoodList.value[i].image,
                                  height: Get.height * 0.19,
                                  width: Get.width * 0.86,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Container(
                          height: Get.height * 0.19,
                          width: Get.width * 0.86,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black54.withOpacity(0.2),
                                    Colors.black54.withOpacity(0.3),
                                    Colors.black54.withOpacity(0.4),
                                    Colors.black54.withOpacity(0.5),
                                  ])),
                        ),
                        Container(
                          height: Get.height * 0.19,
                          width: Get.width * 0.86,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: Get.width * 0.04,
                                bottom: Get.height * 0.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FavoriteFoodManager
                                      .favoriteFoodList.value[i].name,
                                  style: TextStyleUtils
                                      .generalPoppinMediumTextStyle(
                                    15,
                                    Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      )),
    );
  }
}
