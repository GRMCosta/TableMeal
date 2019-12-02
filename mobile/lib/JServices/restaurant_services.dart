import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mobile/JDatas/foods_datas.dart';
import 'dart:async';
import 'dart:convert';
import 'package:mobile/JDatas/restaurants_datas.dart';

String _urlRestaurants = 'http://192.168.0.4:9999/sessions';
String _urlFoods = 'http://192.168.0.4:9999/food';

Future<RestaurantsList> getUsers() async {
  final response = await http.get('$_urlRestaurants');
  return RestaurantsList.fromJson(json.decode(response.body));
}

Future<FoodsList> getFoods(int userId) async {
  final response = await http.get('$_urlFoods?user_id=$userId');
  return FoodsList.fromJson(json.decode(response.body));
}

Future<http.Response> createOrder(FoodsList foodsList, int table,) async {
  final response = await http.post('$_urlFoods',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: ''
      },
      body: foodsListToJson(foodsList)+"table:");
  return response;
}
