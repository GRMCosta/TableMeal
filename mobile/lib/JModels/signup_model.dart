import 'dart:convert';

SignUp postFromJson(String str) => SignUp.fromJson(json.decode(str));

String postToJson(SignUp data) => json.encode(data.toJson());

class SignUp {
  String name;
  String email;
  String password;
  int cpf;

  SignUp({
    this.name,
    this.email,
    this.password,
    this.cpf,
  });

  factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
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