import 'package:flutter/material.dart';
import 'package:mobile/JDatas/foods_datas.dart';
import 'package:mobile/Models/user_model.dart';
import 'package:mobile/Models/cart_model.dart';
import 'package:mobile/Screens/login_screen.dart';


class ProductTile extends StatelessWidget {
  final FoodsList response;
  final int index;


  ProductTile(this.response, this.index);

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
              response.foods[index].thumbnailUrl,
              fit: BoxFit.cover,
            ),
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
                  response.foods[index].type +
                      "  R\$:" +
                      response.foods[index].price.toString(),
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
              RaisedButton(
                child: Text(UserModel.of(context).isLoggedIn
                    ? "Adicionar ao Carrinho"
                    : "Entre para comprar"),
                textColor: Colors.blue,
                padding: EdgeInsets.zero,
                onPressed: () {
                  if (UserModel.of(context).isLoggedIn) {
                    CartModel.of(context).addCartItem(response.foods[index]);
                    print(CartModel.of(context).products.length);
                  } else {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
