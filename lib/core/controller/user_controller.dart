import 'package:food_recipes_app/manager/user_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  
  Future<void> setUserFromLocale(String mail) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("mail", mail);
  }

  Future<String?> getUserFromLocale() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("mail");
  }

  String? getProfileIconText() {
    return UserManager.userModel?.name[0];
  }

  
}
