import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_recipes_app/core/model/user_model.dart';
import 'package:food_recipes_app/manager/food_list_manager.dart';
import 'package:food_recipes_app/ui/home/model/food_list_model.dart';

class FoodServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference foods = FirebaseFirestore.instance.collection('Foods');

  Future<bool> setFood(FoodListModel foodListModel) async {
    await foods
        .doc(foodListModel.name)
        .set(jsonDecode(jsonEncode(foodListModel.toJson())))
        .then(
      (a) {
        return true;
      },
    ).catchError(
      (data, stack) async {
        print(data);

        print(stack);
        return false;
      },
    );
    return true;
  }

  Future<void> getFoodList() async {
    try {
      var response = await foods.get();
        FoodListManager.foodList.clear();

      response.docs.forEach((element) {
        FoodListManager.foodList
            .add(FoodListModel.fromMap(element.data() as Map<String,dynamic>));
      });
    } catch (e) {
      print(e);
    }
  }
}
