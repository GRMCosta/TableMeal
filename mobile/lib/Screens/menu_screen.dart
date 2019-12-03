import 'package:flutter/material.dart';
import 'package:mobile/JDatas/foods_datas.dart';
import 'package:mobile/JServices/restaurant_services.dart';
import 'package:mobile/tiles/product_tile.dart';

class MenuScreen extends StatelessWidget {
  final String userId;
  MenuScreen(this.userId);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FoodsList>(
      future: getFoods(userId),
      builder: (context, snapshot){
        if (!snapshot.hasData){
          print(snapshot.data);
          print(snapshot.error);
          return Center(
            child: CircularProgressIndicator(),
          );}
        else
          return Scaffold(
            appBar: AppBar(
              title: Text("Cardápio", style: TextStyle(color: Colors.white),),
              backgroundColor: Color.fromARGB(255, 97, 0, 0),
            ),
            body: ListView.builder(
                itemCount: snapshot.data.foods.length,
                itemBuilder: (context, index) =>
                    ProductTile(snapshot.data, index)
            ),
          );
      },
    );
  }
}