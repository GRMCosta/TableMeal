import 'package:flutter/material.dart';
import 'package:mobile/JServices/restaurant_services.dart';
import 'package:mobile/Models/cart_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:mobile/tiles/cart_tile.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  static final _tableController = TextEditingController();
  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Meu carrinho"), centerTitle: true,
        actions: <Widget>[
          Container(
            width: 100.0,
            color: Colors.white,
            alignment: Alignment.center,
            child: TextFormField(
              decoration: InputDecoration(hintText: "Mesa",),
              controller: _tableController,
              keyboardType: TextInputType.number,
            ),
          ),
        ],

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
              itemBuilder: (context, index) => CartTile(model.products, index));
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 97, 0, 0),
        child: RaisedButton(
            color: Colors.black,
            child: Text(
              "Enviar pedido",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              if (_tableController.text.isNotEmpty) {
                CartModel.of(context).createOrder(
                    table: int.parse(_tableController.text),
                    onFail: onFail,
                    onSuccess: onSuccess);
              } else {
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text("Por gentileza identifique a mesa"),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 2)));
              }
            }),
      ),
    );
  }

  void onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Pedido enviado com sucesso"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2)));
  }

  void onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Falha ao enviar pedido"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2)));
  }
  }

