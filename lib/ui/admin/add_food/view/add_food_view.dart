import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_recipes_app/ui/admin/add_food/controller/add_food_controller.dart';
import 'package:food_recipes_app/ui/home/model/food_list_model.dart';
import 'package:food_recipes_app/utils/button_utils.dart';
import 'package:food_recipes_app/utils/loading_utils.dart';
import 'package:food_recipes_app/utils/text_style_utils.dart';
import 'package:food_recipes_app/utils/textfield_utils.dart';
import 'package:get/get.dart';

class AddFoodView extends StatelessWidget {
  const AddFoodView({super.key});

  @override
  Widget build(BuildContext context) {
    AddFoodController addFoodController = Get.put(AddFoodController());
    
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.05),
                    child: Text(
                      "Tarif Ekle",
                      style: TextStyleUtils.generalPoppinMediumTextStyle(
                          25, Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.06,
                        right: Get.width * 0.06,
                        top: Get.height * 0.03),
                    child: Column(
                      children: [
                        TextfieldUtils(
                          text: "Tarif Adı",
                          hinttext: "Tarif Adı Giriniz",
                          textEditingController:
                              addFoodController.nameController,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: Get.height * 0.01),
                          child: TextfieldUtils(
                            text: "Kategori",
                            hinttext: "Kategori Giriniz",
                            textEditingController:
                                addFoodController.categoryController,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: Get.height * 0.01),
                          child: TextfieldUtils(
                            text: "Resim Linki",
                            hinttext: "Resim Linki Giriniz",
                            textEditingController:
                                addFoodController.urlController,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: Get.height * 0.01),
                          child: TextfieldUtils(
                            text: "Tarif Detayı",
                            hinttext: "Tarif Detayı Giriniz",
                            maxLines: 4,
                            textEditingController:
                                addFoodController.recipeController,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: Get.height * 0.02),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Puan",
                              style:
                                  TextStyleUtils.generalPoppinMediumTextStyle(
                                      15, Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: Get.height * 0.01),
                          child: RatingBar.builder(
                            initialRating: addFoodController.rating.value,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemSize: Get.width * 0.085,
                            itemCount: 10,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 5,
                            ),
                            onRatingUpdate: (rating) {
                              addFoodController.rating.value = rating;
                            },
                          ),
                        ),
                        Obx(
                          () => Text(
                            addFoodController.rating.value.toString(),
                            style: TextStyleUtils.generalPoppinMediumTextStyle(
                                20, Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: Get.height * 0.03),
                          child: ButtonUtils().defaultButton(
                              text: "Ekle",
                              onPressed: () {
                                addFoodController.addFood(FoodListModel(
                                  name: addFoodController.nameController.text,
                                  image: addFoodController.urlController.text,
                                  rating: addFoodController.rating.value,
                                  category:
                                      addFoodController.categoryController.text,
                                  recipe:
                                      addFoodController.recipeController.text,
                                ));
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Obx(() => addFoodController.isLoading.value
                ? const LoadingUtils()
                : const SizedBox()),
          ],
        ),
      ),
    );
  }
}
