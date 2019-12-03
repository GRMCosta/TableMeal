import 'package:flutter/material.dart';
import 'package:mobile/JDatas/restaurants_datas.dart';
import 'package:mobile/Screens/menu_screen.dart';

class PlaceTile extends StatelessWidget {
  final RestaurantsList response;
  final int index;

  PlaceTile(this.response,this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  response.restaurants[index].name,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Ver cardápio"),
                textColor: Colors.blue,
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MenuScreen(response.restaurants[index].id)));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
