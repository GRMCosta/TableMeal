import 'dart:convert';

Restaurants restaurantsFromJson(String str) => Restaurants.fromJson(json.decode(str));

String restaurantsToJson(Restaurants data) => json.encode(data.toJson());

class Restaurants {
  String id;
  String name;
  String email;
  String password;
  int cnpj;
  int v;

  Restaurants({
    this.id,
    this.name,
    this.email,
    this.password,
    this.cnpj,
    this.v,
  });

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
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

class ListRestaurants{
  List<Restaurants> restaurants;

  ListRestaurants({this.restaurants});
}