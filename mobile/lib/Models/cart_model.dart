import 'package:mobile/JServices/restaurant_services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:mobile/JDatas/foods_datas.dart';
import 'package:mobile/Models/user_model.dart';
import 'package:flutter/material.dart';

class CartModel extends Model {
  UserModel user;

  List<Map<String, dynamic>> productsJson = [];
  List<Food> products = [];

  CartModel(this.user);

  static CartModel of(BuildContext context) =>
      ScopedModel.of<CartModel>(context);

  void createOrder(int table){
    createPost(productsJson, table);

  }

  void addCartItem(Food food) {
    productsJson.add(food.toJson());
    products.add(food);
    notifyListeners();
  }

  void removeCartItem(Food food) {
    productsJson.remove(food.toJson());
    products.add(food);
    notifyListeners();
  }

  void removeAllCart() {
    productsJson.clear();
    products.clear();
    notifyListeners();
  }
}
