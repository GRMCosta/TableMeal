import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';


String _urlRestaurants = 'http://192.168.0.4:9999/sessions';
String _urlFoods = 'http://192.168.0.4:9999/food';

Future<http.Response> getUsers() async {
  final response = await http.get('$_urlRestaurants');
  return response;
}

Future<http.Response> getFoods(int userId) async {
  final response = await http.get(
      '$_urlFoods?user_id=$userId', headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
  });
  return response;
}