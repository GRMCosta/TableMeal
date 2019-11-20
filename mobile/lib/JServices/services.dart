import 'package:mobile/JModels/register_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';


String url = 'http://localhost:9999/clients';

Future<Post> getPost() async{
  final response = await http.post('$url?name=Matheus');
  return postFromJson(response.body);
}