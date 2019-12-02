import 'dart:convert';
import 'package:flutter/cupertino.dart';

Food foodFromJson(String str) => Food.fromJson(json.decode(str));

String foodToJson(Food data) => json.encode(data.toJson());

FoodsList foodsListFromJson(String str) => FoodsList.fromJson(json.decode(str));

String foodsListToJson(FoodsList data) => json.encode(data);

class FoodsList{

  List<Food> foods;

  FoodsList({this.foods});

  factory FoodsList.fromJson(List<dynamic> parsedJson){
    List<Food> foods = new List<Food>();
    foods = parsedJson.map((i)=>Food.fromJson(i)).toList();

    return new FoodsList(
        foods: foods
    );
  }
  List<dynamic> toJson() => {

};
}

class Food{
  int id;
  int user;
  Image image;
  String name;
  int price;
  String description;
  String type;

  Food({
    this.id,
    this.user,
    this.image,
    this.name,
    this.price,
    this.description,
    this.type
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: json["_id"],
    user: json["user"],
    image: json["image"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "image": image,
    "name": name,
    "price": price,
    "description": description,
    "type": type,
  };
}
