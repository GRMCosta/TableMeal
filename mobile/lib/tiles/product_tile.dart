import 'package:flutter/material.dart';
import 'package:mobile/JDatas/foods_datas.dart';

class ProductTile extends StatelessWidget {
  final FoodsList response;
  final int index;

  ProductTile(this.response,this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 100.0,


          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  response.foods[index].name,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                Text(
                  response.foods[index].type+"  R\$:"+response.foods[index].price.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                Text(
                  response.foods[index].description,
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
                child: Text("Adicionar ao carrinho"),
                textColor: Colors.blue,
                padding: EdgeInsets.zero,
                onPressed: () {
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
