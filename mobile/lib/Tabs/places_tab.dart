import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/JServices/restaurant_services.dart';
import 'package:mobile/tiles/place_tile.dart';

class PlacesTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: getUsers(),
      builder: (context, snapshot) {
        if (!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );}
        else
          return ListView.builder(
            itemCount: snapshot.data.contentLength,
            itemBuilder: (context, index) =>
                PlaceTile(json.decode(snapshot.data.body))
          );
      },
    );
  }
}
