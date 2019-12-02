import 'package:flutter/material.dart';
import 'package:mobile/JDatas/restaurants_datas.dart';
import 'package:mobile/JServices/restaurant_services.dart';
import 'package:mobile/tiles/place_tile.dart';

class PlacesTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RestaurantsList>(
      future: getUsers(),
      builder: (context, snapshot) {
        if (!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );}
        else
          return ListView.builder(
            itemCount: snapshot.data.restaurants.length,
            itemBuilder: (context, index) =>
                PlaceTile(snapshot.data)
          );
      },
    );
  }
}
