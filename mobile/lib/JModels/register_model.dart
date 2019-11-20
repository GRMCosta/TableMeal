import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  String name;
  String email;
  String password;
  int cpf;

  Post({
    this.name,
    this.email,
    this.password,
    this.cpf,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    cpf: json["cpf"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "cpf": cpf,
  };
}