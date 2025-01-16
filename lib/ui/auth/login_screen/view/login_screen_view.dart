import 'package:flutter/material.dart';
import 'package:food_recipes_app/const/app_color.dart';
import 'package:food_recipes_app/ui/auth/login_screen/controller/login_screen_controller.dart';
import 'package:food_recipes_app/utils/button_utils.dart';
import 'package:food_recipes_app/utils/loading_utils.dart';
import 'package:food_recipes_app/utils/text_style_utils.dart';
import 'package:food_recipes_app/utils/textfield_utils.dart';
import 'package:get/get.dart';

class LoginScreenView extends StatelessWidget {
  LoginScreenView({super.key});
  final LoginScreenController loginScreenController =
      Get.put(LoginScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.06, right: Get.width * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: Get.height * 0.1),
                      child: Text(
                        "Merhaba,",
                        style: TextStyleUtils.generalPoppinSemiBoldTextStyle(
                          22,
                          Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Get.height * 0.0),
                      child: Text(
                        "Tekrar Hoşgeldiniz!",
                        style: TextStyleUtils.generalPoppinLightTextStyle(
                          22,
                          Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Get.height * 0.09),
                      child: TextfieldUtils(
                        textEditingController:
                            loginScreenController.mailTextEditingController,
                        text: "Email",
                        hinttext: "Email adresinizi giriniz",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Get.height * 0.03),
                      child: TextfieldUtils(
                        textEditingController:
                            loginScreenController.passwordTextEditingController,
                        text: "Şifre",
                        hinttext: "Şifrenizi giriniz",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Get.height * 0.06),
                      child: Center(
                        child: ButtonUtils().defaultButton(
                            text: "Giriş Yap",
                            onPressed: () {
                              loginScreenController.tapLoginButton();
                            },
                            width: Get.width * 1),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Get.height * 0.02),
                      child: Center(
                        child: ButtonUtils().defaultButton(
                          text: "Kayıt Ol",
                          onPressed: () {
                            loginScreenController.tapRegisterButton();
                          },
                          width: Get.width * 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: loginScreenController.isLoading.value,
                child: LoadingUtils(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
