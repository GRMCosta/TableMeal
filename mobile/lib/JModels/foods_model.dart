import 'dart:convert';
import 'package:flutter/cupertino.dart';

Food postFromJson(String str) => Food.fromJson(json.decode(str));

String postToJson(Food data) => json.encode(data.toJson());

class Food{
  int userId;
  Image image;
  String name;
  int price;
  String description;
  String type;

  Food({
    this.userId,
    this.image,
    this.name,
    this.price,
    this.description,
    this.type
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        userId: json["userId"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "image": image,
        "name": name,
        "price": price,
        "description": description,
        "type": type,
      };
}
