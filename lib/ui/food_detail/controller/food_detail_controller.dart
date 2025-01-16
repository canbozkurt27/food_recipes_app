import 'package:food_recipes_app/manager/favorite_food_manager.dart';
import 'package:food_recipes_app/ui/home/model/food_list_model.dart';
import 'package:get/get.dart';

class FoodDetailController extends GetxController {
  late FoodListModel foodListModel;
  @override
  void onInit() {
    foodListModel = Get.arguments;
    super.onInit();
  }

  void addFavorite() {
    if (!FavoriteFoodManager.favoriteFoodList.value.contains(foodListModel)) {
      FavoriteFoodManager.favoriteFoodList.value.add(foodListModel);
    } else {
      FavoriteFoodManager.favoriteFoodList.value.remove(foodListModel);
    }
    FavoriteFoodManager().setFavFoodsFromLocale();
    FavoriteFoodManager.favoriteFoodList.refresh();
  }
}
