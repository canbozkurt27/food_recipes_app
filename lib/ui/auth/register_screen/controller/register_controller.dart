import 'package:flutter/material.dart';
import 'package:food_recipes_app/core/controller/user_controller.dart';
import 'package:food_recipes_app/core/model/user_model.dart';
import 'package:food_recipes_app/manager/user_manager.dart';
import 'package:food_recipes_app/services/user_services.dart';
import 'package:food_recipes_app/ui/main_menu/view/main_menu.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController mailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  UserServices userServices = UserServices();
  RxBool isLoading = false.obs;

  Future<void> tapRegisterButton() async {
    var userModel = UserModel(
        name: nameTextEditingController.text,
        mail: mailTextEditingController.text,
        password: passwordTextEditingController.text);

    isLoading.value = true;
    var isSuccess = await userServices.setUser(userModel);
    isLoading.value = false;
    if (!isSuccess) {
      //UYARI
      return;
    }
    UserManager.userModel = userModel;
    UserController().setUserFromLocale(userModel.mail);
    Get.to(MainMenu());
  }
}
