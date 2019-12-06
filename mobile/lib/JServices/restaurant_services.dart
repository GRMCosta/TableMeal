import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mobile/JDatas/foods_datas.dart';
import 'dart:async';
import 'dart:convert';
import 'package:mobile/JDatas/restaurants_datas.dart';

String _urlRestaurants = 'http://172.20.10.10:9999/sessions';
String _urlFoods = 'http://172.20.10.10:9999/food';
String _urlOrder = 'http://172.20.10.10:9999/order';

Future<RestaurantsList> getUsers() async {
  final response = await http.get('$_urlRestaurants');
  return RestaurantsList.fromJson(json.decode(response.body));
}

Future<FoodsList> getFoods(String userId) async {
  final response =
      await http.get('$_urlFoods', headers: {"user_id": '$userId'});
  return FoodsList.fromJson(json.decode(response.body));
}

Future<http.Response> createOrder(
  List<Food> foodsList,
  int table,
) async {
  final response = await http.post('$_urlOrder', headers: {
    HttpHeaders.contentTypeHeader: 'application/json'
  },
      body: json.encode({
    "table": '$table',
    "foods": '$foodsList',
  })
  );

  return response;
}
