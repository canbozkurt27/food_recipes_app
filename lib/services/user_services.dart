import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_recipes_app/core/model/user_model.dart';

class UserServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  Future<UserModel?> getUser(String docId) async {
    try {
      var response = await users.doc(docId).get();

      return UserModel.fromMap(response.data() as Map<String, dynamic>);
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<bool> setUser(UserModel userModel) async {
    await users.doc(userModel.mail).set(jsonDecode(userModel.toJson())).then(
      (a) {
        return true;
      },
    ).catchError(
      (data, stack) async {
        return false;
      },
    );
    return true;
  }
}
