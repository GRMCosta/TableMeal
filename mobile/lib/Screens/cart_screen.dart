import 'package:flutter/material.dart';
import 'package:mobile/JServices/restaurant_services.dart';
import 'package:mobile/Models/cart_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:mobile/tiles/cart_tile.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu carrinho"),
      ),
      body: ScopedModelDescendant<CartModel>(
        builder: (context, child, model) {
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                childAspectRatio: 0.75,
              ),
              itemCount: model.products.length,
              itemBuilder: (context, index) =>
                  CartTile(model.products, index)
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: RaisedButton(
          child: Text("Enviar pedido"),
          onPressed: (){CartModel.of(context).createOrder(2);}
        ),
      ),
    );
  }
}
