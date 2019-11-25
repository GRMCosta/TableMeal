import 'dart:io';
import 'package:mobile/JModels/register_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


String _url = 'http://177.126.3.189:9999/clients';

Future<Register> getPost(String nome) async{
  final response = await http.post('$_url?name=$nome');
  return postFromJson(response.body);
}

Future<http.Response> createPost(Register post) async{
  final response = await http.post('$_url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: postToJson(post)
  );
  return response;
}