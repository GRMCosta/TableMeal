import 'package:scoped_model/scoped_model.dart';
import 'package:mobile/JDatas/foods_datas.dart';
import 'package:mobile/Models/user_model.dart';
import 'package:flutter/material.dart';

class CartModel extends Model {
  UserModel user;

  List<Map<String, dynamic>> products = [];

  CartModel(this.user);

  static CartModel of(BuildContext context) =>
      ScopedModel.of<CartModel>(context);

  void addCartItem(Food food) {
    products.add(food.toJson());
    notifyListeners();
  }

  void removeCartItem(Food food) {
    products.remove(food.toJson());
    notifyListeners();
  }

  void removeAllCart() {
    products.clear();
    notifyListeners();
  }
}
