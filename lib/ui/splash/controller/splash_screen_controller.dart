import 'package:food_recipes_app/core/controller/user_controller.dart';
import 'package:food_recipes_app/manager/favorite_food_manager.dart';
import 'package:food_recipes_app/manager/user_manager.dart';
import 'package:food_recipes_app/services/food_services.dart';
import 'package:food_recipes_app/services/user_services.dart';
import 'package:food_recipes_app/ui/auth/welcome_screen/view/welcome_screen_view.dart';
import 'package:food_recipes_app/ui/main_menu/view/main_menu.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  Future<void> onInit() async {
    await Future.delayed(const Duration(milliseconds: 1500));

    await FoodServices().getFoodList();

    FavoriteFoodManager().getFavFoodsFromLocale();
    var userMail = await UserController().getUserFromLocale();
    if (userMail == null) {
      Get.off(WelcomeScreenView());
    } else {
      var model = await UserServices().getUser(userMail);
      UserManager.userModel = model;
      Get.off(MainMenu());
    }
    super.onInit();
  }
}
