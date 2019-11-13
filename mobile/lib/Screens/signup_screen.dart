import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Criar Conta", style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(hintText: "Nome Completo"),
              validator: (text) {
                if (text.isEmpty) return "Nome Inválido";
                return null;
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "CPF"),
              keyboardType: TextInputType.number,
              validator: (text) {
                if (text.isEmpty || text.length < 11) return "CPF Inválido";
                return null;
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "E-mail"),
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text.isEmpty || text.contains("@"))
                  return "E-mail Inválido";
                return null;
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Senha"),
              obscureText: true,
              validator: (text) {
                if (text.isEmpty || text.length < 6) return "Senha Inválida";
                return null;
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                child: Text(
                  "Criar Conta",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  if (_formKey.currentState.validate()) {}
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
