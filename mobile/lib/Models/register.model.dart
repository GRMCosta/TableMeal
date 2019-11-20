import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class Post {
  final String nome;
  final int cpf;
  final String email;
  final String senha;

  Post({this.nome, this.cpf, this.email, this.senha});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      nome: json['nome'],
      cpf: json['cpf'],
      email: json['email'],
      senha: json['senha'],
    );
  }
}

Future<Post> fetchPost() async {
  final response =
  await http.get('http://192.112.321.2:9999/clients');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}