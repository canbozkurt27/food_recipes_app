import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes_app/const/app_color.dart';
import 'package:food_recipes_app/ui/auth/register_screen/controller/register_controller.dart';
import 'package:food_recipes_app/utils/button_utils.dart';
import 'package:food_recipes_app/utils/loading_utils.dart';
import 'package:food_recipes_app/utils/text_style_utils.dart';
import 'package:food_recipes_app/utils/textfield_utils.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Get.width * 0.06, right: Get.width * 0.06),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: Get.height * 0.1),
                      child: Text(
                        "Kayıt Ol,",
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
                        "Mail ve İsim bilgilerinizi girerek kayıt olun!",
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
                            registerController.nameTextEditingController,
                        text: "İsim",
                        hinttext: "İsminizi giriniz",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Get.height * 0.02),
                      child: TextfieldUtils(
                        textEditingController:
                            registerController.mailTextEditingController,
                        text: "Email",
                        hinttext: "Email adresinizi giriniz",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Get.height * 0.02),
                      child: TextfieldUtils(
                        textEditingController:
                            registerController.passwordTextEditingController,
                        text: "Şifre",
                        hinttext: "Şifrenizi giriniz",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Get.height * 0.02),
                      child: Center(
                        child: ButtonUtils().defaultButton(
                          text: "Kayıt Ol",
                          onPressed: () {
                            registerController.tapRegisterButton();
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
                visible: registerController.isLoading.value,
                child: LoadingUtils(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
