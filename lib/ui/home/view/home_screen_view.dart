import 'package:flutter/material.dart';
import 'package:food_recipes_app/const/app_color.dart';
import 'package:food_recipes_app/core/controller/user_controller.dart';
import 'package:food_recipes_app/manager/user_manager.dart';
import 'package:food_recipes_app/ui/auth/welcome_screen/view/welcome_screen_view.dart';
import 'package:food_recipes_app/ui/home/controller/home_screen_controller.dart';
import 'package:food_recipes_app/ui/home/widget/food_list_widget.dart';
import 'package:food_recipes_app/ui/home/widget/search_widget.dart';
import 'package:food_recipes_app/utils/text_style_utils.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenView extends StatelessWidget {
  HomeScreenView({super.key});
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
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
                      "Popüler Tarfiler",
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
                              UserController().getProfileIconText() ?? "",
                              style:
                                  TextStyleUtils.generalPoppinMediumTextStyle(
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
            const SearchWidget(),
            FoodListWidget(
              homeScreenController: homeScreenController,
            ),
            SizedBox(
              height: Get.height * 0.05,
            )
          ],
        ),
      )),
    );
  }
}
