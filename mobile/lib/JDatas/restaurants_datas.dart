import 'dart:convert';

Restaurant restaurantFromJson(String str) => Restaurant.fromJson(json.decode(str));

String restaurantToJson(Restaurant data) => json.encode(data.toJson());

class RestaurantsList{

  List<Restaurant> restaurants;

  RestaurantsList({this.restaurants});

  factory RestaurantsList.fromJson(List<dynamic> parsedJson){
    List<Restaurant> restaurants = new List<Restaurant>();
    restaurants = parsedJson.map((i)=>Restaurant.fromJson(i)).toList();

    return new RestaurantsList(
        restaurants: restaurants
    );
  }
}

class Restaurant {
  String id;
  String name;
  String email;
  String password;
  int cnpj;
  int v;

  Restaurant({
    this.id,
    this.name,
    this.email,
    this.password,
    this.cnpj,
    this.v,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    cnpj: json["cnpj"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "password": password,
    "cnpj": cnpj,
    "__v": v,
  };
}

