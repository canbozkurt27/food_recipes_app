import 'package:food_recipes_app/ui/auth/login_screen/view/login_screen_view.dart';
import 'package:get/get.dart';

class WelcomeScreenController extends GetxController {
  void tapStartButton() {
    Get.to(LoginScreenView());
  }
}
