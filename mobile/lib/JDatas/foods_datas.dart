import 'dart:convert';

Food foodFromJson(String str) => Food.fromJson(json.decode(str));

String foodToJson(Food data) => json.encode(data.toJson());

FoodsList foodsListFromJson(String str) => FoodsList.fromJson(json.decode(str));

String foodsListToJson(FoodsList data) => json.encode(data);

class FoodsList {
  List<Food> foods;

  FoodsList({this.foods});

  factory FoodsList.fromJson(List<dynamic> parsedJson) {
    List<Food> foods = new List<Food>();
    foods = parsedJson.map((i) => Food.fromJson(i)).toList();

    return new FoodsList(foods: foods);
  }
}

class Food {
  String id;
  String user;
  String thumbnail;
  String thumbnailUrl;
  String name;
  double price;
  String description;
  String type;

  Food(
      {this.id,
      this.user,
      this.thumbnail,
      this.thumbnailUrl,
      this.name,
      this.price,
      this.description,
      this.type});

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["_id"],
        user: json["user"],
        thumbnail: json["thumbnail"],
        thumbnailUrl: json["thumbnail_url"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "thumbnail": thumbnail,
        "thumbnail_url": thumbnailUrl,
        "name": name,
        "price": price,
        "description": description,
        "type": type,
      };
}
