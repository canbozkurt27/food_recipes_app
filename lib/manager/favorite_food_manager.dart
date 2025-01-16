import 'package:food_recipes_app/manager/food_list_manager.dart';
import 'package:food_recipes_app/ui/home/model/food_list_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteFoodManager {
  static var favoriteFoodList = Rx<List<FoodListModel>>([]);

  void addFavoriteFood(FoodListModel foodListModel) {
    favoriteFoodList.value.add(foodListModel);
  }

  Future<void> getFavFoodsFromLocale() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var favFoodsLocale = sharedPreferences.getStringList("favFoods");

    if (favFoodsLocale != null) {
     for (var i = 0; i < FoodListManager.foodList.length; i++) {
       if ( favFoodsLocale.contains(FoodListManager.foodList[i].name)) {
         favoriteFoodList.value.add(FoodListManager.foodList[i]);
       }
     }
    }
  }

  Future<void> setFavFoodsFromLocale() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList(
        "favFoods", favoriteFoodList.value.map((x) => x.name).toList());
  }
}
