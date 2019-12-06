import 'package:mobile/JServices/restaurant_services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:mobile/JDatas/foods_datas.dart';
import 'package:mobile/Models/user_model.dart';
import 'package:flutter/material.dart';

class CartModel extends Model {
  UserModel user;

  List<String> productsJson = [];
  List<Food> products = [];

  CartModel(this.user);

  static CartModel of(BuildContext context) =>
      ScopedModel.of<CartModel>(context);

  void createOrder(
      {@required int table,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) {

    createPost(productsJson, table).then((response)
    {if(!response.body.contains("error")){
      onSuccess();
      removeAllCart();
      notifyListeners();}
      else{
        onFail();
    }
    });
  }

  void addCartItem(Food food) {
    productsJson.add(food.id);
    products.add(food);
    notifyListeners();
  }

  void removeCartItem(Food food) {
    productsJson.remove(food.id);
    products.add(food);
    notifyListeners();
  }

  void removeAllCart() {
    productsJson.clear();
    products.clear();
    notifyListeners();
  }
}
