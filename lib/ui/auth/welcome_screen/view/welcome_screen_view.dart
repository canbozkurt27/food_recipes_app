import 'package:flutter/material.dart';
import 'package:food_recipes_app/ui/auth/welcome_screen/controller/welcome_screen_controller.dart';
import 'package:food_recipes_app/utils/button_utils.dart';
import 'package:food_recipes_app/utils/image_utils.dart';
import 'package:food_recipes_app/utils/text_style_utils.dart';
import 'package:get/get.dart';

class WelcomeScreenView extends StatelessWidget {
  WelcomeScreenView({super.key});
  final WelcomeScreenController welcomeScreenController = Get.put(WelcomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ImageUtil.assetImageUtil(
              imageName: "login_background.jpeg",
              height: Get.height,
              width: Get.width,
            ),
            Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black54.withOpacity(0.4),
                    Colors.black54.withOpacity(0.45),
                    Colors.black54.withOpacity(0.5),
                    Colors.black54.withOpacity(0.65),
                    Colors.black54.withOpacity(0.75),
                    Colors.black54.withOpacity(0.8),
                    Colors.black.withOpacity(0.95),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.1, bottom: Get.height * 0.02),
                    child: ImageUtil.assetImageUtil(
                      imageName: "chef.png",
                      height: Get.height * 0.085,
                    ),
                  ),
                  Text(
                    "100'ün Üzerinde Yemek Tarifi",
                    style: TextStyleUtils.generalPoppinMediumTextStyle(
                      14,
                      Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.3),
                    child: Text(
                      "Yemek Tariflerine\nBaşla",
                      style: TextStyleUtils.generalPoppinBoldTextStyle(
                        30,
                        Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.02),
                    child: Text(
                      "Kolay,pratik ve denenmiş binlerce tarif ihtiyacınız olan yemeklerin tariflerini bulun",
                      style: TextStyleUtils.generalPoppinRegularTextStyle(
                        15,
                        Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: Get.height * .03),
                    child: ButtonUtils().defaultButton(
                        text: "Keşfetmeye Başla",
                        onPressed: () {
                          welcomeScreenController.tapStartButton();
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
