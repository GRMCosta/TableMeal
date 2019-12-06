import 'package:flutter/material.dart';
import 'package:mobile/JDatas/foods_datas.dart';
import 'package:mobile/Models/user_model.dart';
import 'package:mobile/Models/cart_model.dart';
import 'package:mobile/Screens/login_screen.dart';


class CartTile extends StatelessWidget {
  final List<Food> response;
  final int index;


  CartTile(this.response, this.index);

//Fazer o Scroll de Atualização
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 100.0,
            child: Image.network(
              response[index].thumbnailUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  response[index].name,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                Divider(),
                Text(
                  response[index].type +
                      "  R\$:" +
                      response[index].price.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                Divider(),
                Text(
                  response[index].description,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                child: Text("Excluir do carrinho"),
                textColor: Colors.blue,
                padding: EdgeInsets.zero,
                onPressed: () {
                    CartModel.of(context).removeCartItem(response[index]);
                    print(CartModel.of(context).products.length);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
