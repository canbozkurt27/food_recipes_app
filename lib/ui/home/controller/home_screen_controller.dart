import 'package:food_recipes_app/ui/food_detail/view/food_detail_view.dart';
import 'package:food_recipes_app/ui/home/model/food_list_model.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {

  void tapFoodItem(FoodListModel foodListModel) {
    Get.to(FoodDetailView(), arguments: foodListModel);
  }
}
