import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/controller/user_controller.dart';
import 'package:food_recipes_app/manager/user_manager.dart';
import 'package:food_recipes_app/services/user_services.dart';
import 'package:food_recipes_app/ui/admin/food_list/view/food_list_view.dart';
import 'package:food_recipes_app/ui/auth/register_screen/view/register_view.dart';
import 'package:get/get.dart';

import '../../../main_menu/view/main_menu.dart';

class LoginScreenController extends GetxController {
  TextEditingController mailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  UserServices userServices = UserServices();
  RxBool isLoading = false.obs;

  Future<void> tapLoginButton() async {
    if (mailTextEditingController.text == "admin") {
      if (passwordTextEditingController.text == "admin") {
        Get.to(FoodListView());
      } else {
        //hata ver
      }
      return;
    }
    isLoading.value = true;

    var model = await userServices.getUser(mailTextEditingController.text);
    isLoading.value = false;
    if (model == null) {
      //Kullanıcıya hata ver
      return;
    }
    var validate = validatePassword(model.password);
    if (validate) {
      UserManager.userModel = model;
      UserController().setUserFromLocale(model.mail);

      Get.to(MainMenu());
    } else {
      //TODO şifren yanlış uyarısı ver
    }
  }

  bool validatePassword(String password) {
    return password == passwordTextEditingController.text;
  }

  void tapRegisterButton() {
    Get.to(RegisterView());
  }
}
