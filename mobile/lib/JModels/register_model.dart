import 'dart:convert';

Register postFromJson(String str) => Register.fromJson(json.decode(str));

String postToJson(Register data) => json.encode(data.toJson());

class Register {
  String name;
  String email;
  String password;
  int cpf;

  Register({
    this.name,
    this.email,
    this.password,
    this.cpf,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
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